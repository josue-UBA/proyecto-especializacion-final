import cocotb
from cocotb.triggers import RisingEdge, FallingEdge, Timer
from cocotb.binary import BinaryValue

import numpy as np
import random


class Sif:
    def __init__(self, clk_signal, data_signal, valid_signal, ready_signal):
        """Set SIF signals"""
        self._clk = clk_signal
        self._data = data_signal
        self._valid = valid_signal
        self._ready = ready_signal
        assert(self._clk.value.n_bits == 1)
        assert(self._valid.value.n_bits == 1)
        assert(self._ready.value.n_bits == 1)
        self._packet = list()
        self._packet_list = list()
        self._receiving = 0
        self._sending = 0
        self._receive_id = 0

    def get_packet(self):
        """Return received packet"""
        return self._packet

    def packet_available(self):
        """Return if there is a packet available"""
        if len(self._packet_list) > 0:
            return True
        else:
            return False

    def pop_packet(self):
        """Return received packet"""
        if len(self._packet_list) > 0:
            #print(f"POP: pkg_list_len = {len(self._packet_list)}")
            return self._packet_list.pop(0)
        else:
            return None

    async def write(self, data):
        """Set initial data and wait for the next clock"""
        self._data.value = int(data)
        self._valid.value = 1
        await RisingEdge(self._clk)
        """Wait until the ready signal is_resolvable"""
        while not(self._ready.value.is_resolvable):
            await RisingEdge(self._clk)
        """Wait until the SIF is ready"""
        while not(self._ready.value.integer == 1):
            await RisingEdge(self._clk)
        self._valid.value = 0

    async def read(self):
        """Set initial data and wait for the next clock"""
        self._ready.value = 1
        await RisingEdge(self._clk)
        """Wait until the valid signal is_resolvable"""
        while not(self._valid.value.is_resolvable):
            await RisingEdge(self._clk)
        """Wait until the SIF is valid"""
        while not(self._valid.value == 1):
            await RisingEdge(self._clk)
        self._ready.value = 0
        return self._data.value

    async def send(self, packet, valid_pattern = "full", mode = "no-wait", speed = 0.5, seed = None):
        """ Send Packet to a Stream Interface """
        while self._sending == 1:
            await RisingEdge(self._clk)
        self._sending = 1
        packet_length = len(list(packet))
        pattern = self._generate_pattern(
                type_ = valid_pattern,
                length = packet_length,
                speed = speed,
                seed = seed)
        aux = list(packet)
        for valid in pattern:
            if valid == 1:
                data = aux.pop(0)
                await self.write(data)
            else:
                self._valid.value = 0
                #await RisingEdge(self._clk)
                if mode == "no-wait":
                    await RisingEdge(self._clk)
                elif mode == "wait":
                    while not(self._ready.value.is_resolvable):
                        await RisingEdge(self._clk)
                    while self._ready.value == 0:
                        await RisingEdge(self._clk)
                    await RisingEdge(self._clk)
                else:
                    raise ValueError("Wrogn mode. Valid modes are 'wait' and 'no-wait'")
        self._sending = 0

    async def receive(self, packet_length, ready_pattern = "full", mode = "no-wait", speed = 0.5, seed = None):
        """ Receive Packet from a Stream Interface """
        self._receive_id += 1
        #print(f"ENTRO: {self._receive_id}")
        while self._receiving == 1:
            await RisingEdge(self._clk)
        self._receiving = 1
        packet = list()
        self._packet = packet
        pattern = self._generate_pattern(
                type_ = ready_pattern,
                length = packet_length,
                speed = speed,
                seed = seed)
        for ready in pattern:
            if ready == 1:
                transfer = await self.read()
                packet.append(transfer)
            else:
                self._ready.value = 0
                #await RisingEdge(self._clk)
                if mode == "no-wait":
                    await RisingEdge(self._clk)
                elif mode == "wait":
                    while not(self._valid.value.is_resolvable):
                        await RisingEdge(self._clk)
                    while self._valid.value == 0:
                        await RisingEdge(self._clk)
                    await RisingEdge(self._clk)
                else:
                    raise ValueError("Wrogn mode. Valid modes are 'wait' and 'no-wait'")
        self._packet = packet
        self._packet_list.append(packet)
        #print(f"SALGO: {self._receive_id} pkg_list_len = {len(self._packet_list)}")
        self._receive_id -= 1
        self._receiving = 0
        return packet

    def _generate_pattern(self, type_, length, speed = None, seed = None):
        # Keep track of the RNG state and set new seed
        old_state = np.random.get_state()
        random.seed(seed)
        if type_ == "full":
            pattern = np.ones((length,), dtype = int)
        elif type_ == "random":
            pattern = list()
            while np.sum(pattern) < length:
                if random.random() <= speed:
                    pattern.append(1)
                else:
                    pattern.append(0)
        elif type_ == "deterministic":
            pattern = list()
            pattern.append(1)
            while np.sum(pattern) < length:
                if np.mean(pattern) <= speed:
                    pattern.append(1)
                else:
                    pattern.append(0)
        else:
            raise ValueError(f"Invalid pattern generator type: {type_}")
        pattern = list(pattern)
        # Restore the original RNG state
        np.random.set_state(old_state)
        return pattern




