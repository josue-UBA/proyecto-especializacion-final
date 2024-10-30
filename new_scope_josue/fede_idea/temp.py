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

        AA_bus = strings_to_bus(AA_strings, "A")
        DD_bus = strings_to_bus(DD_strings, "D")
        BB_bus = strings_to_bus(BB_strings, "B")
        CC_bus = strings_to_bus([], "C")

        prod2 = []
        for i in con["mult1"]:
            for j in con["mult2"]:
                prod2.append(
                    {
                        "num_width": len(bin(i["number"] * j["number"])) - 2,
                        "phase": i["phase"] + j["phase"],
                        "label": f'{i["label"]}{j["label"]}',
                        "number": i["number"] * j["number"],
                    }
                )

        print(f"{AA_bus:>150}")
        print("\t\t\t\t\t\t\t\t\t\t\t\t+")
        print(f"{DD_bus:>150}")
        print("\t\t\t\t\t\t\t\t\t\t\t\tx")
        print(f"{BB_bus:>150}")
        print("\t\t\t\t\t\t\t\t\t\t\t\t+")
        print(f"{CC_bus:>150}")
        print("\t\t\t\t\t\t\t\t\t\t\t\t=")

        base = [obj_to_decimal(i) for i in prod2]
        for i in range(1, 100):
            O_strings = [decimal_to_string(j * i) for j in base]
            OO_bus = strings_to_bus(O_strings, "O")
            OO_bus = f"iteration{i-1} {OO_bus}"
            print(f"{OO_bus:>150}")

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
        A_bus = ["□" for i in range(0, 30)]
        D_bus = ["□" for i in range(0, 27)]
        B_bus = ["□" for i in range(0, 18)]
        C_bus = ["□" for i in range(0, 48)]
        O_bus = ["□" for i in range(0, 48)]

        strings = [A_bus, B_bus, C_bus, D_bus, O_bus]
        max_length = max(len(s) for s in strings)

        def fill_buses():
            for i in con["mult1"]:
                if i["bus"] == "A":
                    for j in range(i["num_width"]):
                        A_bus[i["phase"] + j] = "■"
                else:
                    for j in range(i["num_width"]):
                        D_bus[i["phase"] + j] = "■"

            for i in con["mult2"]:
                for j in range(i["num_width"]):
                    B_bus[i["phase"] + j] = "■"

            for i in prod:
                for j in range(i["num_width"]):
                    if "■" in O_bus[i["phase"] + j]:
                        O_bus[i["phase"] + j] = "\033[31m■\033[0m"
                    else:
                        O_bus[i["phase"] + j] = "■"

        def print_buses():
            text_A = f"{' '.join(A_bus[::-1])} A - {len(A_bus)} bits"
            text_D = f"{' '.join(D_bus[::-1])} D - {len(D_bus)} bits"
            text_B = f"{' '.join(B_bus[::-1])} B - {len(B_bus)} bits"
            text_C = f"{' '.join(C_bus[::-1])} C - {len(C_bus)} bits"
            text_O = f"{' '.join(O_bus[::-1])} O - {len(O_bus)} bits"
            print(con["name"])
            print(f"{text_A:>150}")
            print("\t\t\t\t\t\t\t\t\t\t\t\t+")
            print(f"{text_D:>150}")
            print("\t\t\t\t\t\t\t\t\t\t\t\tx")
            print(f"{text_B:>150}")
            print("\t\t\t\t\t\t\t\t\t\t\t\t+")
            print(f"{text_C:>150}")
            print("\t\t\t\t\t\t\t\t\t\t\t\t=")
            print(f"{text_O:>150}")

        fill_buses()
        print_buses()

    else:
        print("configuration not found")


else:
    print("No se ha proporcionado ningún argumento.")


x = [i * 127 * 127 for i in range(1, 10)]
for n, i in enumerate(x):
    a = f"{i} {decimal_to_string(i)} \t((A + D) x B) + acumulacion {n}"
    print(f"{a:>100}")
