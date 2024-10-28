# Define el ancho de bits de cada bus
bus_a_width = 8  # Ejemplo de 8 bits
bus_b_width = 8
bus_c_width = 8
output_width = 16  # Define el ancho de salida

# Rango de cada bus según el ancho
max_value_a = (1 << bus_a_width) - 1
max_value_b = (1 << bus_b_width) - 1
max_value_c = (1 << bus_c_width) - 1
max_output_value = (1 << output_width) - 1

# Valores de entrada
bus_a = 130  # Puedes cambiar estos valores para tus pruebas
bus_b = 140
bus_c = 15

# Realiza la suma y verificación de saturación en la suma
sum_result = bus_a + bus_b
if sum_result > max_value_a:
    print("Saturación en la suma.")
    sum_result = max_value_a

# Representación binaria de la suma
print("Suma (binario):", format(sum_result, f'0{bus_a_width}b'))

# Realiza la multiplicación con el tercer bus y verifica la saturación
mult_result = sum_result * bus_c
if mult_result > max_output_value:
    print("Saturación en la multiplicación.")
    mult_result = max_output_value

# Representación binaria del resultado final
print("Resultado final (binario):", format(mult_result, f'0{output_width}b'))
