mult1 = [
    {"num_width": 2, "phase": 8, "label": "a"},
    {"num_width": 2, "phase": 0, "label": "b"},
]

mult2 = [
    {"num_width": 2, "phase": 13, "label": "c"},
    {"num_width": 2, "phase": 0, "label": "c"},
]

prod = []

for i in mult1:
    for j in mult2:
        new_phase = i["phase"] + j["phase"]
        new_max_width = i["num_width"] + j["num_width"]
        prod.append(
            {
                "num_width": new_max_width,
                "phase": new_phase,
                "label": f'{i["label"]}{j["label"]}',
            }
        )
        # print(f'name: {i["label"]}{j["label"]} - new phase:{new_phase}')


A_bus = ["□" for i in range(0, 30)]
D_bus = ["□" for i in range(0, 27)]
B_bus = ["□" for i in range(0, 18)]
C_bus = ["□" for i in range(0, 48)]
O_bus = ["□" for i in range(0, 48)]

strings = [A_bus, B_bus, C_bus, D_bus, O_bus]
max_length = max(len(s) for s in strings)


def fill_buses():
    for i in mult1:
        for j in range(i["num_width"]):
            A_bus[i["phase"] + j] = "■"

    for i in mult2:
        for j in range(i["num_width"]):
            B_bus[i["phase"] + j] = "■"

    for i in prod:
        for j in range(i["num_width"]):
            O_bus[i["phase"] + j] = "■"


def print_buses():
    text_A = f"{' '.join(A_bus[::-1])} A - {len(A_bus)} bits"
    text_D = f"{' '.join(D_bus[::-1])} D - {len(D_bus)} bits"
    text_B = f"{' '.join(B_bus[::-1])} B - {len(B_bus)} bits"
    text_C = f"{' '.join(C_bus[::-1])} C - {len(C_bus)} bits"
    text_O = f"{' '.join(O_bus[::-1])} B - {len(O_bus)} bits"
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
