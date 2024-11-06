import adaptor
import conf_file
import math
import obj
from itertools import count


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

    max_number_of_words = 100  # max posible
    configurations = []

    for A_window in count():
        for B_window in count():

            A_objs = create_list_of_objs(width=width, number_of_words=max_number_of_words, window=A_window, bus="A")
            B_objs = create_list_of_objs(width=width, number_of_words=max_number_of_words, window=B_window, bus="B")

            A_bus = adaptor.strings_to_bus([adaptor.decimal_to_string(adaptor.obj_to_decimal(i)) for i in A_objs], "A")
            B_bus = adaptor.strings_to_bus([adaptor.decimal_to_string(adaptor.obj_to_decimal(i)) for i in B_objs], "B")
            print(f"{A_bus:>{conf_file.LEFT_SPACE}}")
            print(f"{B_bus:>{conf_file.LEFT_SPACE}}")
            print()

            configurations.append(
                {
                    "name": f"word width: {width} | bus A window: {A_window} | bus B window: {B_window}",
                    "mult1": A_objs,
                    "mult2": B_objs,
                    "A_window": A_window,
                    "B_window": B_window,
                }
            )
            if len(B_objs) == 1:
                break
        if len(A_objs) == 1:
            return configurations

    return {"log": "you should never reach this point", "type": "error"}
