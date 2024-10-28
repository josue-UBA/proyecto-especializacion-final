mult1 = [
    {"num_width": 2, "phase": 8, "label": "a"},
    {"num_width": 2, "phase": 0, "label": "b"},
]

mult2 = [
    {"num_width": 2, "phase": 8, "label": "c"},
]

prod = []

for i in mult1:
    for j in mult2:
        new_phase = i["phase"] + j["phase"]
        prod.append(
            {"num_width": 2, "phase": new_phase, "label": f'{i["label"]}{j["label"]}'}
        )
        # print(f'name: {i["label"]}{j["label"]} - new phase:{new_phase}')


A_bus = ["□" for i in range(0, 30)]
D_bus = ["□" for i in range(0, 27)]
B_bus = ["□" for i in range(0, 18)]
C_bus = ["□" for i in range(0, 48)]
O_bus = ["□" for i in range(0, 48)]

strings = [A_bus, B_bus, C_bus, D_bus, O_bus]
max_length = max(len(s) for s in strings)

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
    print(f"{' '.join(A_bus[::-1])} A - {len(A_bus)} bits")
    print("+")
    print(f"{' '.join(D_bus)} D - {len(D_bus)} bits")
    print("x")
    print(f"{' '.join(B_bus)} B - {len(B_bus)} bits")
    print("+")
    print(f"{' '.join(C_bus)} C - {len(C_bus)} bits")
    print("=")
    print(f"{' '.join(O_bus)} B - {len(O_bus)} bits")


print_buses()
