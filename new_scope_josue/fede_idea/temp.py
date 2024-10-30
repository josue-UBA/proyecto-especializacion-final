import sys


def obj_to_decimal(obj):
    phase = pow(2, obj["phase"])
    num = pow(2, obj["num_width"] - (1 if obj["signed"] else 0)) - 1
    return phase * num


# def objs_to_decimal(mult):
#     full_bus = 0
#     for i in mult:
#         full_bus = full_bus + obj_to_decimal(i)
#     return full_bus


def objs_to_strings(mult):
    strings = []
    for i in mult:
        strings.append(decimal_to_string(obj_to_decimal(i)))
    return strings


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
        for i in string[len(string) - len(aux) :: -1]:
            if i not in "S" or i not in "s":
                aux.append(i)
            else:
                break

    if bus == "A":
        aux = aux + ["□" for _ in range(30 - len(aux))]
    elif bus == "D":
        aux = aux + ["□" for _ in range(27 - len(aux))]
    elif bus == "B":
        aux = aux + ["□" for _ in range(18 - len(aux))]
    elif bus == "C":
        aux = aux + ["□" for _ in range(48 - len(aux))]
    elif bus == "O":
        aux = aux + ["□" for _ in range(48 - len(aux))]
    return " ".join(aux[::-1])


# Verifica si se pasó un argumento
if len(sys.argv) > 1:
    arg = sys.argv[1]

    configurations = [
        {
            "name": "int4",
            "mult1": [
                {
                    "bus": "A",
                    "num_width": 4,
                    "phase": 0,
                    "label": "a",
                    "signed": True,
                },  # obj
                {"bus": "D", "num_width": 4, "phase": 22, "label": "b", "signed": True},
            ],
            "mult2": [
                {"bus": "B", "num_width": 4, "phase": 0, "label": "c", "signed": True},
                {"bus": "B", "num_width": 4, "phase": 11, "label": "d", "signed": True},
            ],
        },
        {
            "name": "int8",
            "mult1": [
                {"bus": "D", "num_width": 8, "phase": 0, "label": "a", "signed": True},
                {"bus": "A", "num_width": 8, "phase": 18, "label": "b", "signed": True},
            ],
            "mult2": [
                {"bus": "B", "num_width": 8, "phase": 0, "label": "c", "signed": True},
            ],
        },
        {
            "name": "int5",
            "mult1": [
                {"bus": "A", "num_width": 5, "phase": 24, "label": "a", "signed": True},
                {"bus": "D", "num_width": 5, "phase": 0, "label": "b", "signed": True},
            ],
            "mult2": [
                {"bus": "B", "num_width": 5, "phase": 0, "label": "c", "signed": True},
                {"bus": "B", "num_width": 5, "phase": 12, "label": "d", "signed": True},
            ],
        },
        {
            "name": "intX",
            "mult1": [
                {"bus": "A", "num_width": 2, "phase": 24, "label": "a", "signed": True},
                {"bus": "A", "num_width": 2, "phase": 12, "label": "b", "signed": True},
                {"bus": "D", "num_width": 2, "phase": 0, "label": "b", "signed": True},
            ],
            "mult2": [
                {"bus": "B", "num_width": 2, "phase": 0, "label": "c", "signed": True},
                {"bus": "B", "num_width": 2, "phase": 6, "label": "d", "signed": True},
            ],
        },
    ]
    if sys.argv[1] in [i["name"] for i in configurations]:
        con = [i for i in configurations if i["name"] == sys.argv[1]][0]

        AA_objects = [i for i in con["mult1"] if i["bus"] == "A"]
        DD_objects = [i for i in con["mult1"] if i["bus"] == "D"]
        BB_objects = con["mult2"]

        AA_strings = objs_to_strings(AA_objects)
        DD_strings = objs_to_strings(DD_objects)
        BB_strings = objs_to_strings(BB_objects)

        AA_bus = strings_to_bus(AA_strings, "A")
        DD_bus = strings_to_bus(DD_strings, "D")
        BB_bus = strings_to_bus(BB_strings, "B")
        CC_bus = strings_to_bus([], "C")
        OO_bus = strings_to_bus([], "O")

        print(f"{AA_bus:>138} A - 30 bits")
        print("\t\t\t\t\t\t\t\t\t\t\t\t+")
        print(f"{DD_bus:>138} D - 27 bits")
        print("\t\t\t\t\t\t\t\t\t\t\t\tx")
        print(f"{BB_bus:>138} B - 18 bits")
        print("\t\t\t\t\t\t\t\t\t\t\t\t+")
        print(f"{CC_bus:>138} C - 48 bits")
        print("\t\t\t\t\t\t\t\t\t\t\t\t=")
        print(f"{OO_bus:>138} O - 48 bits")
        print()
        print()
        print()
        prod = []

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
