import math
import sys
import conf_file
import obj
import adaptor
import frontend


# Verifica si se pasó un argumento
def analyze_configuration(con):

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
    D_bus = adaptor.strings_to_bus(
        D_strings, "D"
    )  # should be empty if we are only working with positive numbers
    B_bus = adaptor.strings_to_bus(B_strings, "B")
    C_bus = adaptor.strings_to_bus([], "C")

    # ---
    O_base_objs = []
    for i in con["mult1"]:
        for j in con["mult2"]:
            O_base_objs.append(obj.obj_times_obj(i, j))

    buses = []
    O_objs = [{} for i in range(len(O_base_objs))]
    for i in range(20):
        O_objs = [obj.obj_plus_obj(i, j) for i, j in zip(O_objs, O_base_objs)]

        if obj.check_overlap(O_objs)["overlap"]:
            break
        buses.append(
            adaptor.strings_to_bus(
                [adaptor.decimal_to_string(adaptor.obj_to_decimal(i)) for i in O_objs],
                "O",
            )
        )

    # print process
    frontend.print_analysis(
        con["name"],
        A_bus,
        D_bus,
        B_bus,
        C_bus,
        buses,
        obj.check_overlap(O_objs)["log"],
        O_base_objs,
    )


def start_analysis():
    if len(sys.argv) > 1:
        arg = sys.argv[1]

        if sys.argv[1] in [i["name"] for i in conf_file.configurations]:

            # select configuration
            con = [i for i in conf_file.configurations if i["name"] == sys.argv[1]][0]
            analyze_configuration(con)

        else:
            frontend.print_log({"log": "configuration not found"})

    else:
        frontend.print_log({"log": "No se ha proporcionado ningún argumento."})


start_analysis()
