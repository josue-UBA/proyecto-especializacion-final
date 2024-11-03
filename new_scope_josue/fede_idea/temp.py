import sys
import conf_file
import obj
import adaptor


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
    b = ["|" if i in a else "-" for i in range(1, 48)] + ["|"]
    c = " ".join(b)[::-1]
    print(f"{c:>137}")
    for n, i in enumerate(buses):
        itera = f"iteration {n} {i}"
        print(f"{itera:>150}")
    print()
    print(log)


# Verifica si se pasó un argumento
if len(sys.argv) > 1:
    arg = sys.argv[1]

    if sys.argv[1] in [i["name"] for i in conf_file.configurations]:

        # select configuration
        con = [i for i in conf_file.configurations if i["name"] == sys.argv[1]][0]

        # generate A, D, B, and C buses
        A_strings = [
            adaptor.decimal_to_string(adaptor.obj_to_decimal(i))
            for i in con["mult1"]
            if i["bus"] == "A"
        ]
        D_strings = [
            adaptor.decimal_to_string(adaptor.obj_to_decimal(i))
            for i in con["mult1"]
            if i["bus"] == "D"
        ]
        B_strings = [
            adaptor.decimal_to_string(adaptor.obj_to_decimal(i)) for i in con["mult2"]
        ]

        A_bus = adaptor.strings_to_bus(A_strings, "A")
        D_bus = adaptor.strings_to_bus(D_strings, "D")
        B_bus = adaptor.strings_to_bus(B_strings, "B")
        C_bus = adaptor.strings_to_bus([], "C")

        # ---
        O_base_objs = []
        for i in con["mult1"]:
            for j in con["mult2"]:
                O_base_objs.append(obj.obj_times_obj(i, j))

        buses = []
        O_objs = [{} for i in range(len(O_base_objs))]
        for i in range(500):
            O_objs = [obj.obj_plus_obj(i, j) for i, j in zip(O_objs, O_base_objs)]

            buses.append(
                adaptor.strings_to_bus(
                    [
                        adaptor.decimal_to_string(adaptor.obj_to_decimal(i))
                        for i in O_objs
                    ],
                    "O",
                )
            )
            log = obj.check_overlap(O_objs)["log"]
            overlap = obj.check_overlap(O_objs)["overlap"]
            if overlap:
                print(obj.check_overlap(O_objs)["log"])
                break

        # print process
        print_analysis(con["name"], A_bus, D_bus, B_bus, C_bus, buses, log, O_base_objs)

    else:
        print("configuration not found")


else:
    print("No se ha proporcionado ningún argumento.")
