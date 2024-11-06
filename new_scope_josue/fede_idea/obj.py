import conf_file


def obj_times_obj(a_obj, b_obj):
    bus = "O"
    number = a_obj["number"] * b_obj["number"]
    phase = a_obj["phase"] + b_obj["phase"]
    label = f'{a_obj["label"]}x{b_obj["label"]}'
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


def check_overflow(objs, bus):

    # you are only checking overflow in bus O, requires analysis over buses A,D,B,C
    if bus == "A":
        for obj in objs:
            if conf_file.buses_metadata[bus]["width"] < obj["MSB_position"]:
                return {
                    "overflow": True,
                    "log": f"Overflow in bus {bus}: A word is located outside the bus {bus}",
                }
        return {"overflow": False, "log": f"No overflow in bus {bus}"}

    if bus == "B":
        for obj in objs:
            if conf_file.buses_metadata[bus]["width"] < obj["MSB_position"]:
                return {
                    "overflow": True,
                    "log": f"Overflow in bus {bus}: A word is located outside the bus {bus}",
                }
        return {"overflow": False, "log": f"No overflow in bus {bus}"}

    if bus == "O":
        for obj in objs:
            if conf_file.buses_metadata[bus]["width"] < obj["MSB_position"]:
                return {
                    "overflow": True,
                    "log": f"Overflow in bus {bus}: A word is located outside the bus {bus}",
                }

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

                case 7
                |-------|           obj1
                M       L
                |-------|           obj2
                M       L

                case 8
                |-------|           obj1
                M       L
                |---------------|   obj2
                M               L

                case 9
                        |-------|   obj1
                        M       L
                |---------------|   obj2
                M               L
                """

                # case 1
                if obj2["LSB_position"] < obj1["LSB_position"] < obj2["MSB_position"] and obj2["MSB_position"] < obj1["MSB_position"]:
                    return {"overflow": True, "log": f"Overflow in bus {bus}: case 1- complete overflow"}
                # case 2
                if obj2["LSB_position"] < obj1["MSB_position"] < obj2["MSB_position"] and obj1["LSB_position"] < obj2["LSB_position"]:
                    return {"overflow": True, "log": f"Overflow in bus {bus}: case 2 - complete overflow"}
                # case 3
                if (
                    obj2["LSB_position"] < obj1["LSB_position"] < obj2["MSB_position"]
                    and obj2["LSB_position"] < obj1["MSB_position"] < obj2["MSB_position"]
                ):
                    return {"overflow": True, "log": f"Overflow in bus {bus}: case 3 - a word is completely inside the other"}
                # case 4
                if (
                    obj1["LSB_position"] < obj2["LSB_position"] < obj1["MSB_position"]
                    and obj1["LSB_position"] < obj2["MSB_position"] < obj1["MSB_position"]
                ):
                    return {"overflow": True, "log": f"Overflow in bus {bus}: case 4 - a word is completely inside the other"}

                # case 5 or 6
                if obj1["MSB_position"] == obj2["LSB_position"] or obj1["LSB_position"] == obj2["MSB_position"]:
                    return {
                        "overflow": True,
                        "log": f"Overflow in bus {bus}: case 5 or 6 - the LSB position of one word is the same of the MSB position of the other",
                    }

                # case 7, 8, or 9
                if obj1["LSB_position"] == obj2["LSB_position"] or obj1["MSB_position"] == obj2["MSB_position"]:
                    return {
                        "overflow": True,
                        "log": f"Overflow in bus {bus}: case 7, 8 or 9 - words have the same LSB position, MSB position, or both",
                    }

        return {"overflow": False, "log": f"No overflow in bus {bus}"}
