import sys
import pandas as pd

import conf_file
import obj
import adaptor
import frontend
import factory


# Verifica si se pasó un argumento
def analyze_configuration(configuration):

    # bus A ----------------------------------------
    A_strings = [adaptor.decimal_to_string(adaptor.obj_to_decimal(i)) for i in configuration["mult1"] if i["bus"] == "A"]
    A_bus = adaptor.strings_to_bus(A_strings, "A")

    # check if not overflow in bus A
    if obj.check_overflow(configuration["mult1"], "A")["overflow"]:
        return {"log": obj.check_overflow(configuration["mult1"], "A")["log"], "status": "error"}

    # bus D ----------------------------------------
    D_strings = [adaptor.decimal_to_string(adaptor.obj_to_decimal(i)) for i in configuration["mult1"] if i["bus"] == "D"]
    # should be empty if we are only working with positive numbers
    D_bus = adaptor.strings_to_bus(D_strings, "D")

    # bus B ----------------------------------------
    B_strings = [adaptor.decimal_to_string(adaptor.obj_to_decimal(i)) for i in configuration["mult2"]]
    B_bus = adaptor.strings_to_bus(B_strings, "B")

    # bus C ----------------------------------------
    C_bus = adaptor.strings_to_bus([], "C")

    # bus O ----------------------------------------
    O_base_objs = []
    for i in configuration["mult1"]:
        for j in configuration["mult2"]:
            O_base_objs.append(obj.obj_times_obj(i, j))

    O_objs = [{} for i in range(len(O_base_objs))]

    # start accumulative sum
    buses = []

    max_accumulations = 10000
    for k in range(max_accumulations):
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
                    "name": configuration["name"],
                    "A_bus": A_bus,
                    "D_bus": D_bus,
                    "B_bus": B_bus,
                    "C_bus": C_bus,
                    "buses": buses[:-1],
                    "O_base_objs": O_base_objs,
                    "iteration": k - 1,
                },
                "log": obj.check_overflow(O_objs, "O")["log"],
                "status": "good",
            }

    # print process
    return {
        "data": {
            "name": configuration["name"],
            "A_bus": A_bus,
            "D_bus": D_bus,
            "B_bus": B_bus,
            "C_bus": C_bus,
            "buses": buses,
            "O_base_objs": O_base_objs,
            "iteration": f"+{max_accumulations}",
        },
        "log": f"more than {max_accumulations} accumulations",
        "status": "error",
    }


# use the config_file.py
def analyze_configuration_user():
    if len(sys.argv) > 1:
        arg = sys.argv[1]

        if sys.argv[1] in [i["name"] for i in conf_file.configurations]:

            # select configuration
            configuration = [i for i in conf_file.configurations if i["name"] == sys.argv[1]][0]
            frontend.print_analysis(analyze_configuration(configuration))

        else:
            frontend.print_log({"log": "Configuration not found.", "status": "error"})

    else:
        frontend.print_log({"log": "No argument provided.", "status": "error"})


# migrate to new file: program_logic
def analyze_configurations_user(width):

    to_dataframe = {
        "name": [],
        "width": [],
        "A_words": [],
        "B_words": [],
        "total_words": [],
        "A_phases": [],
        "B_phases": [],
        "A_window": [],
        "B_window": [],
        "max_number_of_accumulation": [],
        "reason_for_stopping_the_accumulation": [],
    }

    configurations = factory.create_list_of_configurations(width)

    for configuration in configurations:

        data = analyze_configuration(configuration)

        if data["data"]["iteration"] not in [-1, 0]:
            to_dataframe["name"].append(configuration["name"])
            to_dataframe["width"].append(width)
            to_dataframe["A_words"].append(len(configuration["mult1"]))
            to_dataframe["B_words"].append(len(configuration["mult2"]))
            to_dataframe["total_words"].append(len(configuration["mult1"]) + len(configuration["mult2"]))
            to_dataframe["A_phases"].append([(configuration["A_window"] + width) * j for j in range(len(configuration["mult1"]))])
            to_dataframe["B_phases"].append([(configuration["B_window"] + width) * j for j in range(len(configuration["mult2"]))])
            to_dataframe["A_window"].append(configuration["A_window"])
            to_dataframe["B_window"].append(configuration["B_window"])
            to_dataframe["max_number_of_accumulation"].append(data["data"]["iteration"])
            to_dataframe["reason_for_stopping_the_accumulation"].append(data["log"])

        # data["data"]["O_window"]

        # frontend.print_analysis(data)

    pd.DataFrame(data=to_dataframe).to_csv(f"./data/analysis {width}.csv", index=False)

    print({"log": "ok!", "type": "success"})


for i in [2, 3, 4, 5, 6, 7, 8]:
    analyze_configurations_user(i)
