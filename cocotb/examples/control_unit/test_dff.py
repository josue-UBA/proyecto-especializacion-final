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


@cocotb.test()
async def dff_simple_test(dut):
    """Test that d propagates to q"""

    # Assert initial output is unknown
    # verilator does not support 4-state signals
    # see https://veripool.org/guide/latest/languages.html#unknown-states
    initial = (
        LogicArray(0)
        if cocotb.SIM_NAME.lower().startswith("verilator")
        else (
            LogicArray("U") if LANGUAGE.lower().startswith("vhdl") else LogicArray("X")
        )
    )
    # assert LogicArray(dut.q.value) == initial
    # Set initial input value to prevent it from floating
    dut.reset.value = 1
    dut.i_TVALID.value = initial
    dut.k_TVALID.value = initial
    dut.b_TVALID.value = initial
    dut.o_TREADY.value = initial
    dut.new_i.value = initial

    clock = Clock(dut.clk, 10, units="us")  # Create a 10us period clock on port clk
    # Start the clock. Start it low to avoid issues on the first RisingEdge
    cocotb.start_soon(clock.start(start_high=False))

    # Synchronize with the clock. This will regisiter the initial `d` value
    await RisingEdge(dut.clk)
    expected_val = 0  # Matches initial input value
    for i in range(100):
        i_TVALID = random.randint(0,1)
        k_TVALID = random.randint(0,1)
        b_TVALID = random.randint(0,1)
        o_TREADY = random.randint(0,1)
        new_i = random.randint(0,1)
        dut.reset.value = 0
        dut.i_TVALID.value = i_TVALID
        dut.k_TVALID.value = k_TVALID
        dut.b_TVALID.value = b_TVALID
        dut.o_TREADY.value = o_TREADY
        dut.new_i.value = new_i

        await RisingEdge(dut.clk)
        print("======================================")
        print(dut.state.value)
        print("======================================")
        # assert dut.q.value == expected_val, f"output q was incorrect on the {i}th cycle"
        # expected_val = val  # Save random value for next RisingEdge

    # Check the final input on the next clock
    await RisingEdge(dut.clk)
    # assert dut.q.value == expected_val, "output q was incorrect on the last cycle"


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