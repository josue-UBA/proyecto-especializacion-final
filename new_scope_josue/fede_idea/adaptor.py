import conf_file


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

    aux = aux + ["□" for _ in range(conf_file.buses_metadata[bus]["width"] - len(aux))]
    info = f' {bus} - {conf_file.buses_metadata[bus]["width"]} bits'

    return f'{" ".join(aux[::-1])} {info}'
