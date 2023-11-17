import numpy as np
from cocotb.binary import BinaryValue
#import fxpmath
from fxpmath import Fxp
from itertools import product
import numpy as np


def fxp2binval(data):
    # TODO: Cambiar por una recursiva

    type_list1_Fxp = (
            type(data) == list and
            type(data[0]) == Fxp)

    type_list2_Fxp = (
            type(data) == list and
            type(data[0]) == list and
            type(data[0][0]) == Fxp)

    assert(type_list1_Fxp or type_list2_Fxp)

    if type_list1_Fxp:
        binval = [BinaryValue(d.bin(), d.n_word) for d in data]
    elif type_list2_Fxp:
        binval = [[BinaryValue(d.bin(), d.n_word) for d in l] for l in data]
    else:
        raise TypeError

    return binval


def ikbo_binval2pkt(i_binval, k_binval, b_binval, o_binval,
                    n_parallel_input, n_parallel_kernel,
                    n_block_ops, n_mac_ops):

    max_mac_len = np.max(np.array(list(map(len, i_binval))))

    idx = 0
    i_pkt = list()
    #print(f"### I ###") # DEBUG
    #print(f"len(i_binval) = {len(i_binval)}") # DEBUG
    for k in range(n_block_ops):
        mac_len = len(i_binval[n_parallel_input * n_parallel_kernel * k])
        #print(f"k={k}: Length = {mac_len}") # DEBUG
        for l in range(mac_len):
            aux_str = ''
            aux_len = 0
            for j in range(n_parallel_kernel):
                for i in range(n_parallel_input):
                    idx = i + j * n_parallel_input + k * n_parallel_input * n_parallel_kernel
                    if j == 0:
                        aux_str = i_binval[idx][l].binstr + aux_str
                        aux_len += 1
                    #print(f"ijkl=({i},{j},{k},{l}): idx={idx} aux_len={aux_len}") # DEBUG
            transfer = BinaryValue(aux_str)
            i_pkt.append(transfer)
    #print(f"len(i_pkt) = {len(i_pkt)}") # DEBUG
    #for i, pkt in enumerate(i_pkt):
    #    print(f"{i}: len(pkt)={len(pkt)}->{pkt}") # DEBUG
    #print(f"") # DEBUG

    idx = 0
    k_pkt = list()
    #print(f"### K ###") # DEBUG
    #print(f"len(k_binval) = {len(k_binval)}") # DEBUG
    for k in range(n_block_ops):
        mac_len = len(k_binval[n_parallel_input * n_parallel_kernel * k])
        #print(f"k={k}: Length = {mac_len}") # DEBUG
        for l in range(mac_len):
            aux_str = ''
            aux_len = 0
            for j in range(n_parallel_kernel):
                for i in range(n_parallel_input):
                    idx = i + j * n_parallel_input + k * n_parallel_input * n_parallel_kernel
                    if i == 0:
                        aux_str = k_binval[idx][l].binstr + aux_str
                        aux_len += 1
                    #print(f"ijkl=({i},{j},{k},{l}): idx={idx} aux_len={aux_len}") # DEBUG
            transfer = BinaryValue(aux_str)
            k_pkt.append(transfer)
    #print(f"len(k_pkt) = {len(k_pkt)}") # DEBUG
    #for i, pkt in enumerate(k_pkt):
    #    print(f"{i}: len(pkt)={len(pkt)}->{pkt}") # DEBUG
    #print(f"") # DEBUG

    idx = 0
    b_pkt = list()
    #print(f"### K ###") # DEBUG
    #print(f"len(b_binval) = {len(b_binval)}") # DEBUG
    for k in range(n_block_ops):
        mac_len = len(b_binval[n_parallel_input * n_parallel_kernel * k])
        #print(f"k={k}: Length = {mac_len}") # DEBUG
        aux_str = ''
        aux_len = 0
        for j in range(n_parallel_kernel):
            for i in range(n_parallel_input):
                idx = i + j * n_parallel_input + k * n_parallel_input * n_parallel_kernel
                if i == 0:
                    aux_str = b_binval[idx].binstr + aux_str
                    aux_len += 1
                #print(f"ijk=({i},{j},{k}): idx={idx}") # DEBUG
        transfer = BinaryValue(aux_str)
        b_pkt.append(transfer)
    #print(f"len(b_pkt) = {len(b_pkt)}") # DEBUG
    #for i, pkt in enumerate(b_pkt):
    #    print(f"{i}: len(pkt)={len(pkt)}->{pkt}") # DEBUG
    #print(f"") # DEBUG

    idx = 0
    o_pkt = list()
    #print(f"### K ###") # DEBUG
    #print(f"len(o_binval) = {len(o_binval)}") # DEBUG
    for k in range(n_block_ops):
        mac_len = len(o_binval[n_parallel_input * n_parallel_kernel * k])
        #print(f"k={k}: Length = {mac_len}") # DEBUG
        aux_str = ''
        aux_len = 0
        for j in range(n_parallel_kernel):
            for i in range(n_parallel_input):
                idx = i + j * n_parallel_input + k * n_parallel_input * n_parallel_kernel
                aux_str = o_binval[idx].binstr + aux_str
                aux_len += 1
                #print(f"ijkl=({i},{j},{k}): idx={idx} aux_len={aux_len}") # DEBUG
        transfer = BinaryValue(aux_str)
        o_pkt.append(transfer)
    #print(f"len(o_pkt) = {len(o_pkt)}") # DEBUG
    #for i, pkt in enumerate(o_pkt):
    #    print(f"{i}: len(pkt)={len(pkt)}->{pkt}") # DEBUG
    #print(f"") # DEBUG

    return i_pkt, k_pkt, b_pkt, o_pkt


def join_last_axis_binvals(data):
    pkt = join_last_axis_binvals_recursive(data)
    if type(pkt) == list:
        return pkt
    else:
        return [pkt]


def join_last_axis_binvals_recursive(data):
    if type(data[0]) == BinaryValue:
        aux_str = ''
        for x in data:
            aux_str = x.binstr + aux_str
        return BinaryValue(aux_str)
    else:
        pkt = list()
        for x in data:
            transfer = join_last_axis_binvals_recursive(x)
            pkt.append(transfer)
        return pkt

def fm2win(data, k_shape, padding, repeat = 1):
    k_h = k_shape[0]
    k_w = k_shape[1]
    pad_u = int(np.ceil((k_h-1)/2))
    pad_d = int(np.floor((k_h-1)/2))
    pad_l = int(np.ceil((k_w-1)/2))
    pad_r = int(np.floor((k_w-1)/2))
    if padding == 'same':
        aux = np.pad(data,
                pad_width = ((pad_u,pad_d),(pad_l,pad_r),(0,0)),
                mode = 'constant',
                constant_values = 0 )
    elif padding == 'valid':
        aux = data
    else:
        raise ValueError('Wrong padding, valids are "same" and "valid"')
    i_h = data.shape[0]
    i_w = data.shape[1]
    par = data.shape[2]
    wins = list()
    if padding == 'same':
        min_h, max_h = pad_u, i_h+pad_d
        min_w, max_w = pad_l, i_w+pad_r
    elif padding == 'valid':
        min_h, max_h = pad_u, i_h-pad_d
        min_w, max_w = pad_l, i_w-pad_r
    else:
        raise ValueError('Wrong padding, valids are "same" and "valid"')
    #print(pad_u, pad_d, pad_l, pad_r) # DEBUG
    #print(min_h, max_h) # DEBUG
    #print(min_w, max_w) # DEBUG
    for j, i in product(range(min_w, max_w), range(min_h, max_h)):
        #print(i, j) # DEBUG
        par_pixel = list()
        win = list()
        for k in range(par):
            win_aux = aux[i-pad_u:i+pad_d+1:,j-pad_l:j+pad_r+1,k]
            win_aux = list(win_aux.transpose().ravel())
            win.append(win_aux)
        #print(win[0], len(win[0])) # DEBUG
        #print(win[1], len(win[1])) # DEBUG
        for r in range(repeat):
            for l in range(k_h * k_w):
                #print(k, l) # DEBUG
                par_pixel = list()
                for k in range(par):
                    par_pixel.append(win[k][l])
                wins.append(par_pixel)
    return wins;


def float2fxp(data, like = None):
    #print(f'[float2fxp] type(data)={type(data)}')
    if type(data) == list:
        if len(data) > 0:
            return float2fxp_recursive(data, like)
        else:
            return None
    elif type(data) == np.ndarray:
        tmp = np.empty(data.shape, dtype = object)
        for idx, v in np.ndenumerate(data):
            if like == None:
                tmp[idx] = Fxp(v)
            else:
                tmp[idx] = Fxp(v).like(like)
        return tmp
    else:
        if like == None:
            return Fxp(data)
        else:
            return Fxp(data).like(like)


def float2fxp_recursive(data, like):
    #print(data)
    if type(data[0]) == list:
        tmp = list()
        for x in data:
            tmp.append(float2fxp(x, like))
        return tmp
    else:
        tmp = list()
        for x in data:
            if like == None:
                tmp.append(Fxp(x))
            else:
                tmp.append(Fxp(x).like(like))
        return tmp


