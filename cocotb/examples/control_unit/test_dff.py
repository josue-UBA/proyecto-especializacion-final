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
from control_unit import controlUnit
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
    controlUnit.transition(1,0,0,0,0,0)
    expected_val = 0  # Matches initial input value
    for i in range(100):
        reset = 0
        i_TVALID = random.randint(0,1)
        k_TVALID = random.randint(0,1)
        b_TVALID = random.randint(0,1)
        o_TREADY = random.randint(0,1)
        new_i = random.randint(0,1)

        dut.reset.value = reset
        dut.i_TVALID.value = i_TVALID
        dut.k_TVALID.value = k_TVALID
        dut.b_TVALID.value = b_TVALID
        dut.o_TREADY.value = o_TREADY
        dut.new_i.value = new_i

        await RisingEdge(dut.clk)
        controlUnit.transition(reset, i_TVALID, k_TVALID, b_TVALID, o_TREADY, new_i)
        assert dut.i_TREADY.value == controlUnit.i_TREADY, f"output q was incorrect on the {i}th cycle"
        assert dut.k_TREADY.value == controlUnit.k_TREADY, f"output q was incorrect on the {i}th cycle"
        assert dut.b_TREADY.value == controlUnit.b_TREADY, f"output q was incorrect on the {i}th cycle"
        assert dut.o_TVALID.value == controlUnit.o_TVALID, f"output q was incorrect on the {i}th cycle"
        assert dut.r1_enable.value == controlUnit.r1_enable, f"output q was incorrect on the {i}th cycle"
        assert dut.r2_enable.value == controlUnit.r2_enable, f"output q was incorrect on the {i}th cycle"
        assert dut.m_enable.value == controlUnit.m_enable, f"output q was incorrect on the {i}th cycle"

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