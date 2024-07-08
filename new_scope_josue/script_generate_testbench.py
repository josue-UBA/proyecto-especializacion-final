
'''
|--- y ---|

+---------+   -
|         |   |
|         |   x
|         |   |
+---------+   -


matrix = [
    #  y --→
    [1,2,3,4,5],  # x
    [1,2,8,4,5],  # |
    [1,2,3,4,5],  # ↓
]

matrix[x][y]
'''


image = [
    [5,2,3,3,2,4],
    [3,0,2,1,2,2],
    [3,2,1,0,4,1],
    [3,1,2,3,1,2],
    [3,1,2,1,1,2],
]

kernel = [
    [0,1,0],
    [-1,1,-1],
    [0,1,0],
]

image_x = len(image)
image_y = len(image[0])
kernel_x = len(kernel)
kernel_y = len(kernel[0])

# ------------------------

def conv_with_shift(phase_x,phase_y):
    global testbench
    global init_time
    acu = 0
    for i in range(kernel_x):
        for j in range(kernel_x):
            acu = image[i+phase_x][j+phase_y] * kernel[i][j] + acu
            print(str(image[i+phase_x][j+phase_y])+ "(" + str(kernel[i][j]) + ") ",end="")
        print()
    return acu


def generate_output():
    output = []
    for i in range(image_x-kernel_x+1):
        aux_list = []
        for j in range(image_y-kernel_y+1):
            a = conv_with_shift(i,j)
            print()
            aux_list.append(a)
        output.append(aux_list)


    return output

# ------------------------
testbench = ""
init_time = 124

def one_convolution(phase_x,phase_y):
    global testbench
    global init_time
    # provider set the first data
    testbench += "//provider set the first data\n"
    testbench += "#{0} t_i_TDATA = {1};\n#{0} t_k_TDATA = {2};\n#{0} t_b_TDATA = 0;\n".format(init_time,image[phase_x][phase_y],kernel[0][0])
    init_time += 10
    # start convolution
    testbench += "//start convolution\n"
    testbench += "#{} t_new_i = 1;\n".format(init_time)
    init_time += 10
    # provider validates its data
    testbench += "//provider validates its data\n"
    testbench += "#{0} t_i_TVALID = 1;\n#{0} t_k_TVALID = 1;\n#{0} t_b_TVALID = 1;\n".format(init_time)
    init_time += 10
    # the streaming has started...
    testbench += "//the streaming has started...\n"
    for i in range(kernel_x):
        for j in range(kernel_x):
            if i == 0 and j == 0 :
                pass
            else:
                testbench += "#{0} t_i_TDATA = {1};\n#{0} t_k_TDATA = {2};\n".format(init_time,image[i+phase_x][j+phase_y],kernel[i][j])
                init_time += 10
    # stop convolution
    testbench += "//stop convolution\n"
    testbench += "#{} t_new_i = 0;\n".format(init_time)
    init_time += 50
    # provider will get ready for the next convolution
    testbench += "//provider will get ready for the next convolution\n"
    testbench += "#{0} t_i_TVALID = 0;\n#{0} t_k_TVALID = 0;\n#{0} t_b_TVALID = 0;\n".format(init_time)
    init_time += 10
    # consumer validates data
    testbench += "//consumer validates data\n"
    testbench += "#{} t_o_TREADY = 1;\n".format(init_time)
    init_time += 50
    testbench += "#{} t_o_TREADY = 0;\n".format(init_time)
    init_time += 50
    

def generate_testbench():
    for i in range(image_x-kernel_x+1):
        for j in range(image_y-kernel_y+1):
            one_convolution(i,j)

#print(generate_output())
generate_testbench()
print(testbench)