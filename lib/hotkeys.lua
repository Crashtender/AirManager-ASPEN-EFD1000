function init_bezel_keys()

	---        bezel_key  1 TPS         ---
	-------- Tapes display -----------------
	function display_tapes(display)
		-- si l'affichage des tapes a été demandé
		-- if tapes_displayed == false then
		if (display == true and tapes_displayed==false) then
			tapes_displayed = true
			-- on diminue la zone d'affichage de l'échelle de roulis quand les tapes sont affichées
			viewport_rect(img_roll, 165, 0, 475, 800)
			-- affichage légende sur menu latéral
			visible(img_TPSlegend_green,true)
			visible(img_TPSlegend_gray,false)
		else
			tapes_displayed = false
			viewport_rect(img_roll, 0, 0, 800, 800)
			-- affichage légende sur menu latéral
			visible(img_TPSlegend_green,false)		
			visible(img_TPSlegend_gray,true)
		end
		visible (img_tapesbackground,tapes_displayed) 
		visible (img_altbug_blue,tapes_displayed) 
		visible (img_altbug_magenta,tapes_displayed) 
		visible (img_speedbug_blue,tapes_displayed) 
		visible (img_speedbug_magenta,tapes_displayed) 
		visible (img_speedbox,tapes_displayed)
		visible (img_altbox,tapes_displayed) 

		visible (img_spdred_low,tapes_displayed)
		visible (img_spdwhite0,tapes_displayed)
		visible (img_spdwhite1,tapes_displayed)
		visible (img_spdgreen,tapes_displayed) 
		visible (img_spdyellow,tapes_displayed)
		visible (img_spdred,tapes_displayed)

		visible (running_img_alt,tapes_displayed)
		visible (running_img_speed_norm,tapes_displayed)
		visible (running_text_inner_alt_major100_id,tapes_displayed)
		visible (running_text_inner_alt_major1000_id,tapes_displayed)
		visible (running_text_inner_alt_minor_id,tapes_displayed)
		visible (running_text_inner_speed_minor_displayed,tapes_displayed)
		visible (running_text_inner_speed_major_displayed,tapes_displayed)
		--visible (running_text_inner_speed_minor_id,tapes_displayed)
		--visible (running_text_inner_speed_major_id,tapes_displayed)
		--visible (running_text_inner_speed_minor_id_red,tapes_displayed)
		--visible (running_text_inner_speed_major_id_red,tapes_displayed)
		visible (running_text_alt,tapes_displayed)
		visible (running_text_speed,tapes_displayed)
		visible(img_altreddash,tapes_displayed)
		visible(img_spdreddash,tapes_displayed)
	end-- 

end