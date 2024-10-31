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
    if "-" in bin(num):
        return "S " + transrm

    return "s " + transrm


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


def print_analysis(con, AA_bus, DD_bus, BB_bus, CC_bus, buses):
    print("==============================================")
    print(f'{con["name"]}')
    print("==============================================\n")

    guia1 = (
        "3 3 3 2 2 2 2 2 2 2 2 2 2 1 1 1 1 1 1 1 1 1 1                               "
    )
    guia2 = (
        "2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1             "
    )
    print(f"{guia1:>150}")
    print(f"{guia2:>150}")

    print(f"{AA_bus:>150}")
    print("\t\t\t\t\t\t\t\t\t\t\t\t+")
    print(f"{DD_bus:>150}")
    print("\t\t\t\t\t\t\t\t\t\t\t\tx")
    print(f"{BB_bus:>150}")
    print("\t\t\t\t\t\t\t\t\t\t\t\t+")
    print(f"{CC_bus:>150}")
    print("\t\t\t\t\t\t\t\t\t\t\t\t=")

    for i, n in enumerate(buses):
        itera = f"iteration {i} {n}"
        print(f"{itera:>150}")

    print()
    print()
    print()
    prod = []

    # delete
    for i in con["mult1"]:
        for j in con["mult2"]:
            new_phase = i["phase"] + j["phase"]
            new_max_width = i["num_width"] + j["num_width"]
            prod.append(
                {
                    "num_width": new_max_width,
                    "phase": new_phase,
                    "label": f'{i["label"]}{j["label"]}',
                }
            )

    # fill with empty squares

    O_bus = ["□" for i in range(0, 48)]

    for i in prod:
        for j in range(i["num_width"]):
            if "■" in O_bus[i["phase"] + j]:
                O_bus[i["phase"] + j] = "\033[31m■\033[0m"
            else:
                O_bus[i["phase"] + j] = "■"

    text_O = f"{' '.join(O_bus[::-1])}  O - {len(O_bus)} bits"

    print(f"{text_O:>150}")


# Verifica si se pasó un argumento
if len(sys.argv) > 1:
    arg = sys.argv[1]

    if sys.argv[1] in [i["name"] for i in configurations]:
        con = [i for i in configurations if i["name"] == sys.argv[1]][0]

        AA_strings = [
            decimal_to_string(obj_to_decimal(i))
            for i in con["mult1"]
            if i["bus"] == "A"
        ]
        DD_strings = [
            decimal_to_string(obj_to_decimal(i))
            for i in con["mult1"]
            if i["bus"] == "D"
        ]
        BB_strings = [decimal_to_string(obj_to_decimal(i)) for i in con["mult2"]]

        A_bus = strings_to_bus(AA_strings, "A")
        D_bus = strings_to_bus(DD_strings, "D")
        B_bus = strings_to_bus(BB_strings, "B")
        C_bus = strings_to_bus([], "C")

        prod2 = []
        for i in con["mult1"]:
            for j in con["mult2"]:
                num_width = len(bin(i["number"] * j["number"])) - 1
                phase = i["phase"] + j["phase"]
                prod2.append(
                    {
                        "bus": "O",
                        "num_width": num_width,
                        "phase": phase,
                        "label": f'{i["label"]}{j["label"]}',
                        "number": i["number"] * j["number"],
                        "MSB": phase + num_width,
                        "LSB": phase + 1,
                    }
                )
        buses = []
        base = [obj_to_decimal(i) for i in prod2]
        for i in range(1, 10):
            O_strings = [decimal_to_string(j * i) for j in base]
            O_bus = strings_to_bus(O_strings, "O")
            buses.append(O_bus)

        print_analysis(con, A_bus, D_bus, B_bus, C_bus, buses)
        print("finish")

    else:
        print("configuration not found")


else:
    print("No se ha proporcionado ningún argumento.")
