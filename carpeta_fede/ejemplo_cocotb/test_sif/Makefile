# Makefile

# defaults
SIM ?= icarus
TOPLEVEL_LANG ?= verilog

VERILOG_SOURCES = sif_driver_test.v

# use VHDL_SOURCES for VHDL files

# TOPLEVEL is the name of the toplevel module in your Verilog or VHDL file
TOPLEVEL = sif_driver_test

# MODULE is the basename of the Python test file
MODULE = test_00

COMPILE_ARGS = -Psif_driver_test.I_WW=10 -Psif_driver_test.O_WW=10

# include cocotb's make rules to take care of the simulator setup
include $(shell cocotb-config --makefiles)/Makefile.sim
