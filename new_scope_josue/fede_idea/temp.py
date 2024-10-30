import sys

# Verifica si se pasó un argumento
if len(sys.argv) > 1:
    arg = sys.argv[1]

    configurations = [
        {
            "name": "int4",
            "mult1": [
                {"bus": "A", "num_width": 4, "phase": 0, "label": "a"},
                {"bus": "D", "num_width": 4, "phase": 22, "label": "b"},
            ],
            "mult2": [
                {"bus": "B", "num_width": 4, "phase": 0, "label": "c"},
                {"bus": "B", "num_width": 4, "phase": 11, "label": "d"},
            ],
        },
        {
            "name": "int8",
            "mult1": [
                {"bus": "D", "num_width": 8, "phase": 0, "label": "a"},
                {"bus": "A", "num_width": 8, "phase": 18, "label": "b"},
            ],
            "mult2": [
                {"bus": "B", "num_width": 8, "phase": 0, "label": "c"},
            ],
        },
        {
            "name": "int5",
            "mult1": [
                {"bus": "A", "num_width": 5, "phase": 24, "label": "a"},
                {"bus": "D", "num_width": 5, "phase": 0, "label": "b"},
            ],
            "mult2": [
                {"bus": "B", "num_width": 5, "phase": 0, "label": "c"},
                {"bus": "B", "num_width": 5, "phase": 12, "label": "d"},
            ],
        },
        {
            "name": "intX",
            "mult1": [
                {"bus": "A", "num_width": 2, "phase": 24, "label": "a"},
                {"bus": "A", "num_width": 2, "phase": 12, "label": "b"},
                {"bus": "D", "num_width": 2, "phase": 0, "label": "b"},
            ],
            "mult2": [
                {"bus": "B", "num_width": 2, "phase": 0, "label": "c"},
                {"bus": "B", "num_width": 2, "phase": 6, "label": "d"},
            ],
        },
    ]
    if sys.argv[1] in [i["name"] for i in configurations]:
        con = [i for i in configurations if i["name"] == sys.argv[1]][0]

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


def transform_num(num):
    return " ".join(["■" if i == "1" else "□" for i in list(bin(num).split("b")[1])])


x = [i * 127 * 127 for i in range(1, 10)]
for n, i in enumerate(x):
    a = f"{i} {transform_num(i)} \t((A + D) x B) + acumulacion {n}"
    print(f"{a:>100}")
