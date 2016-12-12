
function init_global_vars()

	----------------------
	-- Global variables --
	----------------------
	decisionheightwarning = true
	altwarning = true
	mode=0 --source for HSI 0=GPS1 1=VLOC1 2=VLOC2
	tapes_displayed = true -- tapes
	off_state=true -- instrument is off
	buttonpressed=false
	hsimode=0 -- vor1
	rmi1mode=0 --
	rmi2mode=0 --

	gpswptname="GPSWPT"
	overspeed=false
	running_text_inner_speed_minor_displayed=running_text_inner_speed_minor_id
	running_text_inner_speed_major_displayed=running_text_inner_speed_major_id

end