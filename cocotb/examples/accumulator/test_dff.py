# This file is public domain, it can be freely copied without restrictions.
# SPDX-License-Identifier: CC0-1.0

import os
import random
from pathlib import Path


import sys
ruta_modulo = os.path.abspath(os.path.join(os.path.dirname(__file__), '..', '..', 'src'))
sys.path.append(ruta_modulo)


import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge
from cocotb.types import LogicArray
from cocotb_tools.runner import get_runner

LANGUAGE = os.environ["TOPLEVEL_LANG"].lower().strip()
from accumulator import accumulator

@cocotb.test()
async def dff_simple_test(dut):
    """Test that d propagates to q"""

    # Assert initial output is unknown
    # verilator does not support 4-state signals
    # see https://veripool.org/guide/latest/languages.html#unknown-states

    # assert LogicArray(dut.q.value) == 0
    # Set initial input value to prevent it from floating


    i_TDATA = 0
    k_TDATA = 0
    b_TDATA = 0
    reset = 0
    r2_enable = 1
    m_enable = 0
    r1_enable = 1

    dut.i_TDATA.value = i_TDATA
    dut.k_TDATA.value = k_TDATA
    dut.b_TDATA.value = b_TDATA
    dut.reset.value = reset
    dut.r2_enable.value = r2_enable
    dut.m_enable.value = m_enable
    dut.r1_enable.value = r1_enable

    clock = Clock(dut.clk, 10, units="us")  # Create a 10us period clock on port clk
    # Start the clock. Start it low to avoid issues on the first RisingEdge
    cocotb.start_soon(clock.start(start_high=False))

    # Synchronize with the clock. This will regisiter the initial `d` value
    await RisingEdge(dut.clk)
    accumulator.accumulate(k_TDATA, i_TDATA,b_TDATA,m_enable)
    expected_val = 0  # Matches initial input value
    for i in range(10):
        k_TDATA = random.randint(1,5)
        i_TDATA = random.randint(1,5)
        b_TDATA = random.randint(1,5)
        m_enable = random.randint(0,1)

        # dut.d.value = val  # Assign the random value val to the input port d
        dut.k_TDATA.value = k_TDATA
        dut.i_TDATA.value = i_TDATA
        dut.b_TDATA.value = b_TDATA
        dut.m_enable.value = m_enable
        dut.reset.value = 1
        await RisingEdge(dut.clk)
        accumulator.accumulate(k_TDATA,i_TDATA,b_TDATA,m_enable)
        assert dut.o_TDATA.value == accumulator.o_TDATA, f"output q was incorrect on the {i}th cycle"        
        
        expected_val = k_TDATA * i_TDATA  # Save random value for next RisingEdge

    # Check the final input on the next clock
    await RisingEdge(dut.clk)
    # assert dut.o_TDATA.value == expected_val, "output q was incorrect on the last cycle"


def test_simple_dff_runner():
    hdl_toplevel_lang = os.getenv("HDL_TOPLEVEL_LANG", "verilog")
    sim = os.getenv("SIM", "icarus")

    proj_path = Path(__file__).resolve().parent

    if hdl_toplevel_lang == "verilog":
        sources = [proj_path / "dff.sv"]
    else:
        sources = [proj_path / "dff.vhdl"]

    runner = get_runner(sim)
    runner.build(
        sources=sources,
        hdl_toplevel="dff",
        always=True,
    )

    runner.test(hdl_toplevel="dff", test_module="test_dff,")


if __name__ == "__main__":
    test_simple_dff_runner()
