import conf_file


def obj_times_obj(a_obj, b_obj):
    bus = "O"
    number = a_obj["number"] * b_obj["number"]
    phase = a_obj["phase"] + b_obj["phase"]
    label = f'{a_obj["label"]}{b_obj["label"]}'
    MSB_position = len(bin(number)) - 2 + phase
    LSB_position = phase + 1
    return {
        "bus": bus,
        "number": number,
        "phase": phase,
        "label": label,
        "MSB_position": MSB_position,
        "LSB_position": LSB_position,
    }


def obj_plus_obj(a_obj, b_obj):

    if not a_obj and not b_obj:
        return print("no data!")
    if not a_obj:
        return b_obj
    if not b_obj:
        return a_obj

    """
    only sum obj that have the same phase
    """
    if a_obj["phase"] == b_obj["phase"]:
        bus = "O"
        number = a_obj["number"] + b_obj["number"]
        phase = a_obj["phase"]  # any phase of the objects
        label = f'{a_obj["label"]} + {b_obj["label"]}'
        MSB_position = len(bin(number)) - 2 + phase
        LSB_position = phase + 1
        return {
            "bus": bus,
            "number": number,
            "phase": phase,
            "label": label,
            "MSB_position": MSB_position,
            "LSB_position": LSB_position,
        }
    else:
        print("objs doesn't have the same phase")


def check_overlap(objs):

    # you are only checking overlap in bus O, requires analysis over buses A,D,B,C
    # rename to overflow
    for obj in objs:
        if conf_file.buses_metadata["O"]["width"] < obj["MSB_position"]:
            return {"overlap": True, "log": f"greatter that bus O"}

    for n, obj1 in enumerate(objs):
        for obj2 in objs[n + 1 :]:
            """
            L = LSB
            M = MSB

            case 1
                |-------|       obj1
                M       L
                    |-------|   obj2
                    M       L

            case 2
                |-------|       obj1
                M       L
            |-------|           obj2
            M       L

            case 3
                |-------|       obj1
                M       L
            |---------------|   obj2
            M               L

            case 4
            |---------------|   obj1
            M               L
                |-------|       obj2
                M       L

            case 5
                    |-------|   obj1
                    M       L
            |-------|           obj2
            M       L

            case 6
            |-------|           obj1
            M       L
                    |-------|   obj2
                    M       L
            """

            # case 1
            if (
                obj2["LSB_position"] < obj1["LSB_position"] < obj2["MSB_position"]
                and obj2["MSB_position"] < obj1["MSB_position"]
            ):
                return {"overlap": True, "log": f"case 1"}
            # case 2
            if (
                obj2["LSB_position"] < obj1["MSB_position"] < obj2["MSB_position"]
                and obj1["LSB_position"] < obj2["LSB_position"]
            ):
                return {"overlap": True, "log": f"case 2"}
            # case 3
            if (
                obj2["LSB_position"] < obj1["LSB_position"] < obj2["MSB_position"]
                and obj2["LSB_position"] < obj1["MSB_position"] < obj2["MSB_position"]
            ):
                return {"overlap": True, "log": f"case 3"}
            # case 4
            if (
                obj1["LSB_position"] < obj2["LSB_position"] < obj1["MSB_position"]
                and obj1["LSB_position"] < obj2["MSB_position"] < obj1["MSB_position"]
            ):
                return {"overlap": True, "log": f"case 4"}

            # case 5
            if obj1["MSB_position"] == obj2["LSB_position"]:
                return {"overlap": True, "log": f"case 5"}

            # case 6
            if obj1["LSB_position"] == obj2["MSB_position"]:
                return {"overlap": True, "log": f"case 6"}

    return {"overlap": False, "log": f"no overlap"}
