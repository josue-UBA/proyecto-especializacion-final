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

    # check if not overflow in bus A
    if obj.check_overflow(con["mult1"], "A")["overflow"]:
        frontend.print_log(obj.check_overflow(con["mult1"], "A")["log"])
        return

    # generate O objs
    O_base_objs = []
    for i in con["mult1"]:
        for j in con["mult2"]:
            O_base_objs.append(obj.obj_times_obj(i, j))

    O_objs = [{} for i in range(len(O_base_objs))]

    # start accumulative sum
    buses = []
    for i in range(600):
        O_objs = [obj.obj_plus_obj(i, j) for i, j in zip(O_objs, O_base_objs)]

        if obj.check_overflow(O_objs, "O")["overflow"]:
            break

        buses.append(
            adaptor.strings_to_bus(
                [adaptor.decimal_to_string(adaptor.obj_to_decimal(i)) for i in O_objs],
                "O",
            )
        )

    # print process
    return {
        "data": {
            "name": con["name"],
            "A_bus": A_bus,
            "D_bus": D_bus,
            "B_bus": B_bus,
            "C_bus": C_bus,
            "buses": buses,
            "O_base_objs": O_base_objs,
        },
        "log": obj.check_overflow(O_objs, "O")["log"],
        "status": "good",
    }


def start_analysis():
    if len(sys.argv) > 1:
        arg = sys.argv[1]

        if sys.argv[1] in [i["name"] for i in conf_file.configurations]:

            # select configuration
            configuration = [
                i for i in conf_file.configurations if i["name"] == sys.argv[1]
            ][0]
            frontend.print_analysis(analyze_configuration(configuration))

        else:
            frontend.print_log({"log": "Configuration not found.", "status": "error"})

    else:
        frontend.print_log(
            {"log": "No argument provided.", "status": "error"}
        )


def create_configuration(width, number_of_words, window, bus):
    """

    width: 5
    |---|
    xxxxx

    phase: 11
         <---------|
    xxxxx------xxxxx

    window: 6
         |----|
    xxxxx------xxxxx

    """

    aux_objs = []

    for i in range(number_of_words):
        # added
        signed = False
        num_width = width

        # clasic
        bus = bus
        number = int(math.pow(2, num_width)) - 1
        phase = (window + num_width) * i
        label = f"{bus.lower()}{i}"
        MSB_position = len(bin(number)) - 2 + phase
        LSB_position = phase + 1

        aux_objs.append(
            {
                "bus": bus,
                "number": number,
                "phase": phase,
                "label": label,
                "MSB_position": MSB_position,
                "LSB_position": LSB_position,
            }
        )

        if obj.check_overflow(aux_objs, bus)["overflow"]:
            return aux_objs[:-1]

    return aux_objs


# start_analysis()
we = create_configuration(4, 3, 9, "A")

s = adaptor.strings_to_bus(
    [adaptor.decimal_to_string(adaptor.obj_to_decimal(i)) for i in we], "A"
)
print(s)
