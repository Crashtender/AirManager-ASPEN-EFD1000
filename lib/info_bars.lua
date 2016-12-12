function init_info_bars()

---------------------------------------------------------------
-- Information bar top --
function new_infobartop(apspeed, apalt, airspeed)
	img_visible(img_headind,false)
	img_visible(img_headindblue,true)
-- Autopilot airspeed setting
txt_style(txt_apspd1,"-fx-font-size:44px; -fx-font-family:Arial; -fx-fill: magenta; -fx-font-weight:bold; -fx-text-alignment:left;")
txt_style(txt_apspd2,"-fx-font-size:32px; -fx-font-family:Arial; -fx-fill: magenta; -fx-font-weight:bold; -fx-text-alignment:left;")
--apspeedcap = var_cap(apspeed, 20, 450)
	if apspeed >= 20 and apspeed <=450 then
		txt_set(txt_apspd1, apspeed)
		txt_set(txt_apspd2, "kt")
		visible(img_speedbug_blue,true)
		visible(img_speedbug_magenta,true)
		if apspeed >= 100 then
			txt_move(txt_apspd2,93,nil,nil,nil)
		else
			txt_move(txt_apspd2,68,nil,nil,nil)
		end
	else
		txt_set(txt_apspd1, "---")
		txt_set(txt_apspd2, " ")
		visible(img_speedbug_blue,false)
		visible(img_speedbug_magenta,false)
		end
-- Autopilot airspeed bug
	y_speedbug = ((apspeed - airspeed) * -6.6) + 383-30--350
	-- y_speedbug = var_cap(y_speedbug, -8, 1000)
	if apspeed > 30 then
		move(img_speedbug_blue,nil,y_speedbug,nil,nil)
		move(img_speedbug_magenta,nil,y_speedbug,nil,nil)
	else
		move(img_speedbug_blue,nil,-8,nil,nil)
		move(img_speedbug_magenta,nil,-8,nil,nil)
	end
	
-- Autopilot altitude setting
txt_style(txt_apalt1,"-fx-font-size:44px; -fx-font-family:Arial; -fx-fill: magenta; -fx-font-weight:bold; -fx-text-alignment:right;")
txt_style(txt_apalt2,"-fx-font-size:38px; -fx-font-family:Arial; -fx-fill: magenta; -fx-font-weight:bold; -fx-text-alignment:right;")
apaltcap = var_cap(apalt, 100, 51000)
	if apalt==0 then
		txt_set(txt_apalt1, "")
		txt_set(txt_apalt2, "")
	elseif apalt >= 1000 then
		txt_set(txt_apalt1, string.format("%3d",(apaltcap/1000)))
		txt_set(txt_apalt2, string.format("%03d",apaltcap%1000))
	else
		txt_set(txt_apalt1, "")
		txt_set(txt_apalt2, string.format("%03d",apaltcap%1000))
	end
end -- function


-- Information bar center --
function new_infobarcenter(tas, gs, oat, winddir, windspd, heading, inhg)
	img_visible(img_headind,false)
	img_visible(img_headindblue,true)
-- True airspeed and ground speed
if tas==0 then
	txt_set(txt_tas, "---")
	txt_set(txt_gs, "---")
else
	txt_set(txt_tas, var_round(tas * 1.94384449, 0))
	txt_set(txt_gs, var_round(gs * 1.94384449, 0))
end	
-- Outside air temperature
	txt_set(txt_oat, var_round(oat, 0) .. "\°c")
	
-- Wind direction and speed
if tas>10 then --if speed >10kts wind is displayed
	visible(txt_wind,true)
	txt_set(txt_wind, var_round(winddir, 0) .. "\°/" .. var_round(windspd, 0) .. " kt")
	visible(img_windarrow,true)
	img_rotate(img_windarrow, (winddir + 180) - heading)
else
	visible(txt_wind,false)
	visible(img_windarrow,false)
end

-- Barometric setting
--on passe le texte en magenta
txt_style(txt_inhg,"-fx-font-size:40px; -fx-font-family:Arial; -fx-fill: magenta; -fx-font-weight:bold; -fx-text-alignment:right;")
txt_style(txt_inhg_unit,"-fx-font-size:24px; -fx-font-family:Arial; -fx-fill: magenta; -fx-font-weight:bold; -fx-text-alignment:right;")
if baro_unit=="Millibars" then
	txt_set(txt_inhg, var_round(inhg * 33.8639, 0)) -- affichage en millibars
else 
	txt_set(txt_inhg, var_format(inhg, 2)) -- affichage en InHg
end
end

				   
-- Heading and turnrate indicator --
function new_heading(elecheading, turnrate)

-- Rotate compass
	img_rotate(img_compasrose, elecheading * -1)
	txt_set(txt_compheading, string.format("%03d" .. "\°", math.floor(elecheading) ))
	running_txt_move_carot(compass_inner_txt_id, (elecheading / 30) + 6)
    running_txt_move_carot(compass_inner_txt_id2, (elecheading / 30) + 6)
-- Turn indicator
	
	--dispturnrate = var_cap(turnrate, -20, 20)
	
	angturnrate=turnrate*8/3
	--print(turnrate)
	--print(angturnrate.."***")
	if turnrate > 0 then
		img_rotate(img_turnright, angturnrate-8)
		--img_rotate(img_turnright, dispturnrate - 10)
	else
		img_rotate(img_turnright, 0)
	end
	
	if turnrate < 0 then
		img_rotate(img_turnleft, angturnrate+8)
		--img_rotate(img_turnleft, dispturnrate + 10)
	else
		img_rotate(img_turnleft, 8)
	end
	
end

function new_heading_FSX(elecheading, turnrate)

	new_heading(elecheading, turnrate )--* -40
	
end

-- Vertical speed indicator --
function new_vsi(vs)
	
	if vs <= 999 and vs >= -999 then
		vsi = var_round(vs / 10, 0) * 10
	elseif vs > 999 or vs < -999 then
		vsi = var_round(vs / 100, 0) * 100
	end

	if vs >= 10 then
		txt_set(txt_vsi, "+" .. vsi)
		txt_set(txt_vsi2,"FPM")
	elseif vs <= -10 then
		txt_set(txt_vsi, vsi)
		txt_set(txt_vsi2,"FPM")
	else
		txt_set(txt_vsi, " ")
		txt_set(txt_vsi2,"")
	end
	
end

end