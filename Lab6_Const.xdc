## Clock signal
set_property PACKAGE_PIN W5 [get_ports clk]							
	set_property IOSTANDARD LVCMOS33 [get_ports clk]
	create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]
 
## Switches
#MSD switches
set_property PACKAGE_PIN V17 [get_ports {loadmeLSD[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {loadmeLSD[0]}]
set_property PACKAGE_PIN V16 [get_ports {loadmeLSD[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {loadmeLSD[1]}]
set_property PACKAGE_PIN W16 [get_ports {loadmeLSD[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {loadmeLSD[2]}]
set_property PACKAGE_PIN W17 [get_ports {loadmeLSD[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {loadmeLSD[3]}]
#LSD switches
set_property PACKAGE_PIN W15 [get_ports {loadmeMSD[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {loadmeMSD[0]}]
set_property PACKAGE_PIN V15 [get_ports {loadmeMSD[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {loadmeMSD[1]}]
set_property PACKAGE_PIN W14 [get_ports {loadmeMSD[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {loadmeMSD[2]}]
set_property PACKAGE_PIN W13 [get_ports {loadmeMSD[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {loadmeMSD[3]}]
#mode switches
set_property PACKAGE_PIN T1 [get_ports {select[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {select[0]}]
set_property PACKAGE_PIN R2 [get_ports {select[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {select[1]}]
 

##7 segment display
set_property PACKAGE_PIN W7 [get_ports {sseg[6]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {sseg[6]}]
set_property PACKAGE_PIN W6 [get_ports {sseg[5]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {sseg[5]}]
set_property PACKAGE_PIN U8 [get_ports {sseg[4]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {sseg[4]}]
set_property PACKAGE_PIN V8 [get_ports {sseg[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {sseg[3]}]
set_property PACKAGE_PIN U5 [get_ports {sseg[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {sseg[2]}]
set_property PACKAGE_PIN V5 [get_ports {sseg[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {sseg[1]}]
set_property PACKAGE_PIN U7 [get_ports {sseg[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {sseg[0]}]
	
	set_property PACKAGE_PIN V7 [get_ports dp]							
	set_property IOSTANDARD LVCMOS33 [get_ports dp]


set_property PACKAGE_PIN U2 [get_ports {an[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {an[0]}]
set_property PACKAGE_PIN U4 [get_ports {an[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {an[1]}]
set_property PACKAGE_PIN V4 [get_ports {an[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {an[2]}]
set_property PACKAGE_PIN W4 [get_ports {an[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {an[3]}]


##Buttons
set_property PACKAGE_PIN W19 [get_ports startbutton]						
	set_property IOSTANDARD LVCMOS33 [get_ports startbutton]
set_property PACKAGE_PIN T17 [get_ports reset]						
	set_property IOSTANDARD LVCMOS33 [get_ports reset]
