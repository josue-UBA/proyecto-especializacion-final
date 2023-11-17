import cocotb
from cocotb.triggers import RisingEdge, FallingEdge, Timer, ClockCycles
import random
from datetime import datetime




async def reset_dut_synch(reset, clk, clk_count):
    assert(reset.value.n_bits == 1)
    assert(clk.value.n_bits == 1)
    """Reset"""
    reset.value = 1
    await ClockCycles(clk, clk_count)
    """Lower reset"""
    reset.value = 0
    reset._log.info("Reset complete")


async def random_enable(enable, clk, probability, seed = None):
    random.seed(seed)
    assert(enable.value.n_bits == 1)
    assert(clk.value.n_bits == 1)
    """enable"""
    enable.value = 0
    while True:
        await RisingEdge(clk)
        if random.random() < probability:
            enable.value = 1
        else:
            enable.value = 0


async def keep_alive(clk, period = 10000, type_ = 'cycles'):
    await RisingEdge(clk)
    while True:
        if type_ == 'cycles':
            await ClockCycles(clk, period)
        elif type_ == 'sim_time_ns':
            await Timer(period, 'ns')
        elif type_ == 'real_time_ns':
            raise NotImplementedError('Not yet implemented. How await for real time?')
        else:
            raise ValueError('Wrong keep alive period type.'
                    'Valid values are:\n'
                    '- "cycle"\n'
                    '- "sim_time_ns"\n'
                    '- "real_time_ns"\n')
        now = datetime.now()
        current_time = now.strftime("%Y%m%d-%H:%M:%S")
        clk._log.info(f"Simulation is still running: Current time"
                      f"-> {current_time}")



