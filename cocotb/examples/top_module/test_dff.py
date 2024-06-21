# This file is public domain, it can be freely copied without restrictions.
# SPDX-License-Identifier: CC0-1.0

import os
import random
from pathlib import Path
from top_module import topModule
import sys
ruta_modulo = os.path.abspath(os.path.join(os.path.dirname(__file__), '..', '..', 'src'))
sys.path.append(ruta_modulo)


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

    assert LogicArray(dut.o_TREADY.value) == initial
    assert LogicArray(dut.o_TVALID.value) == initial
    assert LogicArray(dut.o_TDATA.value) == initial
    assert LogicArray(dut.i_TREADY.value) == initial
    assert LogicArray(dut.k_TREADY.value) == initial
    assert LogicArray(dut.b_TREADY.value) == initial

    # Set initial input value to prevent it from floating
    srst_i = 0
    enable_i = 0
    new_i = 0
    i_TDATA = 0
    k_TDATA = 0
    b_TDATA = 0

    dut.srst_i.value = srst_i
    dut.enable_i.value = enable_i
    dut.new_i.value = new_i
    dut.i_TDATA.value = i_TDATA
    dut.k_TDATA.value = k_TDATA
    dut.b_TDATA.value = b_TDATA

    clock = Clock(dut.clk, 10, units="us")  # Create a 10us period clock on port clk
    # Start the clock. Start it low to avoid issues on the first RisingEdge
    cocotb.start_soon(clock.start(start_high=False))

    # Synchronize with the clock. This will regisiter the initial `d` value
    await RisingEdge(dut.clk)
    expected_val = 0  # Matches initial input value
    for i in range(10):

        srst_i = random.randint(0, 1)
        enable_i = random.randint(0, 1)
        new_i = random.randint(0, 1)
        i_TDATA = random.randint(0, 1)
        k_TDATA = random.randint(0, 1)
        b_TDATA = random.randint(0, 1)

        dut.srst_i.value = srst_i
        dut.enable_i.value = enable_i
        dut.new_i.value = new_i
        dut.i_TDATA.value = i_TDATA
        dut.k_TDATA.value = k_TDATA
        dut.b_TDATA.value = b_TDATA

        await RisingEdge(dut.clk)
        topModule.do_something(
            srst_i,
            enable_i,
            new_i,
            i_TDATA,
            k_TDATA,
            b_TDATA)

        assert dut.o_TREADY.value == topModule.o_TREADY
        assert dut.o_TVALID.value == topModule.o_TVALID
        assert dut.o_TDATA.value == topModule.o_TDATA
        assert dut.i_TREADY.value == topModule.i_TREADY
        assert dut.k_TREADY.value == topModule.k_TREADY
        assert dut.b_TREADY.value == topModule.b_TREADY


    # Check the final input on the next clock
    await RisingEdge(dut.clk)
    

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