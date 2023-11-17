import numpy as np


def create_ikb_values(n_parallel_input,
                      n_parallel_kernel,
                      n_block_ops,
                      n_mac_ops,
                      distribution):
    """Create Input, Kernel and bias High-level values"""
    assert(type(n_mac_ops) == list or type(n_mac_ops) == int)
    total_length = n_parallel_input * n_parallel_kernel * n_block_ops
    if type(n_mac_ops) == int:
        n_mac_ops = list([n_mac_ops]) * total_length

    max_mac_len = np.max(np.array(n_mac_ops))

    i_aux = np.zeros((n_parallel_input, 1, n_block_ops, max_mac_len))
    k_aux = np.zeros((1, n_parallel_kernel, n_block_ops, max_mac_len))
    b_aux = np.zeros((1, n_parallel_kernel, n_block_ops, 1))


    for k in range(n_block_ops):
        for i in range(n_parallel_input):
            #i_aux[i, 0, k, :] = create_single_mac_values(False, n_mac_ops[k], distribution)
            aux = create_single_mac_values(False, n_mac_ops[k], distribution)
            aux = aux + [None]*(max_mac_len-len(aux))
            i_aux[i, 0, k, :] = aux

    for k in range(n_block_ops):
        for j in range(n_parallel_kernel):
            #k_aux[0, j, k, :] = create_single_mac_values(True, n_mac_ops[k], distribution)
            #b_aux[0, j, k, :] = create_single_mac_values(True, 1, distribution)
            aux = create_single_mac_values(True, n_mac_ops[k], distribution)
            aux = aux + [None]*(max_mac_len-len(aux))
            k_aux[0, j, k, :] = aux
            b_aux[0, j, k, :] = create_single_mac_values(True, 1, distribution)

    # # DEBUG
    # print(f"Before repeat")
    # print(f"i_aux_shape = {i_aux.shape}")
    # print(f"k_aux_shape = {k_aux.shape}")
    # print(f"b_aux_shape = {b_aux.shape}")

    i_aux = np.repeat(i_aux, n_parallel_kernel, axis = 1)
    k_aux = np.repeat(k_aux, n_parallel_input, axis = 0)
    b_aux = np.repeat(b_aux, n_parallel_input, axis = 0)

    # # DEBUG
    # print(f"After repeat")
    # print(f"i_aux_shape = {i_aux.shape}")
    # print(f"k_aux_shape = {k_aux.shape}")
    # print(f"b_aux_shape = {b_aux.shape}")
    # # DEBUG
    # for k in range(n_block_ops):
    #     for j in range(n_parallel_kernel):
    #         for i in range(n_parallel_input):
    #             print(f"ijk: ({i}{j}{k}), v: {i_aux[i,j,k,:]}")
    # print(f"")
    # # DEBUG
    # for k in range(n_block_ops):
    #     for j in range(n_parallel_kernel):
    #         for i in range(n_parallel_input):
    #             print(f"ijk: ({i}{j}{k}), v: {k_aux[i,j,k,:]}")
    # print(f"")
    # # DEBUG
    # for k in range(n_block_ops):
    #     for j in range(n_parallel_kernel):
    #         for i in range(n_parallel_input):
    #             print(f"ijk: ({i}{j}{k}), v: {b_aux[i,j,k,:]}")
    # print(f"")

    i_value = list()
    k_value = list()
    b_value = list()
    for k in range(n_block_ops):
        for j in range(n_parallel_kernel):
            for i in range(n_parallel_input):
                i_value.append(list (i_aux[i,j,k,0:n_mac_ops[k]]))
                k_value.append(list (k_aux[i,j,k,0:n_mac_ops[k]]))
                b_value.append(float(b_aux[i,j,k,:]))

    return i_value, k_value, b_value


def create_single_mac_values(signedness, length, distribution):
    if distribution == "linear":
        values = np.arange(1, length + 1, dtype = float) / (length + 1)
    elif distribution == "constant":
        values = np.ones((length, ), dtype = float) * 0.125
    elif distribution == "random":
        values = np.array(np.random.rand(length), dtype = float)
    if signedness:
        values = values * 2 - 1
    if length > 1:
        values = list(values)
    else:
        values = values[0]
    return values

    # distribution = "rand"
    # if distribution == "deterministic":
    #     # Constant values
    #     i_value = np.arange(1, i_len + 1, dtype = float)*0+0.125
    #     k_value = np.arange(1, k_len + 1, dtype = float)*0+0.125
    #     b_value = np.arange(1, b_len + 1, dtype = float)*0+0.125
    # elif distribution == "constant":
    #     # Some deterministic values
    #     i_value = 2 * np.arange(1, i_len + 1, dtype = float) / i_len - 1
    #     k_value = 2 * np.arange(1, k_len + 1, dtype = float) / k_len - 1
    #     b_value = 2 * np.arange(1, b_len + 1, dtype = float) / o_len - 1
    # elif distribution == "rand":
    #     # Some random values
    #     i_value = 2 * np.array(np.random.rand(i_len), dtype = float) - 1
    #     k_value = 2 * np.array(np.random.rand(k_len), dtype = float) - 1
    #     b_value = 2 * np.array(np.random.rand(b_len), dtype = float) - 1
    # k_value = np.repeat(k_value, n_parallel, axis=0)
    # b_value = np.repeat(b_value, n_parallel, axis=0)
    # i_value = list(i_value.reshape((n_parallel * n_full_ops, n_mac_ops)))
    # k_value = list(k_value.reshape((n_parallel * n_full_ops, n_mac_ops)))
    # b_value = list(b_value.reshape((n_parallel * n_full_ops, 1)))
