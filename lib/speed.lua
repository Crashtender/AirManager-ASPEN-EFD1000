function init_speed()
	
	function new_speed(airspeed)
	
		img_visible(img_headind,false)		-- TODO
		img_visible(img_headindblue,true)	-- What has this to do with spd????
		
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
	end

	function new_speed_fsx(airspeed)
		new_speed(airspeed)
		--function new_speed(radalt, dh, altitude, airspeed, altbug)	
	end
	
	xpl_dataref_subscribe(	"sim/cockpit2/gauges/indicators/airspeed_kts_pilot", "FLOAT", new_speed)
							--"sim/aircraft/view/acf_Vne", "FLOAT",
							--"sim/aircraft/view/acf_Vno", "FLOAT", 


	fsx_variable_subscribe("AIRSPEED INDICATED", "KNOTS", new_speed_fsx)


end