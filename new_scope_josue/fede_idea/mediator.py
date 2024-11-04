import math
import sys
import conf_file
import obj
import adaptor
import frontend


# Verifica si se pasó un argumento
def analyze_configuration(con):

    # bus A ----------------------------------------
    A_strings = [
        adaptor.decimal_to_string(adaptor.obj_to_decimal(i))
        for i in con["mult1"]
        if i["bus"] == "A"
    ]
    A_bus = adaptor.strings_to_bus(A_strings, "A")

    # check if not overflow in bus A
    if obj.check_overflow(con["mult1"], "A")["overflow"]:
        return {"log": obj.check_overflow(con["mult1"], "A")["log"], "status": "error"}

    # bus D ----------------------------------------
    D_strings = [
        adaptor.decimal_to_string(adaptor.obj_to_decimal(i))
        for i in con["mult1"]
        if i["bus"] == "D"
    ]
    # should be empty if we are only working with positive numbers
    D_bus = adaptor.strings_to_bus(D_strings, "D")

    # bus B ----------------------------------------
    B_strings = [
        adaptor.decimal_to_string(adaptor.obj_to_decimal(i)) for i in con["mult2"]
    ]
    B_bus = adaptor.strings_to_bus(B_strings, "B")

    # bus C ----------------------------------------
    C_bus = adaptor.strings_to_bus([], "C")

    # bus O ----------------------------------------
    O_base_objs = []
    for i in con["mult1"]:
        for j in con["mult2"]:
            O_base_objs.append(obj.obj_times_obj(i, j))

    O_objs = [{} for i in range(len(O_base_objs))]

    # start accumulative sum
    buses = []
    for i in range(600):
        O_objs = [obj.obj_plus_obj(i, j) for i, j in zip(O_objs, O_base_objs)]

        buses.append(
            adaptor.strings_to_bus(
                [adaptor.decimal_to_string(adaptor.obj_to_decimal(i)) for i in O_objs],
                "O",
            )
        )

        if obj.check_overflow(O_objs, "O")["overflow"]:
            return {
                "data": {
                    "name": con["name"],
                    "A_bus": A_bus,
                    "D_bus": D_bus,
                    "B_bus": B_bus,
                    "C_bus": C_bus,
                    "buses": buses[:-1],
                    "O_base_objs": O_base_objs,
                },
                "log": obj.check_overflow(O_objs, "O")["log"],
                "status": "good",
            }

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


# use the config_file.py
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
        frontend.print_log({"log": "No argument provided.", "status": "error"})


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


def find_optimus_configuration():
    i = 0
    width = 6
    number_of_words = 8
    for _ in range(12):
        A_objs = create_configuration(
            width=width, number_of_words=number_of_words, window=i, bus="A"
        )

        s = adaptor.strings_to_bus(
            [adaptor.decimal_to_string(adaptor.obj_to_decimal(i)) for i in A_objs], "A"
        )
        if len(A_objs) <= 1:
            return

        i = i + 1

        configuration = {
            "name": "int8_18",
            "mult1": A_objs,
            "mult2": [
                {
                    "signed": False,
                    "num_width": width,
                    "bus": "B",
                    "number": int(math.pow(2, width)) - 1,
                    "phase": 0,
                    "label": "c",
                    "MSB_position": 0,
                    "LSB position": 0,
                }
            ],
        }
        frontend.print_analysis(analyze_configuration(configuration))


asd()
