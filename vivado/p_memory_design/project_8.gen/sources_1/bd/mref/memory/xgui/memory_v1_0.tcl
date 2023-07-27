# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "MEM_BUS_SIZE" -parent ${Page_0}
  ipgui::add_param $IPINST -name "MEM_SIZE" -parent ${Page_0}
  ipgui::add_param $IPINST -name "WORD_BUS_SIZE" -parent ${Page_0}


}

proc update_PARAM_VALUE.MEM_BUS_SIZE { PARAM_VALUE.MEM_BUS_SIZE } {
	# Procedure called to update MEM_BUS_SIZE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.MEM_BUS_SIZE { PARAM_VALUE.MEM_BUS_SIZE } {
	# Procedure called to validate MEM_BUS_SIZE
	return true
}

proc update_PARAM_VALUE.MEM_SIZE { PARAM_VALUE.MEM_SIZE } {
	# Procedure called to update MEM_SIZE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.MEM_SIZE { PARAM_VALUE.MEM_SIZE } {
	# Procedure called to validate MEM_SIZE
	return true
}

proc update_PARAM_VALUE.WORD_BUS_SIZE { PARAM_VALUE.WORD_BUS_SIZE } {
	# Procedure called to update WORD_BUS_SIZE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.WORD_BUS_SIZE { PARAM_VALUE.WORD_BUS_SIZE } {
	# Procedure called to validate WORD_BUS_SIZE
	return true
}


proc update_MODELPARAM_VALUE.WORD_BUS_SIZE { MODELPARAM_VALUE.WORD_BUS_SIZE PARAM_VALUE.WORD_BUS_SIZE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.WORD_BUS_SIZE}] ${MODELPARAM_VALUE.WORD_BUS_SIZE}
}

proc update_MODELPARAM_VALUE.MEM_SIZE { MODELPARAM_VALUE.MEM_SIZE PARAM_VALUE.MEM_SIZE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.MEM_SIZE}] ${MODELPARAM_VALUE.MEM_SIZE}
}

proc update_MODELPARAM_VALUE.MEM_BUS_SIZE { MODELPARAM_VALUE.MEM_BUS_SIZE PARAM_VALUE.MEM_BUS_SIZE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.MEM_BUS_SIZE}] ${MODELPARAM_VALUE.MEM_BUS_SIZE}
}
