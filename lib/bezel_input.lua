function init_bezel_input()

-----------------------------------------------------------
-- intercommunication with bezel gauge Buttons and dials --
-----------------------------------------------------------

-- Button REV (ON/OFF)
function new_latbuttonrevstate(latbuttonrevstate)
--print(latbuttonrevstate)
buttonpressed=true
if latbuttonrevstate==1 then
	if off_state== false then -- lance la procédure d'arrêt
		shutdown_sequence()
		--off_state = true
		else -- lance le démarrage
		startup_sequence()
		--off_state = false
		end
	end--if
end-- 
----------------------------------------------------------------------------
am_variable_subscribe("am_latbuttonrevstate","INT",new_latbuttonrevstate)
new_latbuttonrevstate(1) -- force la jauge sur ON en mode debug 
----------------------------------------------------------------------------
-- Button 1 (TPS)
function new_latbutton1state(latbutton1state)
buttonpressed=true
--print(latbutton1state)
if (latbutton1state==1) then
	if tapes_displayed==false then
	display_tapes(true) 
	else
	display_tapes(false)
	end
end
end
am_variable_subscribe("am_latbutton1state","INT",new_latbutton1state)

-- Button 2 (MIN)
function new_latbutton2state(latbutton2state)
buttonpressed=true
--print(latbutton2state)
if latbutton2state==1 then
	-- si l'affichage des tapes a été demandé
	if min_displayed == false then
		min_displayed = true
		
		-- affichage légende sur menu latéral
		visible(img_MINlegend_green,true)
		visible(img_MINlegend_gray,false)
	else
		min_displayed = false
		-- affichage légende sur menu latéral
		visible(img_MINlegend_green,false)		
		visible(img_MINlegend_gray,true)
	end
end--if
-- affichage du minimum

end-- 
am_variable_subscribe("am_latbutton2state","INT",new_latbutton2state)

-- Bottom Center button
function new_centerbuttonstate(HSIsource)
buttonpressed=true
if HSIsource>2 then 
HSIsource=1
end
if HSIsource==1 then
--txt_set(txt_centerbutton,"VLOC1")
hsimode=0
elseif HSIsource==2 then
hsimode=1
--txt_set(txt_centerbutton,"VLOC2")
else
hsimode=2
--txt_set(txt_centerbutton,"GPS1")
end

end
am_variable_subscribe("am_centerbuttonstate","INT",new_centerbuttonstate)

-- Bottom Left button
function new_leftbuttonstate(RMI1source)
buttonpressed=true
if RMI1source>3 then 
	RMI1source=0
end
if RMI1source==0 then
	txt_set(txt_leftbutton,"")
	rmi1mode=0 --VOR1
	visible(img_redslash_leftbutton,false)
elseif RMI1source==1 then
	rmi1mode=1 -- VOR2
elseif RMI1source==2 then
	rmi1mode=2
else
	rmi1mode=3 -- GPS1
end
end -- function
am_variable_subscribe("am_leftbuttonstate","INT",new_leftbuttonstate)

-- Bottom Right button
function new_rightbuttonstate(RMI2source)
buttonpressed=true
if RMI2source>3 then 
RMI2source=0
end
if RMI2source==0 then
txt_set(txt_rightbutton,"")
rmi2mode=0
visible(img_redslash_rightbutton,false)
elseif RMI2source==1 then
txt_set(txt_rightbutton,"VOR1")
rmi2mode=1
elseif RMI2source==2 then
rmi2mode=2
txt_set(txt_rightbutton,"VOR2")
else
rmi2mode=3
txt_set(txt_rightbutton,"GPS1")
end

end-- function
am_variable_subscribe("am_rightbuttonstate","INT",new_rightbuttonstate)

end