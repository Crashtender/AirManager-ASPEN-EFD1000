function init_altimeter()

	-- TODO SPLIT UP ALT/SPD 

	------ Altitude, speed and radar altimeter --
	function new_altitude(radalt, decisionheight, altitude, altbug)
	
		img_visible(img_headind,false)		-- TODO
		img_visible(img_headindblue,true)	-- What has this to do with alt????
		
		--Altitude indicator running image
		altitudecap = var_cap(altitude, -1600, 51000) -- maximum displayed altitude

		running_txt_move_carot(running_text_alt, (altitudecap / 100) * -1)
		running_img_move_carot(running_img_alt, (altitudecap / 100) * -1)
		
		yalt = 900 + (altitudecap * 1.16)
		-- yalt = var_cap(yaltcap, 300, 2000)
		
		-- running_txt_viewport_rect(running_text_alt,663,42,137,yalt)
		-- running_img_viewport_rect(running_img_alt,663,42,137,yalt)
		-- running_txt_viewport_rect(running_text_alt,630,42,200,yalt)
		-- running_img_viewport_rect(running_img_alt,630,42,200,yalt)
		if altitude>=51000 then -- maximum displayed altitude
			--visible(img_altreddash,true)
			running_txt_viewport_rect(running_text_alt,630,42+302,250,295)
			viewport_rect(running_img_alt,630,42+302+23,200,272)
		else
			--visible(img_altreddash,false)
			running_txt_viewport_rect(running_text_alt,630,42,250,615)
			viewport_rect(running_img_alt,630,42,200,615)
		end
		--Altitude indicator running text
		running_txt_move_carot(running_text_inner_alt_minor_id, (altitude / 10) * -1)
		
		
		-- running_txt_move_carot(running_text_inner_alt_major100_id, ( math.floor(altitude / 100) * -1 ))
		-- running_txt_move_carot(running_text_inner_alt_major1000_id, math.floor( altitude / 1000 ) * -1)
		
		
		if altitude % 100 > 90 then
			running_txt_move_carot(running_text_inner_alt_major100_id, ( altitude - 90 - (math.floor(altitude / 100) * 90) ) * -0.1 )
		else
			running_txt_move_carot(running_text_inner_alt_major100_id, math.floor(altitude / 100) * -1)
		end
		
		if (altitude % 1000) > 990 then
			running_txt_move_carot(running_text_inner_alt_major1000_id, (( altitude - 990 - (math.floor(altitude / 1000) * 990) ) * -0.1))
		else
			running_txt_move_carot(running_text_inner_alt_major1000_id, math.floor( altitude / 1000 ) * -1)
		end
		
		-- Autopilot altitude bug
		y_altbug = ((altbug - altitude) * -1.16) + 350
		y_altbug = var_cap(y_altbug, -8, 1000)
		if altbug > 0 then
			move(img_altbug_blue,nil,y_altbug,nil,nil)
			move(img_altbug_magenta,nil,y_altbug,nil,nil)
		else
			move(img_altbug_blue,nil,-8,nil,nil)
			move(img_altbug_magenta,nil,-8,nil,nil)
		end

		-- altbox displayed if within +/-25ft and +/-200ft of captured alt
		if altbug > 0 then
			altdelta=altbug - altitude
			if  altdelta<= 200 and altdelta >= 25 then
				visible(img_apaltbox, true)
			elseif altdelta >= -200 and altdelta <=-25 then 
				visible(img_apaltbox, true)
			else
				visible(img_apaltbox, false)
			end
		end
	-- end <<<<<<<<<<<<< REDUNDANT???? TODO
	
		-- Warning sound altitude captured
		if (altbug > 0) and (altdelta <= 200) and (altdelta >= -200) then
		
			if altwarning == false then
				sound_play(snd_apaltwarning)
			end
			
			altwarning = true
		else
			altwarning = false
		end
	 
		-- Decision height indicator at 10 feet and below
		visible(img_decisionheight, (decisionheight > 0) and (radalt < (decisionheight + 10)) )
		if (decisionheight > 0) and (radalt < (decisionheight + 10)) then
		
			if decisionheightwarning == false then
				sound_play(snd_dhwarning)
			end
			
			decisionheightwarning = true
		else
			decisionheightwarning = false
		end
	end

	function new_altitude_fsx(radalt, altitude, altbug)

		new_altitude(radalt, 0, altitude, altbug)
		--function new_altitude(radalt, dh, altitude, airspeed, altbug)	
	end
	
	xpl_dataref_subscribe("sim/cockpit2/gauges/indicators/radio_altimeter_height_ft_pilot", "FLOAT",
					  "sim/cockpit/misc/radio_altimeter_minimum", "FLOAT",
					  "sim/flightmodel/misc/h_ind", "FLOAT",
					  "sim/cockpit/autopilot/altitude", "FLOAT", new_altitude)
	fsx_variable_subscribe("RADIO HEIGHT", "FEET",
					   "INDICATED ALTITUDE", "FEET",
					   "AUTOPILOT ALTITUDE LOCK VAR", "FEET", new_altitude_fsx)

end