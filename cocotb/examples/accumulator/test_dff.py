# This file is public domain, it can be freely copied without restrictions.
# SPDX-License-Identifier: CC0-1.0

import os
import random
from pathlib import Path

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
    dut.i_TDATA.value = 0
    dut.k_TDATA.value = 0
    dut.b_TDATA.value = 0
    dut.reset.value = 0
    dut.a_enable.value = 1
    dut.b_enable.value = 0
    dut.r_enable.value = 1

    clock = Clock(dut.clk, 10, units="us")  # Create a 10us period clock on port clk
    # Start the clock. Start it low to avoid issues on the first RisingEdge
    cocotb.start_soon(clock.start(start_high=False))

    # Synchronize with the clock. This will regisiter the initial `d` value
    await RisingEdge(dut.clk)
    accumulator.accumulate(0,0)
    accumulator.accumulate(0,0)
    expected_val = 0  # Matches initial input value
    for i in range(10):
        val1 = random.randint(1,5)
        val2 = random.randint(1,5)

        # dut.d.value = val  # Assign the random value val to the input port d
        dut.i_TDATA.value = val1
        dut.k_TDATA.value = val2
        dut.reset.value = 1
        await RisingEdge(dut.clk)
        print("============================================")
        print("valores",val1, " -- ", val2)
        # print("python function",accumulator.accumulate(val1,val2))
        print("verilog",dut.o_TDATA.value)
        print("============================================")
        assert dut.o_TDATA.value == accumulator.accumulate(val1,val2), f"output q was incorrect on the {i}th cycle"
        expected_val = val1 * val2  # Save random value for next RisingEdge

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
