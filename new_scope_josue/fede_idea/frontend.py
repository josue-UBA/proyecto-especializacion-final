import conf_file


def print_log(log):
    print(log)


def print_analysis(name, A_bus, D_bus, B_bus, C_bus, buses, log, O_base_objs):

    print("==============================================")
    print(f"{name}")
    print("==============================================\n")

    guia1 = "4 4 4 4 4 4 4 4 4 3 3 3 3 3 3 3 3 3 3 2 2 2 2 2 2 2 2 2 2 1 1 1 1 1 1 1 1 1 1                               "
    guia2 = "8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1             "
    print(f"{guia1:>{conf_file.LEFT_SPACE}}")
    print(f"{guia2:>{conf_file.LEFT_SPACE}}")

    print(f"{A_bus:>{conf_file.LEFT_SPACE}}")
    print("\t\t\t\t\t\t\t\t\t\t\t\t+")
    print(f"{D_bus:>{conf_file.LEFT_SPACE}}")
    print("\t\t\t\t\t\t\t\t\t\t\t\tx")
    print(f"{B_bus:>{conf_file.LEFT_SPACE}}")
    print("\t\t\t\t\t\t\t\t\t\t\t\t+")
    print(f"{C_bus:>{conf_file.LEFT_SPACE}}")
    print("\t\t\t\t\t\t\t\t\t\t\t\t=")

    a = [i["LSB_position"] for i in O_base_objs] + [
        i["LSB_position"] - 1 for i in O_base_objs
    ]
    b = [
        "|" if i in a else "-" for i in range(1, conf_file.buses_metadata["O"]["width"])
    ] + ["|"]
    c = " ".join(b)[::-1]

    print(f"{c:>{conf_file.LEFT_SPACE-13}}")
    for n, i in enumerate(buses):
        itera = f"iteration {n} {i}"
        print(f"{itera:>{conf_file.LEFT_SPACE}}")
    print()
    print(log)
