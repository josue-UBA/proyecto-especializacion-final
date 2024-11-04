import conf_file


def print_log(log):
    print(log)


def print_analysis(q):

    name = q["data"]["name"]
    A_bus = q["data"]["A_bus"]
    D_bus = q["data"]["D_bus"]
    B_bus = q["data"]["B_bus"]
    C_bus = q["data"]["C_bus"]
    buses = q["data"]["buses"]
    O_base_objs = q["data"]["O_base_objs"]
    log = q["log"]
    status = q["status"]

    a = [i["LSB_position"] for i in O_base_objs] + [
        i["LSB_position"] - 1 for i in O_base_objs
    ]
    b = [
        "|" if i in a else "-" for i in range(1, conf_file.buses_metadata["O"]["width"])
    ] + ["|"]
    c = " ".join(b)[::-1]

    # Only string that grow dinamically use ":>"
    text = f"""
=============================================================================================================================
                                            configuration: {name} over DSP48E1
=============================================================================================================================
   
                 4 4 4 4 4 4 4 4 4 3 3 3 3 3 3 3 3 3 3 2 2 2 2 2 2 2 2 2 2 1 1 1 1 1 1 1 1 1 1
 bit position => 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1
{A_bus:>{conf_file.LEFT_SPACE}}
                                                                                        +
{D_bus:>{conf_file.LEFT_SPACE}}
                                                                                        x
{B_bus:>{conf_file.LEFT_SPACE}}
                                                                                        +
{C_bus:>{conf_file.LEFT_SPACE}}
                                                                                        =
range of numb => {c}

{chr(10).join([f'{text:>{conf_file.LEFT_SPACE}}' for text in [f'iteration {n} => {bus}' for n,bus in enumerate(buses)]])}

range of numb => {c}

------------------------
overflow occurs: {log}
status: {status}
------------------------

"""
    print(text)
