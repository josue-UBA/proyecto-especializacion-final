# This file is public domain, it can be freely copied without restrictions.
# SPDX-License-Identifier: CC0-1.0

import os
import random
from pathlib import Path
import sys
import cocotb

ruta_modulo = os.path.abspath(os.path.join(os.path.dirname(__file__), '..','hardware_on_python'))
sys.path.append(ruta_modulo)
from core import core

ruta_modulo = os.path.abspath(os.path.join(os.path.dirname(__file__), '..', '..', 'src'))
sys.path.append(ruta_modulo)
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

    dut.i_TREADY.value = 0
    dut.k_TREADY.value = 0
    dut.b_TREADY.value = 0
    dut.o_TVALID.value = 0
    dut.o_TDATA.value = 0



    # assert LogicArray(dut.i_TREADY.value)== initial
    # assert LogicArray(dut.k_TREADY.value)== initial
    # assert LogicArray(dut.b_TREADY.value)== initial
    # assert LogicArray(dut.o_TVALID.value)== initial
    # assert LogicArray(dut.o_TDATA.value)== initial


    # Set initial input value to prevent it from floating

    reset = 1
    enable_i = 0
    new_i = 0
    i_TVALID = 0
    k_TVALID = 0
    b_TVALID = 0
    o_TREADY = 0
    i_TDATA = 0
    k_TDATA = 0
    b_TDATA = 0

    dut.reset.value = reset
    dut.enable_i.value = enable_i
    dut.new_i.value = new_i
    dut.i_TVALID.value = i_TVALID
    dut.k_TVALID.value = k_TVALID
    dut.b_TVALID.value = b_TVALID
    dut.o_TREADY.value = o_TREADY
    dut.i_TDATA.value = i_TDATA
    dut.k_TDATA.value = k_TDATA
    dut.b_TDATA.value = b_TDATA


    clock = Clock(dut.clk, 10, units="us")  # Create a 10us period clock on port clk
    # Start the clock. Start it low to avoid issues on the first RisingEdge
    cocotb.start_soon(clock.start(start_high=False))

    # Synchronize with the clock. This will regisiter the initial `d` value
    await RisingEdge(dut.clk)
    core.do_something(    
            reset,
            enable_i,
            new_i,
            i_TVALID,
            k_TVALID,
            b_TVALID,
            o_TREADY,
            i_TDATA,
            k_TDATA,
            b_TDATA,
        )
    expected_val = 0  # Matches initial input value
    for i in range(10):

        reset = 0 #random.randint(0,1)
        enable_i = random.randint(0,1)
        new_i = random.randint(0,1)
        i_TVALID = 1#random.randint(0,1)
        k_TVALID = 1#random.randint(0,1)
        b_TVALID = 1#random.randint(0,1)
        o_TREADY = random.randint(0,1)
        i_TDATA = random.randint(0,5)
        k_TDATA = random.randint(0,5)
        b_TDATA = random.randint(0,5)

        dut.reset.value = reset
        dut.enable_i.value = enable_i
        dut.new_i.value = new_i
        dut.i_TVALID.value = i_TVALID
        dut.k_TVALID.value = k_TVALID
        dut.b_TVALID.value = b_TVALID
        dut.o_TREADY.value = o_TREADY
        dut.i_TDATA.value = i_TDATA
        dut.k_TDATA.value = k_TDATA
        dut.b_TDATA.value = b_TDATA

        await RisingEdge(dut.clk)
        core.do_something(    
            reset,
            enable_i,
            new_i,
            i_TVALID,
            k_TVALID,
            b_TVALID,
            o_TREADY,
            i_TDATA,
            k_TDATA,
            b_TDATA,
        )

        assert dut.i_TREADY.value == core.i_TREADY
        assert dut.k_TREADY.value == core.k_TREADY
        assert dut.b_TREADY.value == core.b_TREADY
        assert dut.o_TVALID.value == core.o_TVALID
        assert dut.o_TDATA.value == core.o_TDATA


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