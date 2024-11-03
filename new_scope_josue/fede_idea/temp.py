import sys
from conf_file import configurations


def obj_to_decimal(obj):
    phase = pow(2, obj["phase"])
    num = obj["number"]
    return phase * num


# def objs_to_decimal(mult):
#     full_bus = 0
#     for i in mult:
#         full_bus = full_bus + obj_to_decimal(i)
#     return full_bus


# def objs_to_strings(mult):
#     strings = []
#     for i in mult:
#         strings.append(decimal_to_string(obj_to_decimal(i)))
#     return strings


def decimal_to_string(num):
    transrm = " ".join(["■" if i == "1" else "□" for i in list(bin(num).split("b")[1])])
    return transrm


def strings_to_bus(strings, bus):
    ordered_strings = sorted(strings, key=len)
    ordered_strings = [i.split(" ") for i in ordered_strings]
    # asumo que se comienza por el menor
    aux = []
    for string in ordered_strings:
        for i in string[len(string) - len(aux) - 1 :: -1]:
            if i not in "S" or i not in "s":
                aux.append(i)
            else:
                break

    info = ""

    if bus == "A":
        aux = aux + ["□" for _ in range(30 - len(aux))]
        info = " A - 30 bits"
    elif bus == "D":
        aux = aux + ["□" for _ in range(27 - len(aux))]
        info = " D - 27 bits"
    elif bus == "B":
        aux = aux + ["□" for _ in range(18 - len(aux))]
        info = " B - 18 bits"
    elif bus == "C":
        aux = aux + ["□" for _ in range(48 - len(aux))]
        info = " C - 48 bits"
    elif bus == "O":
        aux = aux + ["□" for _ in range(48 - len(aux))]
        info = " O - 48 bits"
    return f'{" ".join(aux[::-1])} {info}'


def print_analysis(name, A_bus, D_bus, B_bus, C_bus, buses, log, O_base_objs):

    print("==============================================")
    print(f"{name}")
    print("==============================================\n")

    guia1 = (
        "3 3 3 2 2 2 2 2 2 2 2 2 2 1 1 1 1 1 1 1 1 1 1                               "
    )
    guia2 = (
        "2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1             "
    )
    print(f"{guia1:>150}")
    print(f"{guia2:>150}")

    print(f"{A_bus:>150}")
    print("\t\t\t\t\t\t\t\t\t\t\t\t+")
    print(f"{D_bus:>150}")
    print("\t\t\t\t\t\t\t\t\t\t\t\tx")
    print(f"{B_bus:>150}")
    print("\t\t\t\t\t\t\t\t\t\t\t\t+")
    print(f"{C_bus:>150}")
    print("\t\t\t\t\t\t\t\t\t\t\t\t=")

    a = [i["LSB"] for i in O_base_objs] + [i["LSB"] - 1 for i in O_base_objs]
    b = ["|" if i in a else "-" for i in range(1, 49)]
    c = " ".join(b)[::-1]
    print(f"{c:>137}")
    for n, i in enumerate(buses):
        itera = f"iteration {n} {i}"
        print(f"{itera:>150}")
    print()
    print(log)


def obj_times_obj(a_obj, b_obj):
    bus = "O"
    number = a_obj["number"] * b_obj["number"]
    phase = a_obj["phase"] + b_obj["phase"]
    label = f'{a_obj["label"]}{b_obj["label"]}'
    MSB = len(bin(number)) - 2 + phase
    LSB = phase + 1
    return {
        "bus": bus,
        "number": number,
        "phase": phase,
        "label": label,
        "MSB": MSB,
        "LSB": LSB,
    }


def obj_plus_obj(a_obj, b_obj):

    if not a_obj and not b_obj:
        return print("no data!")
    if not a_obj:
        return b_obj
    if not b_obj:
        return a_obj

    """
    only sum obj that have the same phase
    """
    if a_obj["phase"] == b_obj["phase"]:
        bus = "O"
        number = a_obj["number"] + b_obj["number"]
        phase = a_obj["phase"]  # any phase of the objects
        label = f'{a_obj["label"]} + {b_obj["label"]}'
        MSB = len(bin(number)) - 1 + phase
        LSB = phase + 1
        return {
            "bus": bus,
            "number": number,
            "phase": phase,
            "label": label,
            "MSB": MSB,
            "LSB": LSB,
        }
    else:
        print("objs doesn't have the same phase")


def check_overlap(objs):

    for n, obj1 in enumerate(objs):
        for obj2 in objs[n + 1 :]:
            """
            case 1
                |-------|       obj1
            |-------|           obj2

            case 2
                |-------|       obj1
                    |-------|   obj2

            case 3
                |-------|       obj1
            |---------------|   obj2

            case 4
            |---------------|   obj1
                |-------|       obj2

            """

            # case 1
            if obj2["LSB"] < obj1["LSB"] < obj2["MSB"] and obj2["MSB"] < obj1["MSB"]:
                return {"overlap": True, "log": f"case 1"}
            # case 2
            if obj2["LSB"] < obj1["MSB"] < obj2["MSB"] and obj1["LSB"] < obj2["LSB"]:
                return {"overlap": True, "log": f"case 2"}
            # case 3
            if (
                obj2["LSB"] < obj1["LSB"] < obj2["MSB"]
                and obj2["LSB"] < obj1["MSB"] < obj2["MSB"]
            ):
                return {"overlap": True, "log": f"case 3"}
            # case 4
            if (
                obj1["LSB"] < obj2["LSB"] < obj1["MSB"]
                and obj1["LSB"] < obj2["MSB"] < obj1["MSB"]
            ):
                return {"overlap": True, "log": f"case 4"}

    return {"overlap": False, "log": f"no overlap"}


# Verifica si se pasó un argumento
if len(sys.argv) > 1:
    arg = sys.argv[1]

    if sys.argv[1] in [i["name"] for i in configurations]:

        # select configuration
        con = [i for i in configurations if i["name"] == sys.argv[1]][0]

        # generate A, D, B, and C buses
        A_strings = [
            decimal_to_string(obj_to_decimal(i))
            for i in con["mult1"]
            if i["bus"] == "A"
        ]
        D_strings = [
            decimal_to_string(obj_to_decimal(i))
            for i in con["mult1"]
            if i["bus"] == "D"
        ]
        B_strings = [decimal_to_string(obj_to_decimal(i)) for i in con["mult2"]]

        A_bus = strings_to_bus(A_strings, "A")
        D_bus = strings_to_bus(D_strings, "D")
        B_bus = strings_to_bus(B_strings, "B")
        C_bus = strings_to_bus([], "C")

        # ---
        O_base_objs = []
        for i in con["mult1"]:
            for j in con["mult2"]:
                O_base_objs.append(obj_times_obj(i, j))

        buses = []
        O_objs = [{} for i in range(len(O_base_objs))]
        for i in range(500):
            O_objs = [obj_plus_obj(i, j) for i, j in zip(O_objs, O_base_objs)]

            buses.append(
                strings_to_bus(
                    [decimal_to_string(obj_to_decimal(i)) for i in O_objs], "O"
                )
            )
            log = check_overlap(O_objs)["log"]
            overlap = check_overlap(O_objs)["overlap"]
            if overlap:
                print(check_overlap(O_objs)["log"])
                break

        # print process
        print_analysis(con["name"], A_bus, D_bus, B_bus, C_bus, buses, log, O_base_objs)

    else:
        print("configuration not found")


else:
    print("No se ha proporcionado ningún argumento.")
