import cocotb
from cocotb.triggers import RisingEdge, FallingEdge, Timer
from cocotb.clock import Clock

async def generate_clock(dut):
    """Generate clock pulses."""
    for cycle in range(100):  # Genera 100 ciclos de reloj para una prueba más larga
        dut.clk.value = 0
        await Timer(1, units="ns")
        dut.clk.value = 1
        await Timer(1, units="ns")

@cocotb.test()
async def test_my_design(dut):
    """Test the my_design module."""

    # Iniciar la generación de reloj en una corutina separada
    cocotb.start_soon(generate_clock(dut))

    # Reset del DUT al inicio
    dut.reset.value = 1
    await Timer(2, units="ns")  # Esperar 2 ns para asegurar que el reset se propague
    dut.reset.value = 0
    await Timer(2, units="ns")  # Esperar otro poco antes de iniciar la prueba

    # Prueba con diferentes valores de entrada
    test_data = [(1, 2, 3), (10, 20, 30), (255, 0, 1)]
    for i_TDATA, k_TDATA, b_TDATA in test_data:
        # Configurar las entradas
        dut.i_TDATA.value = i_TDATA
        dut.k_TDATA.value = k_TDATA
        dut.b_TDATA.value = b_TDATA

        # Habilitar las señales
        dut.a_enable.value = 1
        dut.r_enable.value = 1
        dut.b_enable.value = 0  # Cambia según sea necesario para tu prueba

        await Timer(2, units="ns")  # Esperar para que las señales se procesen

        # Calcular el valor esperado de la salida
        # Asumiendo que conoces la lógica exacta para calcular este valor basado en las entradas y el estado actual del DUT
        expected_o_TDATA = (i_TDATA * k_TDATA + dut.c.value) % 256  # Este cálculo debe ajustarse según la lógica del módulo

        # Verificar la salida
        assert dut.o_TDATA.value == expected_o_TDATA, f"Falló para i_TDATA={i_TDATA}, k_TDATA={k_TDATA}, b_TDATA={b_TDATA}. Esperado: {expected_o_TDATA}, Obtenido: {dut.o_TDATA.value}"

        # Opcionalmente, imprime un mensaje de éxito para cada iteración
        print(f"Prueba exitosa para entrada ({i_TDATA}, {k_TDATA}, {b_TDATA}). Esperado: {expected_o_TDATA}, Obtenido: {dut.o_TDATA.value}")
