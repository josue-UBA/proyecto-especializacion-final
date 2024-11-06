import math
import obj


# create list of obs
def create_list_of_objs(width, number_of_words, window, bus):
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


# migrate to new file: program_logic
def create_list_of_configurations(width):

    number_of_words = 100  # max posible
    configurations = []
    window = 0

    while True:
        A_objs = create_list_of_objs(width=width, number_of_words=number_of_words, window=window, bus="A")

        # at least there must be two objs in a bus
        if len(A_objs) <= 1:
            break

        B_objs = [
            {
                "signed": False,
                "num_width": width,
                "bus": "B",
                "number": int(math.pow(2, width)) - 1,
                "phase": 0,
                "label": "b0",
                "MSB_position": 0,
                "LSB position": 0,
            }
        ]
        configurations.append(
            {
                "name": f"word width: {width} | phase: {window+width} | bus A window: {window}",
                "mult1": A_objs,
                "mult2": B_objs,
            }
        )

        window = window + 1

    return configurations
