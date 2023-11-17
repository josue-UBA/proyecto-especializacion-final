
import numpy as np
from itertools import product

def mac_n_p_b(i, k, b, like = None):
    assert(type(i) in [list, np.ndarray])
    input_type = type(i)
    assert(len(i) == len(k) and len(i) == len(b))
    o = list()
    for i_aux, k_aux, b_aux in zip(i, k, b):
        o_aux = np.dot(i_aux, k_aux) + b_aux
        if not like == None:
            o.append(o_aux.like(like))
        else:
            o.append(o_aux)
    o = input_type(o)
    return o


def np_conv2d(i, k):
    # calc the size of the array of submatrices
    o_shape = tuple(np.subtract(i.shape, k.shape) + 1)

    # make an array of submatrices
    submatrices = np.lib.stride_tricks.as_strided(i, k.shape + o_shape, i.strides * 2)

    o = np.zeros(o_shape, dtype = object)
    for a, b in product(range(k.shape[0]),range(k.shape[1])):
        o = o + submatrices[a,b,:,:] * k[a,b]

    return o


def conv2d(i, k, b, mode, like = None):

    i_h, i_w = i.shape[0:2]
    k_h, k_w, i_c, o_c = k.shape

    if mode == 'valid':
        o_h = i_h - k_h + 1
        o_w = i_w - k_w + 1
    elif mode == 'same':
        o_h = i_h
        o_w = i_w
        pad_h = k_h // 2
        pad_w = k_w // 2
        i = np.pad(i,
                pad_width = ((pad_h, pad_h), (pad_w, pad_w), (0, 0)),
                mode = 'constant',
                constant_values = 0*i[0,0,0])

    o = np.empty((o_h, o_w, o_c), dtype = object)
    for idx_o_c in range(o_c):
        tmp = np.zeros((o_h, o_w), dtype = object)
        for idx_i_c in range(i_c):
            tmp = tmp + np_conv2d(i[:,:,idx_i_c], k[:,:,idx_i_c, idx_o_c])
        tmp = tmp + b[idx_o_c]
        if like == None:
            o[:,:,idx_o_c] = tmp
        else:
            o[:,:,idx_o_c] = tmp.like(like)

    return o

