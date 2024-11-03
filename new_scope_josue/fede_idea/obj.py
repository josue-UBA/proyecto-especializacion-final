def obj_times_obj(a_obj, b_obj):
    bus = "O"
    number = a_obj["number"] * b_obj["number"]
    phase = a_obj["phase"] + b_obj["phase"]
    label = f'{a_obj["label"]}{b_obj["label"]}'
    MSB = len(bin(number)) - 2 + phase
    LSB = phase + 1
    return {
        "bus": bus,
        "number": number,
        "phase": phase,
        "label": label,
        "MSB": MSB,
        "LSB": LSB,
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
        MSB = len(bin(number)) - 1 + phase
        LSB = phase + 1
        return {
            "bus": bus,
            "number": number,
            "phase": phase,
            "label": label,
            "MSB": MSB,
            "LSB": LSB,
        }
    else:
        print("objs doesn't have the same phase")


def check_overlap(objs):

    for n, obj1 in enumerate(objs):
        for obj2 in objs[n + 1 :]:
            """
            case 1
                |-------|       obj1
            |-------|           obj2

            case 2
                |-------|       obj1
                    |-------|   obj2

            case 3
                |-------|       obj1
            |---------------|   obj2

            case 4
            |---------------|   obj1
                |-------|       obj2

            """

            # case 1
            if obj2["LSB"] < obj1["LSB"] < obj2["MSB"] and obj2["MSB"] < obj1["MSB"]:
                return {"overlap": True, "log": f"case 1"}
            # case 2
            if obj2["LSB"] < obj1["MSB"] < obj2["MSB"] and obj1["LSB"] < obj2["LSB"]:
                return {"overlap": True, "log": f"case 2"}
            # case 3
            if (
                obj2["LSB"] < obj1["LSB"] < obj2["MSB"]
                and obj2["LSB"] < obj1["MSB"] < obj2["MSB"]
            ):
                return {"overlap": True, "log": f"case 3"}
            # case 4
            if (
                obj1["LSB"] < obj2["LSB"] < obj1["MSB"]
                and obj1["LSB"] < obj2["MSB"] < obj1["MSB"]
            ):
                return {"overlap": True, "log": f"case 4"}

    return {"overlap": False, "log": f"no overlap"}
