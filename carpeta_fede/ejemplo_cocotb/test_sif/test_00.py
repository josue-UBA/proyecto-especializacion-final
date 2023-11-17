
import cocotb
from cocotb.triggers import RisingEdge, FallingEdge, Timer, ClockCycles
from cocotb.clock import Clock
import numpy as np

# Import my lib
import sys
sys.path.append('../lib/test')
from sif_driver import Sif


async def reset_dut_synch(reset, clk, clk_count):
    assert(reset.value.n_bits == 1)
    assert(clk.value.n_bits == 1)
    """Reset"""
    reset.value = 1
    await ClockCycles(clk, clk_count)
    """Lower reset"""
    reset.value = 0
    reset._log.debug("Reset complete")


@cocotb.test()
async def test_00_write_read(dut):
    """Define the interfaces"""
    i_sif = Sif(dut.clk_i, dut.i_data_i, dut.i_valid_i, dut.i_ready_o)
    o_sif = Sif(dut.clk_i, dut.o_data_o, dut.o_valid_o, dut.o_ready_i)

    """Start clock and reset dut"""
    CLK_PERIOD_NS = 10
    c = Clock(dut.clk_i, CLK_PERIOD_NS, 'ns')
    await cocotb.start(c.start())
    reset_thread = cocotb.start_soon(reset_dut_synch(dut.srst_i, dut.clk_i, clk_count=3))

    """Initial values"""
    dut.en_i.value = 1                # enable dut

    """Wait for reset and write-read x2"""
    await reset_thread
    i_values = np.array([1, 2], dtype=int)
    o_values = np.empty((2,), dtype=int)
    await cocotb.start(i_sif.write(i_values[0]))
    o_values[0] = await o_sif.read()
    await cocotb.start(i_sif.write(i_values[1]))
    await ClockCycles(dut.clk_i, 3)
    o_values[1] = await o_sif.read()

    """Check values"""
    assert((i_values == o_values).all())

    """End of simulation"""
    await ClockCycles(dut.clk_i, 10) # wait a bit
    await FallingEdge(dut.clk_i)     # wait for falling edge/"negedge"


@cocotb.test()
async def test_01_single_send_recv(dut):
    """Define the interfaces"""
    i_sif = Sif(dut.clk_i, dut.i_data_i, dut.i_valid_i, dut.i_ready_o)
    o_sif = Sif(dut.clk_i, dut.o_data_o, dut.o_valid_o, dut.o_ready_i)

    """Start clock and reset dut"""
    CLK_PERIOD_NS = 10
    c = Clock(dut.clk_i, CLK_PERIOD_NS, 'ns')
    await cocotb.start(c.start())
    reset_thread = cocotb.start_soon(reset_dut_synch(dut.srst_i, dut.clk_i, clk_count=3))

    """Initial values"""
    dut.en_i.value = 1                # enable dut

    """Wait for reset and send packets"""
    await reset_thread
    i_pkt = np.arange(1, 21)
    await cocotb.start(i_sif.send(packet = i_pkt, valid_pattern="full"))

    rcv_task = await cocotb.start(o_sif.receive(i_pkt.size, ready_pattern="full"))
    await rcv_task
    o_pkt = np.empty((i_pkt.size,), dtype=int)
    for i, v in enumerate(o_sif.get_packet()):
        o_pkt[i] = v

    """Check values"""
    assert((i_pkt == o_pkt).all())

    """End of simulation"""
    await ClockCycles(dut.clk_i, 10) # wait a bit
    await FallingEdge(dut.clk_i)     # wait for falling edge/"negedge"


@cocotb.test()
async def test_02_multiple_send_recv(dut):
    """Define the interfaces"""
    i_sif = Sif(dut.clk_i, dut.i_data_i, dut.i_valid_i, dut.i_ready_o)
    o_sif = Sif(dut.clk_i, dut.o_data_o, dut.o_valid_o, dut.o_ready_i)

    """Start clock and reset dut"""
    CLK_PERIOD_NS = 10
    c = Clock(dut.clk_i, CLK_PERIOD_NS, 'ns')
    await cocotb.start(c.start())
    reset_thread = cocotb.start_soon(reset_dut_synch(dut.srst_i, dut.clk_i, clk_count=3))

    """Initial values and wait for reset """
    dut.en_i.value = 1                # enable dut
    await reset_thread                # wait for reset

    """Send and receive packets"""
    n_packets = 10
    i_pkt = np.arange(0, 20)
    # Queue the reciving tasks and save the last handler
    for i in range(n_packets):
        rcv_task = await cocotb.start(o_sif.receive(i_pkt.size, ready_pattern="full"))
    # Queue the sending tasks
    for i in range(n_packets):
        await cocotb.start(i_sif.send(packet=i_pkt + i, valid_pattern="full"))

    """Wait for the last packet"""
    await rcv_task # rcv_task hast hast handler of the last reiving task

    """Check values"""
    o_pkt = np.empty((i_pkt.size,), dtype=int)
    for i in range(n_packets):
        for j, v in enumerate(o_sif.pop_packet()):
            o_pkt[j] = v
        assert((i_pkt + i == o_pkt).all())

    """End of simulation"""
    await ClockCycles(dut.clk_i, 10) # wait a bit
    await FallingEdge(dut.clk_i)     # wait for falling edge/"negedge"


@cocotb.test()
async def test_03_different_recv_patterns(dut):
    """Define the interfaces"""
    i_sif = Sif(dut.clk_i, dut.i_data_i, dut.i_valid_i, dut.i_ready_o)
    o_sif = Sif(dut.clk_i, dut.o_data_o, dut.o_valid_o, dut.o_ready_i)

    """Start clock and reset dut"""
    CLK_PERIOD_NS = 10
    c = Clock(dut.clk_i, CLK_PERIOD_NS, 'ns')
    await cocotb.start(c.start())
    reset_thread = cocotb.start_soon(reset_dut_synch(dut.srst_i, dut.clk_i, clk_count=3))

    """Initial values and wait for reset """
    dut.en_i.value = 1                # enable dut
    await reset_thread                # wait for reset

    """Send and receive packets"""
    i_pkt = np.arange(21, 41)
    # Queue the receiving tasks and save the last handler
    rcv_task = await cocotb.start(o_sif.receive(i_pkt.size, ready_pattern="full"))
    rcv_task = await cocotb.start(o_sif.receive(i_pkt.size, ready_pattern="full"))
    rcv_task = await cocotb.start(o_sif.receive(i_pkt.size, ready_pattern="full"))
    rcv_task = await cocotb.start(o_sif.receive(i_pkt.size, ready_pattern="full"))
    rcv_task = await cocotb.start(o_sif.receive(i_pkt.size, ready_pattern="full"))
    # Queue the sending tasks
    await cocotb.start(i_sif.send(packet=i_pkt + 0, valid_pattern="full"))
    await cocotb.start(i_sif.send(packet=i_pkt + 1, valid_pattern="deterministic", speed=0.8))
    await cocotb.start(i_sif.send(packet=i_pkt + 2, valid_pattern="random", seed=123)) # If seed is not None, then this is Pseudorandom
    await cocotb.start(i_sif.send(packet=i_pkt + 3, valid_pattern="random", speed=0.8))
    await cocotb.start(i_sif.send(packet=i_pkt + 4, valid_pattern="random", speed=0.8))

    """Wait for the last packet"""
    await rcv_task # rcv_task hast hast handler of the last reiving task

    """Check values"""
    o_pkt = np.empty((i_pkt.size,), dtype=int)
    for i in range(4):
        for j, v in enumerate(o_sif.pop_packet()):
            o_pkt[j] = v
        assert((i_pkt + i == o_pkt).all())

    """End of simulation"""
    await ClockCycles(dut.clk_i, 10) # wait a bit
    await FallingEdge(dut.clk_i)     # wait for falling edge/"negedge"


@cocotb.test()
async def test_04_different_send_patterns(dut):
    """Define the interfaces"""
    i_sif = Sif(dut.clk_i, dut.i_data_i, dut.i_valid_i, dut.i_ready_o)
    o_sif = Sif(dut.clk_i, dut.o_data_o, dut.o_valid_o, dut.o_ready_i)

    """Start clock and reset dut"""
    CLK_PERIOD_NS = 10
    c = Clock(dut.clk_i, CLK_PERIOD_NS, 'ns')
    await cocotb.start(c.start())
    reset_thread = cocotb.start_soon(reset_dut_synch(dut.srst_i, dut.clk_i, clk_count=3))

    """Initial values and wait for reset """
    dut.en_i.value = 1                # enable dut
    await reset_thread                # wait for reset

    """Send and receive packets"""
    i_pkt = np.arange(31, 51)
    # Queue the receiving tasks and save the last handler
    rcv_task = await cocotb.start(o_sif.receive(i_pkt.size, ready_pattern="full"))
    rcv_task = await cocotb.start(o_sif.receive(i_pkt.size, ready_pattern="deterministic", speed=0.8))
    rcv_task = await cocotb.start(o_sif.receive(i_pkt.size, ready_pattern="random", seed=123)) # If seed is not None, then this is Pseudorandom
    rcv_task = await cocotb.start(o_sif.receive(i_pkt.size, ready_pattern="random", speed=0.8))
    rcv_task = await cocotb.start(o_sif.receive(i_pkt.size, ready_pattern="random", speed=0.8))
    # Queue the sending tasks
    await cocotb.start(i_sif.send(packet=i_pkt + 0, valid_pattern="full"))
    await cocotb.start(i_sif.send(packet=i_pkt + 1, valid_pattern="full"))
    await cocotb.start(i_sif.send(packet=i_pkt + 2, valid_pattern="full"))
    await cocotb.start(i_sif.send(packet=i_pkt + 3, valid_pattern="full"))
    await cocotb.start(i_sif.send(packet=i_pkt + 4, valid_pattern="full"))

    """Wait for the last packet"""
    await rcv_task # rcv_task hast hast handler of the last reiving task

    """Check values"""
    o_pkt = np.empty((i_pkt.size,), dtype=int)
    for i in range(5):
        for j, v in enumerate(o_sif.pop_packet()):
            o_pkt[j] = v
        assert((i_pkt + i == o_pkt).all())

    """End of simulation"""
    await ClockCycles(dut.clk_i, 10) # wait a bit
    await FallingEdge(dut.clk_i)     # wait for falling edge/"negedge"


@cocotb.test()
async def test_05_multiple_random(dut):
    """Define the interfaces"""
    i_sif = Sif(dut.clk_i, dut.i_data_i, dut.i_valid_i, dut.i_ready_o)
    o_sif = Sif(dut.clk_i, dut.o_data_o, dut.o_valid_o, dut.o_ready_i)

    """Start clock and reset dut"""
    CLK_PERIOD_NS = 10
    c = Clock(dut.clk_i, CLK_PERIOD_NS, 'ns')
    await cocotb.start(c.start())
    reset_thread = cocotb.start_soon(reset_dut_synch(dut.srst_i, dut.clk_i, clk_count=3))

    """Initial values and wait for reset """
    dut.en_i.value = 1                # enable dut
    await reset_thread                # wait for reset

    """Send and receive packets"""
    n_packets = 10
    i_pkt = np.arange(30, 50)
    # Queue the reciving tasks and save the last handler
    for i in range(n_packets):
        rcv_task = await cocotb.start(o_sif.receive(
                i_pkt.size,
                ready_pattern="random",
                speed=0.1 + 0.8 * i/(n_packets-1)))
    # Queue the sending tasks
    for i in range(n_packets):
        await cocotb.start(i_sif.send(
                packet=i_pkt + i,
                valid_pattern="random",
                speed=0.9 - 0.8 * i/(n_packets-1)))

    """Wait for the last packet"""
    await rcv_task # rcv_task hast hast handler of the last reiving task

    """Check values"""
    o_pkt = np.empty((i_pkt.size,), dtype=int)
    for i in range(n_packets):
        for j, v in enumerate(o_sif.pop_packet()):
            o_pkt[j] = v
        assert((i_pkt + i == o_pkt).all())

    """End of simulation"""
    await ClockCycles(dut.clk_i, 10) # wait a bit
    await FallingEdge(dut.clk_i)     # wait for falling edge/"negedge"


@cocotb.test()
async def test_06_multiple_deterministic(dut):
    """Define the interfaces"""
    i_sif = Sif(dut.clk_i, dut.i_data_i, dut.i_valid_i, dut.i_ready_o)
    o_sif = Sif(dut.clk_i, dut.o_data_o, dut.o_valid_o, dut.o_ready_i)

    """Start clock and reset dut"""
    CLK_PERIOD_NS = 10
    c = Clock(dut.clk_i, CLK_PERIOD_NS, 'ns')
    await cocotb.start(c.start())
    reset_thread = cocotb.start_soon(reset_dut_synch(dut.srst_i, dut.clk_i, clk_count=3))

    """Initial values and wait for reset """
    dut.en_i.value = 1                # enable dut
    await reset_thread                # wait for reset

    """Send and receive packets"""
    n_packets = 10
    i_pkt = np.arange(30, 50)
    # Queue the reciving tasks and save the last handler
    for i in range(n_packets):
        rcv_task = await cocotb.start(o_sif.receive(
                i_pkt.size,
                ready_pattern="deterministic",
                speed=0.1 + 0.8 * i/(n_packets-1)))
    # Queue the sending tasks
    for i in range(n_packets):
        await cocotb.start(i_sif.send(
                packet=i_pkt + i,
                valid_pattern="deterministic",
                speed=0.9 - 0.8 * i/(n_packets-1)))

    """Wait for the last packet"""
    await rcv_task # rcv_task hast hast handler of the last reiving task

    """Check values"""
    o_pkt = np.empty((i_pkt.size,), dtype=int)
    for i in range(n_packets):
        for j, v in enumerate(o_sif.pop_packet()):
            o_pkt[j] = v
        assert((i_pkt + i == o_pkt).all())

    """End of simulation"""
    await ClockCycles(dut.clk_i, 10) # wait a bit
    await FallingEdge(dut.clk_i)     # wait for falling edge/"negedge"


