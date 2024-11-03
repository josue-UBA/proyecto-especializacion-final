def obj_to_decimal(obj):
    phase = pow(2, obj["phase"])
    num = obj["number"]
    return phase * num


def decimal_to_string(num):
    transrm = " ".join(["■" if i == "1" else "□" for i in list(bin(num).split("b")[1])])
    return transrm


def strings_to_bus(strings, bus):
    ordered_strings = sorted(strings, key=len)
    ordered_strings = [i.split(" ") for i in ordered_strings]
    # asumo que se comienza por el menor
    aux = []
    for string in ordered_strings:
        for i in string[len(string) - len(aux) - 1 :: -1]:
            if i not in "S" or i not in "s":
                aux.append(i)
            else:
                break

    info = ""

    if bus == "A":
        aux = aux + ["□" for _ in range(30 - len(aux))]
        info = " A - 30 bits"
    elif bus == "D":
        aux = aux + ["□" for _ in range(27 - len(aux))]
        info = " D - 27 bits"
    elif bus == "B":
        aux = aux + ["□" for _ in range(18 - len(aux))]
        info = " B - 18 bits"
    elif bus == "C":
        aux = aux + ["□" for _ in range(48 - len(aux))]
        info = " C - 48 bits"
    elif bus == "O":
        aux = aux + ["□" for _ in range(48 - len(aux))]
        info = " O - 48 bits"
    return f'{" ".join(aux[::-1])} {info}'
