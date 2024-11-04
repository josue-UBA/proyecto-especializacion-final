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
    for i in range(600):
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
        {
            "data": {
                "name": con["name"],
                "A_bus": A_bus,
                "D_bus": D_bus,
                "B_bus": B_bus,
                "C_bus": C_bus,
                "buses": buses,
                "O_base_objs": O_base_objs,
            },
            "log": obj.check_overlap(O_objs)["log"],
            "status": "good",
        }
    )


def start_analysis():
    if len(sys.argv) > 1:
        arg = sys.argv[1]

        if sys.argv[1] in [i["name"] for i in conf_file.configurations]:

            # select configuration
            configuration = [
                i for i in conf_file.configurations if i["name"] == sys.argv[1]
            ][0]
            analyze_configuration(configuration)

        else:
            frontend.print_log({"log": "configuration not found", "status": "error"})

    else:
        frontend.print_log(
            {"log": "No se ha proporcionado ningún argumento.", "status": "error"}
        )


def create_configuration(phase):
    num_width = 8

    return {
        "name": "int8",
        "mult1": [
            {
                "bus": "A",
                "num_width": num_width,
                "phase": 0,
                "label": "a",
                "signed": False,
                "number": int(math.pow(2, num_width)) - 1,
            },
            {
                "bus": "A",
                "num_width": num_width,
                "phase": phase,
                "label": "b",
                "signed": False,
                "number": int(math.pow(2, num_width)) - 1,
            },
        ],
        "mult2": [
            {
                "bus": "B",
                "num_width": num_width,
                "phase": 0,
                "label": "c",
                "signed": False,
                "number": int(math.pow(2, num_width)) - 1,
            },
        ],
    }


# start_analysis()
analyze_configuration(create_configuration(36))
