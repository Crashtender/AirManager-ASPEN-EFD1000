function init_altimeter()

	-- TODO SPLIT UP ALT/SPD 

	------ Altitude, speed and radar altimeter --
	function new_altitudeorspeed(radalt, decisionheight, altitude, airspeed, altbug)
	
		img_visible(img_headind,false)
		img_visible(img_headindblue,true)
		-- VNO, VNE and all speedbars
		y_yellow = ((airspeed - vno) * 6.6) - 3000+381 -- -taille image + position en Y en bas (niveau horizon)
		--y_yellow = var_cap(y_yellow, -469, 42)
		if vno > 0 then
			move(img_spdyellow,nil,y_yellow,nil,nil)
		else
			visible(img_spdyellow,false)--(move(img_spdyellow,nil,-469,nil,nil)
		end

		y_red = ((airspeed - vne) * 6.6) - 3000+381 -- -taille image + position en Y en bas
		--y_red = var_cap(y_red, -469, 42)
		if vne > 0 then
			move(img_spdred,nil,y_red,nil,nil)
			move(img_spdred_dash,nil,y_red+3000-4,nil,nil)
		else
			visible(img_spdred,false)-- move(img_spdred,nil,-469,nil,nil)
			visible(img_spdred_dash,false)
		end
		
		y_green = ((airspeed - vfe) * 6.6) - 3000+381 -- -taille image + position en Y en bas
		--y_green = var_cap(y_green, -469, 42)
		if vfe > 0 then
			move(img_spdgreen,nil,y_green,nil,nil)
		else
			visible(img_spdgreen,false)-- move(img_spdgreen,nil,-469,nil,nil)
		end	
		
		y_white1= ((airspeed - vs) * 6.6) - 3000+381 -- -taille image + position en Y en bas
		--y_white1 = var_cap(y_white1, -469, 42)
		if vs > 0 then
			move(img_spdwhite1,nil,y_white1,nil,nil)
		else
			visible(img_spdwhite1,false)--move(img_spdwhite1,nil,-469,nil,nil)
		end	
		
		y_white0= ((airspeed - vs0) * 6.6) - 3000+381 -- -taille image + position en Y en bas
		--y_white1 = var_cap(y_white1, -469, 42)
		if vs0 > 0 then
			move(img_spdwhite0,nil,y_white0,nil,nil)
		else
			visible(img_spdwhite0,false) --move(img_spdwhite0,nil,-469,nil,nil)
		end	
		
		y_red_low = ((airspeed - 0) * 6.6) - 3000+381 -- -taille image + position en Y en bas
		--y_white1 = var_cap(y_white1, -469, 42)
		if vs0 > 0 then
			move(img_spdred_low,nil,y_red_low,nil,nil)
		else
			visible(img_spdred_low,false)--move(img_spdred,nil,-469,nil,nil)
		end	
		
		-- Speed indicator running image
		airspeed = var_cap(airspeed, 0, 450) -- max speeds displayed

		yspeed = (airspeed * 6.6) + 450--383  
		-- yspeed = var_cap(yspeed, 302, 604)
		-- if airspeed<=30 then -- speed tape is freezed

		-- running_txt_move_carot(running_text_speed, -2) -- affichage bloqué à 20 kts (indice 2)
		-- running_img_move_carot(running_img_speed_norm, 5) -- affichage bloqué au premier trait
		-- viewport_rect(running_text_speed,0,52,95,302) -- on affiche que la partie supérieure du ruban
		-- viewport_rect(running_text_speed,0,52,95,302) -- on affiche que la partie supérieure du ruban
		-- viewport_rect(running_img_speed_norm,72,52,34,302)
		-- viewport_rect(running_img_speed_norm,80,52,200,302)
		-- viewport_rect(running_img_speed_norm,72,52,100,606)
		-- else
		
		if airspeed >= 450 then --speed tape is freezed
			visible(img_spdreddash,true)
			viewport_rect(running_text_speed,0,52,95,602)
			-- running_txt_move_carot(running_text_speed, -45) -- affichage bloqué à 450 kts max (indice 45)
			-- running_img_move_carot(running_img_speed_norm, 45) -- affichage bloqué au dernier trait
			-- viewport_rect(running_text_speed,0,302,95,302)
			-- viewport_rect(running_text_speed,nil,nil,nil,604)
			-- viewport_rect(running_img_speed_norm,72,52+302,34,302)

			-- yspeed = 300 + (airspeed * 6.6)
			-- yspeed = var_cap(yspeed, 300, 511)

			----- fin section inutile?
			--running_txt_viewport_rect(running_text_speed,0,52+302,95,302) -- on affiche que la partie inférieure
			--running_img_viewport_rect(running_img_speed_norm,72,52+604,34,302)
		else -- "displayable" speed
			visible(img_spdreddash,false)
			running_txt_move_carot(running_text_speed, (airspeed / 10) * -1)
			running_img_move_carot(running_img_speed_norm, (airspeed / 10) * -1)

			--running_txt_viewport_rect(running_text_speed,0,52,95,yspeed)
			viewport_rect(running_text_speed,0,52,95,yspeed)
			--running_img_viewport_rect(running_img_speed_norm,72,52,34,yspeed)
		end
		--running_img_
		viewport_rect(running_img_speed_norm,72,52,50,yspeed-100)

		
		-- Speed indicator running text (drum)
		if airspeed >vs0 and airspeed < vne then -- affichage de la vitesse en blanc
			overspeed=false
			visible(running_text_inner_speed_minor_id_red,false)
			visible(running_text_inner_speed_minor_id,true)
			visible(running_text_inner_speed_major_id_red,false)
			visible(running_text_inner_speed_major_id,true)
			running_text_inner_speed_minor_displayed=running_text_inner_speed_minor_id
			running_text_inner_speed_major_displayed=running_text_inner_speed_major_id
		else -- affichage de la vitesse en rouge
			overspeed=true
			visible(running_text_inner_speed_minor_id_red,true)
			visible(running_text_inner_speed_minor_id,false)
			visible(running_text_inner_speed_major_id_red,true)
			visible(running_text_inner_speed_major_id,false)
			running_text_inner_speed_minor_displayed=running_text_inner_speed_minor_id_red
			running_text_inner_speed_major_displayed=running_text_inner_speed_major_id_red
		end

		if airspeed<=20 then 
			running_txt_move_carot(running_text_inner_speed_minor_displayed, 0) -- display freezed
			running_txt_move_carot(running_text_inner_speed_major_displayed, 0) -- display freezed
		else
			running_txt_move_carot(running_text_inner_speed_minor_displayed, (airspeed / 1) * -1)
			if airspeed % 10 > 9 then
				running_txt_move_carot(running_text_inner_speed_major_displayed, ( airspeed - 9 - (math.floor(airspeed / 10) * 9) ) * -1 )
			else
				running_txt_move_carot(running_text_inner_speed_major_displayed, math.floor(airspeed / 10) * -1)
			end
		end -- if airspeed<=20
		
		-----------------------------------------
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

	function new_altitudeorspeed_fsx(radalt, altitude, airspeed, altbug)

		new_altitudeorspeed(radalt, 0, altitude, airspeed, altbug)
	--function new_altitudeorspeed(radalt, dh, altitude, airspeed, altbug)	
	end

end