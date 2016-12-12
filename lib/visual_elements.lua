function init_visual_elements()


	-------------------------------------------------------
	-- Add images in Z-order                             --
	-- ne pas changer l'ordre d'affichage!               --
	-------------------------------------------------------

	img_horizon = img_add("horizon.png", -400, -1522 + 382, 2000, 3500)
	img_horizonscale = img_add("horizonscale2.png",-400,-1522+382+250,2000,3500)

	img_flightdirector = img_add("flightdirector.png", 222, 382, 354, 56) -- maquette du Flight director

	img_add("background2.png",0,0,800,1522) -- fond de jauge
	---------------------------------------------------------
	--           fond de jauge modele pour debug           --
	--           et positionnement NE PAS DECOMMENTER      --
	-- img_add_fullscreen("modele.png")
	---------------------------------------------------------

	-----------------------------------
	-- gauge upper section (horizon) --
	-----------------------------------
	-- affichage de l'horizon
	img_decisionheight = img_add("dhind.png", 215, 24, 34, 34) -- indicateur DH

	img_roll = img_add("roll3.png", 2, -20, 801, 800) -- inclinaison
	img_slip = img_add("slip.png", 252, 82, 38, 8)--  Bille

	---------- SPD & ALT TAPES --------
	-- affichage du fond grisé (tapes)
	img_tapesbackground = img_add("tapesbackground.png", 0, 51, 800, 606) 

	----------- color speed tapes
	-- do not change the display order!

	img_spdred_low = img_add("speedred2.png", 96, -600, 20, 3000)
	img_spdwhite0 = img_add("speedwhite.png", 96, -600, 20, 3000)
	img_spdwhite1 = img_add("speedgreen.png", 96, -600, 20, 3000)
	img_spdgreen = img_add("speedgreen.png", 96, -600, 20, 3000)
	img_spdyellow = img_add("speedyellow.png", 96, -600, 20, 3000)
	img_spdred_dash = img_add("speedred_dash.png", 80, -600, 50, 8)
	img_spdred = img_add("speedred.png", 96, -600, 21, 3000)

	viewport_rect(img_spdred_low, 96, 52, 50, 606)
	viewport_rect(img_spdwhite0, 96, 52, 50, 606)
	viewport_rect(img_spdwhite1, 107, 52, 10, 606)
	viewport_rect(img_spdgreen, 96, 52, 50, 606)
	viewport_rect(img_spdyellow, 96, 52, 50, 606)
	viewport_rect(img_spdred, 96, 52, 50, 606)

	----------- Running text and images for speed (vertical tapes)
	function item_value_callback_speed(i)
		t=(i*10)*-1
		--print("i"..i.."="..string.format("%d", 0 - (i * 10) ))
		if (t>450 or t<30) then
			return""
		else
			return string.format("%d", t)
			--return string.format("%d", 0 - (i * 10) )
		end
	end

	--running_text_speed = running_txt_add_ver(0,-25,10,68,66,item_value_callback_speed,"-fx-font-size:28px; -fx-font-family:Arial; -fx-fill:white; -fx-text-alignment:right;")
	--running_txt_add_ver(x,y,nr_visible_item,item_width,item_height,value callback,item_style)
	running_text_speed = running_txt_add_ver(3,33,10,68,66,item_value_callback_speed,"-fx-font-size:32px; -fx-font-family:Arial; -fx-fill:white; -fx-text-alignment:right;")
	viewport_rect(running_text_speed,0,52,95,302)
	--running_img_speed_norm  = running_img_add_ver("speedscaleimage.png",71,-9,10,34,66)
	-- running_img_speed_norm  = running_img_add_ver("speedscaleimage.png",76,-16,10,40,66)
	running_img_speed_norm  = running_img_add_ver("speedscaleimage.png",76,-16,10,40,66)
	--viewport_rect(running_img_speed_norm,72,52,34,302)
	viewport_rect(running_img_speed_norm,80,52,200,100)

	running_img_move_carot(running_img_speed_norm, 1) -- si vitesse < 20 kts, affichage bloqué à 0, soit le premier cran
	running_txt_move_carot(running_text_speed, -1) -- si vitesse < à 20kts, affichage du tape bloqué à 20

	---------- Affichage du speedbug
	--img_speedbug_blue = img_add("speedbug_blue.png", 75, 327, 20, 60) -- bug vitesse("speedbug.png", 80, -8, 16, 50)
	img_speedbug_blue = img_add("speedbug_blue.png", 75, 383, 20, 60) -- bug vitesse("speedbug.png", 80, -8, 16, 50)
	img_speedbug_magenta = img_add("speedbug_magenta.png", 75, 327, 20, 60) -- bug vitesse("speedbug.png", 80, -8, 16, 50)
	viewport_rect(img_speedbug_blue,60,52,137,600)
	viewport_rect(img_speedbug_magenta,60,52,137,600)
	-- Running text airspeed (drum) --
	--img_speedbox = img_add("speedbox.png", 0, 325, 93, 110)-- affichage vitesse
	img_speedbox = img_add("speedbox.png", 0, 325, 95, 110)-- affichage vitesse
	function item_value_callback_inner_speed_minor(i)
		if i == 0 then 
			return "-"  -- tiret affiché
		elseif i >= -1 then
			return""
		else
			return string.format("%d", (0 - i) % 10 )
		end
	end
	--running_text_inner_speed_minor_id = running_txt_add_ver(48,209,5,30,44, item_value_callback_inner_speed_minor, "-fx-font-size:42px; -fx-font-family:arial; -fx-font-weight:bold; -fx-fill:white;")
	--running_txt_move_carot(running_text_inner_speed_minor_id, -1)
	--running_txt_viewport_rect(running_text_inner_speed_minor_id,43,268,29,106)
	running_text_inner_speed_minor_id_red = running_txt_add_ver(46,267,5,30,44, item_value_callback_inner_speed_minor, "-fx-font-size:46px; -fx-font-family:\"Arial\"; -fx-font-weight:bold; -fx-fill:red;")
	running_text_inner_speed_minor_id = running_txt_add_ver(46,267,5,30,44, item_value_callback_inner_speed_minor, "-fx-font-size:46px; -fx-font-family:\"Arial\"; -fx-font-weight:bold; -fx-fill:white;")

	running_txt_move_carot(running_text_inner_speed_minor_id, -1)
	running_txt_viewport_rect(running_text_inner_speed_minor_id,43,330,29,100)
	running_txt_viewport_rect(running_text_inner_speed_minor_id_red,43,330,29,100)
	function item_value_callback_inner_speed_major(i)
		
		if i == 0 then
			return "--"
		else
			return string.format("%d", (0 - i) )
		end
		
	end
	--running_text_inner_speed_major_id = running_txt_add_ver(-1,253,3,50,44, item_value_callback_inner_speed_major, "-fx-font-size:42px; -fx-font-family:arial; -fx-fill:white; -fx-font-weight:bold; -fx-text-alignment:right")
	--position en x,y de l'affichage, nb items,largeur, hauteur \"Arial Narrow\
	running_text_inner_speed_major_id_red= running_txt_add_ver(-6,310,3,52,45, item_value_callback_inner_speed_major, "-fx-font-size:46px; -fx-font-family:arial; -fx-fill:red; -fx-font-weight:bold; -fx-text-alignment:right")
	running_text_inner_speed_major_id = running_txt_add_ver(-6,310,3,52,45, item_value_callback_inner_speed_major, "-fx-font-size:46px; -fx-font-family:arial; -fx-fill:white; -fx-font-weight:bold; -fx-text-alignment:right")
	visible(running_text_inner_speed_major_id,true)
	visible(running_text_inner_speed_major_id_red,false)
	running_txt_move_carot(running_text_inner_speed_major_id, 0)
	running_txt_viewport_rect(running_text_inner_speed_major_id,-25,355,150,45)
	running_txt_viewport_rect(running_text_inner_speed_major_id_red,-25,355,150,45)
	--running_txt_viewport_rect(running_text_inner_speed_major_id,2,295,46,52)

	------------Running text and images for alt (vertical tapes)
	function item_value_callback_alt(i)
		t=i*100
		if (t>51000) then
			return""
		else
			return string.format("%d", i * 100 * -1 )
		end
	end

	--running_text_alt = running_txt_add_ver(710,-159,8,80,116,item_value_callback_alt,"-fx-font-size:28px; -fx-font-family:Arial; -fx-fill:white; -fx-text-alignment:right;")
	--running_img_alt  = running_img_add_ver("altscaleimage.png",663,-27,6,31,116)
	--(670,-102,8,122,116
	running_text_alt = running_txt_add_ver(670,-104,8,122,116,item_value_callback_alt,"-fx-font-size:34px; -fx-font-family:Arial; -fx-fill:white;  -fx-text-alignment:right;")---fx-font-weight:bold;
	-- 664,-84,8,31,116)
	running_img_alt  = running_img_add_ver("altscaleimage.png",645,-84,8,31,116)-- ("altscaleimage.png",663,-85,6,31,116)
	running_img_move_carot(running_img_alt, 0)
	running_txt_move_carot(running_text_alt, 0)

	----------  Alt Bug 
	img_altbug_blue = img_add("altbug_blue.png", 657, 327, 25, 60) -- bug altitude("altbug.png", 663, -8, 16, 50)
	img_altbug_magenta = img_add("altbug_magenta.png", 657, 327, 25, 60)
	viewport_rect(img_altbug_blue,663,52,137,600)
	viewport_rect(img_altbug_magenta,663,52,137,600)
	visible(img_altbug_blue,true)
	visible(img_altbug_magenta,false)

	---------- Running text altitude (drum) --
	img_altbox = img_add("altbox.png", 640, 325, 160, 110)--663, 325, 137, 110)-- affichage altitude dans tape
	function item_value_callback_inner_alt_minor(i)
	--print("unité:"..i) 
		if i == 0 then
			return"00"
		elseif  i>0 and i<10 then
			return ""..string.format("%02d",((i)%10) * 10)
		elseif i>=10 then
			return string.format("%02d",((i)%10) * 10)
		else
			return string.format("%02d", ((0-i)%10) * 10 )
		end
		
	end

	--running_text_inner_alt_minor_id = running_txt_add_ver(745,225,5,50,40, item_value_callback_inner_alt_minor, "-fx-font-size:28px; -fx-font-family:arial; -fx-fill:white; -fx-font-weight:bold; -fx-text-alignment:right")
	--running_txt_move_carot(running_text_inner_alt_minor_id, 0)
	--running_txt_viewport_rect(running_text_inner_alt_minor_id,755,268,42,106)
	-- 738,274,5,60,44
	--running_text_inner_alt_minor_id = running_txt_add_ver(732,275,5,60,44, item_value_callback_inner_alt_minor, "-fx-font-size:34px; -fx-font-family:arial; -fx-fill:white; -fx-font-weight:bold; -fx-text-alignment:right")
	running_txt_move_carot(running_text_inner_alt_minor_id, 0)
	--755,330,100,100
	running_txt_viewport_rect(running_text_inner_alt_minor_id,749,330,100,100)

	function item_value_callback_inner_alt_major100(i)
	--print("cent: ",i) 
		if i == 0 then
			return"0"
		-- elseif i==1 then
			 -- return "1"
		elseif i<0.1 and i>0 then
			 return "-"
		--return string.format("%d",-(i%10)+1)
		-- elseif i>1 and i<10 then
			-- return ""..string.format("%d",-(i%10))
		elseif i>=0.1 then
			 return ""..string.format("%d",i%10)
		else
			return string.format("%d", - i%10)
		end
		
	end
	--716,312,3,44,50
	running_text_inner_alt_major100_id = running_txt_add_ver(694,331,3,60,32, item_value_callback_inner_alt_major100, "-fx-font-size:34px; -fx-font-family:arial; -fx-fill:white; -fx-font-weight:bold; -fx-text-alignment:right")
	running_txt_move_carot(running_text_inner_alt_major100_id, 0)
	--708,345,60,52)
	running_txt_viewport_rect(running_text_inner_alt_major100_id,694,300,100,52)

	function item_value_callback_inner_alt_major1000(i)
		 -- print("mill:"..i) 
		 if i==0 then
			return ""
		 elseif i>0 and i<1 then 
			return "-"
		 -- elseif i<10 and i>=1 then 
		 -- return "-1"
		 -- elseif i > 0 and i<10 then
			-- return"-"
		-- elseif i==1 then
			-- return string.format("%s","-")
		elseif i>=1 then
			return string.format("%d",-i)
		else
			return string.format("%d", - i)
		end
		
	end
	--running_text_inner_alt_major1000_id = running_txt_add_ver(638,291,3,104,60, item_value_callback_inner_alt_major1000, "-fx-font-size:52px; -fx-font-family:arial; -fx-fill:white; -fx-font-weight:bold; -fx-text-alignment:right")
	--(590,291,3,150,60
	running_text_inner_alt_major1000_id = running_txt_add_ver(582,303,3,150,48, item_value_callback_inner_alt_major1000, "-fx-font-size:52px; -fx-font-family:arial; -fx-fill:white; -fx-font-weight:bold; -fx-text-alignment:right")

	running_txt_move_carot(running_text_inner_alt_major1000_id, 0)
	-- 600,355,300,52)
	running_txt_viewport_rect(running_text_inner_alt_major1000_id,580,355,300,52)
	------------ red dashes on SPD and ALT
	--img_altreddash=img_add("redslash_centerbutton.png",680,379,120,3) -- barre rouge sur alti si alt>51000
	--img_spdreddash=img_add("redslash_centerbutton.png",1,379,80,3) -- barre rouge sur speed si speed>450
	visible(img_altreddash,false)
	visible(img_spdreddash,false)

	------------ SPD & ALT box
	img_upperspeedbox=img_add("upperspeedbox.png", 592, 0, 209, 51)
	img_upperaltbox=img_add("upperaltbox.png", 0, 0, 171, 51)
	img_apaltbox = img_add("apaltbox.png", 592, 0, 206, 51) -- indicateur altitude capturée en jaune
	visible(img_upperspeedbox,true)
	visible(img_upperaltbox,true)
	visible(img_apaltbox,true)
	-----------------------------------
	-- gauge lower section (HSI & ND) --
	-----------------------------------

	------------ 360° ROSE
	img_rosemarks= img_add("compasrosemarks.png",0,739,800,800)
	img_compasrose= img_add("compasrose.png",(800-590)/2,844,590,590)

	-- affichage de la rose sans les lettres
	function item_value_callback_compass(i)
		t = i % 12
		if t == 0 then
			return ""
		elseif t == 3 then
			return ""
		elseif t == 6 then
			return ""        
		elseif t == 9 then
			return ""
		end  
		value = 36 - (t*3)
		if value < 0 then
			value = value + 36
		end
	   
		return value
	end
	compass_inner_txt_id = running_txt_add_cir(400-22,1522-383-22,12,40,40,235,item_value_callback_compass, "-fx-font-size:34px; -fx-font-family:Arial; -fx-fill:white; -fx-font-weight:bold; -fx-text-alignment:center")
	-- Affichage de la rose avec les lettres en police + grosse
	function item_value_callback_compass2(j)
		t2 = j % 12
		if t2 == 0 then
			return "N"
		elseif t2 == 3 then
			return "W"
		elseif t2 == 6 then
			return "S"        
		elseif t2 == 9 then
			return "E"
		else
			return ""
		end
	end
	compass_inner_txt_id2 = running_txt_add_cir(400-28,1522-383-28,12,60,60,235,item_value_callback_compass2, "-fx-font-size:40px; -fx-font-family:Arial; -fx-fill:white; -fx-font-weight:bold; -fx-text-alignment:center")

	------------- left info block
	img_add("rectNAVSOURCEINFOBLOCK.png", 20, 770, 85, 35)

	------------- Turn indicator -- 
	--img_turnleft = img_add("turnindbar2.png",132,825,536,536)
	--img_rotate(img_turnleft, 8.5)
	--img_turnright = img_add("turnindbar2.png",132,822,536,536)
	--img_rotate(img_turnright, -8)
	img_turnindicator=img_add("turnindicator2.png",(800-196)/2,812,196,42)
	--img_turnlimitleft=img_add("turnlimitleft.png",302,810,198,42)
	--img_turnlimitright=img_add("turnlimitright.png",302,810,198,42)

	------------- true heading bug (GPS source)
	img_trueh = img_add("trueheading.png", (800-67)/2, 1520-383-(570/2), 67, 570)

	------------- Heading bug (HDG)
	img_headind = img_add("headingind.png", (800-70)/2, 1520-383-(602/2), 70, 602)
	img_headindblue = img_add("headingindblue2.png", (800-72)/2, 1520-383-(602/2), 70, 602)


	img_degreebox = img_add("degreebox.png", 400-(134/2), 768, 134, 97)--332.5 768
	txt_compheading = txt_add(" ", "-fx-font-size:58px; -fx-font-family:Arial; -fx-fill: white; -fx-font-weight:normal; -fx-text-alignment:left;", 340, 762, 150, 100)-- ok

	------------ Blue RMI needles on top of compass
	img_rmi1needleblue = img_add("vorneedle1blue.png", (800-39)/2, 1522-383-(549.4/2), 39, 549.4)--30, 413
	img_rmi2needleblue = img_add("vorneedle2hollowblue.png", (800-59.88)/2, 1522-383-(570/2), 59.88, 570)--
	visible(img_rmi1needleblue,false)
	visible(img_rmi2needleblue,false)

	------------ HSI Needle on top of compass 
	img_needle = img_add("hsi_needle4.png", (800-549.4)/2, 1522-383-(549.4/2), 549.4, 549.4)

	img_center_needle_to = img_add("hsi_center_needle_to4.png", (800-549.4)/2, 1520-383-(549.4/2), 549.4, 549.4)--6.6  246.3
	img_center_needle_from = img_add("hsi_center_needle_from4.png", (800-549.4)/2, 1520-383-(549.4/2), 549.4, 549.4)
	visible(img_center_needle_to,false)
	visible(img_center_needle_from,false)
	img_center_needlehollow_to = img_add("hsi_center_needlehollow_to4.png", (800-549.4)/2, 1520-383-(549.4/2), 549.4, 549.4)
	img_center_needlehollow_from = img_add("hsi_center_needlehollow_from4.png", (800-549.4)/2, 1520-383-(549.4/2), 549.4, 549.4)
	visible(img_center_needlehollow_to,false)
	visible(img_center_needlehollow_from,false)
	img_to_flag=img_add("hsi_to_flag4.png", 800-(549.4)/2, 1520-383-(549.4/2), 549.4,549.4)--29, 276.6)
	img_from_flag=img_add("hsi_from_flag4.png", 800-(549.4)/2, 1520-383-(549.4/2), 549.4,549.4)
	visible(img_to_flag,false)
	visible(img_from_flag,false)
	img_add("airplane-icon.png", (800-64)/2, 1520-383-(64/2), 64, 64)   
	--img_add("airplane-icon2.bmp", (800-64)/2, 1522-383-(54/2), 64, 54)        

	 ------------ ARC ROSE
	-- img_rose= img_add("compasrosemarks.png",0,735,800,800)
	-- img_compasrose= img_add("compasrose.png",(800-590)/2,840,590,590)

	------------- bottom menu bar & icons
	img_bottom_menubar=img_add("bottommenubar.png",0,1510-50,800,53)
	img_RMI_sourcearrow1=img_add("RMIsourcearrow1.png",168,1522-60,32,38)--168
	img_RMI_sourcearrow2=img_add("RMIsourcearrow2.png",595,1522-60,32,38)--593

	--------------
	-- Add text --
	--------------
	-- Infobar top
	txt_apspd1 = txt_add(" ", "-fx-font-size:48px; -fx-font-family:Arial; -fx-fill: aqua; -fx-font-weight:bold; -fx-text-alignment:left;", 12, -1, 90, 100)
	txt_apspd2 = txt_add(" ", "-fx-font-size:32px; -fx-font-family:Arial; -fx-fill: aqua; -fx-font-weight:bold; -fx-text-alignment:left;", 80, 11, 90, 100)
	txt_apalt1 = txt_add("", "-fx-font-size:48px; -fx-font-family:Arial; -fx-fill: aqua; -fx-font-weight:bold; -fx-text-alignment:right;", 638, -1, 90, 100)
	txt_apalt2 = txt_add("", "-fx-font-size:38px; -fx-font-family:Arial; -fx-fill: aqua; -fx-font-weight:bold; -fx-text-alignment:right;", 700, 5, 90, 100)

	visible(txt_apspd1,true)
	visible(txt_apspd2,true)
	visible(txt_apalt1,true)
	visible(txt_apalt2,true)
	-- Infobar center
	txt_add("TAS", "-fx-font-size:24px; -fx-font-family:Arial; -fx-fill: white; -fx-font-weight:normal; -fx-text-alignment:left;", 6, 678, 150, 100)-- ok
	txt_tas = txt_add("___", "-fx-font-size:40px; -fx-font-family:Arial; -fx-fill: white; -fx-font-weight:bold; -fx-text-alignment:right;", 15, 664, 121, 100)--68 ok
	txt_tas_unit = txt_add(" kt", "-fx-font-size:32px; -fx-font-family:Arial; -fx-fill: white; -fx-font-weight:bold; -fx-text-alignment:right;", 50, 672, 121, 100)

	txt_add("GS", "-fx-font-size:24px; -fx-font-family:Arial; -fx-fill: white; -fx-font-weight:normal; -fx-text-alignment:left;", 17, 729, 150, 100)-- ok
	txt_gs = txt_add("___", "-fx-font-size:40px; -fx-font-family:Arial; -fx-fill: white; -fx-font-weight:bold; -fx-text-alignment:right;", 15, 714, 121, 100)-- ok
	txt_gs_unit = txt_add(" kt", "-fx-font-size:32px; -fx-font-family:Arial; -fx-fill: white; -fx-font-weight:bold; -fx-text-alignment:right;", 50, 723, 120, 100)

	txt_add("OAT ", "-fx-font-size:24px; -fx-font-family:Arial; -fx-fill: white; -fx-font-weight:normal; -fx-text-alignment:left;", 226, 729, 150, 100)
	txt_oat = txt_add(" ", "-fx-font-size:40px; -fx-font-family:Arial; -fx-fill: white; -fx-font-weight:bold; -fx-text-alignment:right;", 248, 714, 120, 100)

	img_windarrow = img_add("windarrow.png", 480, 715, 28, 40)
	txt_wind = txt_add("    /   kt", "-fx-font-size:40px; -fx-font-family:Arial; -fx-fill: white; -fx-font-weight:bold; -fx-text-alignment:left;", 530, 714, 200, 100)

	txt_inhg = txt_add("0000", "-fx-font-size:40px; -fx-font-family:Arial; -fx-fill: aqua; -fx-font-weight:bold; -fx-text-alignment:right;", 629, 664, 120, 50)
	if baro_unit=="Millibars" then
		txt_inhg_unit=txt_add("mB","-fx-font-size:24px; -fx-font-family:Arial; -fx-fill: aqua; -fx-font-weight:bold; -fx-text-alignment:right;", 672, 680, 120, 50)
	else
		txt_inhg_unit=txt_add("in","-fx-font-size:24px; -fx-font-family:Arial; -fx-fill: aqua; -fx-font-weight:bold; -fx-text-alignment:right;", 675, 680, 120, 50)
	end
	-- Navigation section

	txt_add("CRS", "-fx-font-size:32px; -fx-font-family:Arial; -fx-fill: white; -fx-font-weight:bold; -fx-text-alignment:left;", 199, 763, 200, 100)-- ok
	txt_course = txt_add(" ", "-fx-font-size:42px; -fx-font-family:Arial; -fx-fill: aqua; -fx-font-weight:bolder; -fx-text-alignment:left;", 197, 792, 200, 100)-- ok

	txt_add("HDG", "-fx-font-size:32px; -fx-font-family:Arial; -fx-fill: white; -fx-font-weight:bold; -fx-text-alignment:left;", 524, 763, 200, 100)-- ok
	txt_hdg = txt_add(" ", "-fx-font-size:42px; -fx-font-family:Arial; -fx-fill: cyan; -fx-font-weight:bolder; -fx-text-alignment:left;", 518, 792, 200, 100)-- ok

	txt_vsi = txt_add("", "-fx-font-size:42px; -fx-font-family:Arial; -fx-fill: white; -fx-font-weight:bold; -fx-text-alignment:right;", 558, 760, 200, 100)-- ok
	txt_vsi2=txt_add("FPM", "-fx-font-size:24px; -fx-font-family:Arial; -fx-fill: white; -fx-font-weight:bold; -fx-text-alignment:right;", 558, 805, 200, 100)-- ok
	visible(txt_vsi,false)
	visible(txt_vsi2,false)

	txt_CDI_source = txt_add("", "-fx-font-size:26px; -fx-font-family:Arial; -fx-fill: #5fce4b; -fx-font-weight:bolder; -fx-text-alignment:left;", 25, 772, 200, 100)
	txt_CDI_wptid = txt_add("", "-fx-font-size:32px; -fx-font-family:Arial; -fx-fill: #5fce4b; -fx-font-weight:bold; -fx-text-alignment:left;", 12, 808, 200, 100)
	txt_CDI_wptbearingdist = txt_add("", "-fx-font-size:32px; -fx-font-family:Arial; -fx-fill: #5fce4b; -fx-font-weight:bold; -fx-text-alignment:left;", 12, 840, 200, 100)
	txt_CDI_wptETA = txt_add("", "-fx-font-size:32px; -fx-font-family:Arial; -fx-fill: #5fce4b; -fx-font-weight:bold; -fx-text-alignment:left;", 12, 872, 200, 100)

	txt_RMI1_wptbearingdist = txt_add("", "-fx-font-size:32px; -fx-font-family:Arial; -fx-fill: aqua; -fx-font-weight:bold; -fx-text-alignment:left;", 100, 1522-128, 200, 100)
	txt_RMI1_wptid = txt_add("", "-fx-font-size:32px; -fx-font-family:Arial; -fx-fill: aqua; -fx-font-weight:bold; -fx-text-alignment:left;", 100, 1522-98, 200, 100)
	txt_RMI2_wptbearingdist = txt_add("XX.XNm", "-fx-font-size:32px; -fx-font-family:Arial; -fx-fill: aqua; -fx-font-weight:bold; -fx-text-alignment:right;", 480, 1522-128, 200, 100)
	txt_RMI2_wptid = txt_add("XXX.XMHz", "-fx-font-size:32px; -fx-font-family:Arial; -fx-fill: aqua; -fx-font-weight:bold; -fx-text-alignment:right;", 480, 1522-98, 200, 100)

	-- Infobar bottom
	txt_leftbutton=txt_add("VOR1","-fx-font-size:34px; -fx-font-family:Arial; -fx-fill: cyan; -fx-font-weight:bold; -fx-text-alignment:center;", 150, 1460, 200, 100)
	img_redslash_leftbutton=img_add("redslash_centerbutton.png",200,1478,100,3)
	visible(img_redslash_leftbutton,false)

	txt_centerbutton=txt_add("VLOC1","-fx-font-size:42px; -fx-font-family:Arial; -fx-fill: #5fce4b; -fx-font-weight:bolder; -fx-text-alignment:center;", 300, 1460, 200, 100)
	img_redslash_centerbutton=img_add("redslash_centerbutton.png",400-(157/2),1485,157,3)
	visible(img_redslash_centerbutton,true)

	txt_rightbutton=txt_add("VOR2","-fx-font-size:34px; -fx-font-family:Arial; -fx-fill: cyan; -fx-font-weight:bold; -fx-text-alignment:right;", 390, 1460, 200, 100)
	img_redslash_rightbutton=img_add("redslash_centerbutton.png",495,1478,100,3)
	visible(img_redslash_rightbutton,true)

	txt_leftdial=txt_add("CRS","-fx-font-size:46px; -fx-font-family:Arial; -fx-fill: cyan; -fx-font-weight:bold; -fx-text-alignment:left;", 40, 1462, 200, 100)
	txt_rightdial=txt_add("HDG","-fx-font-size:46px; -fx-font-family:Arial; -fx-fill: cyan; -fx-font-weight:bold; -fx-text-alignment:right;", 800-154, 1462, 150, 100)

	----------------------------
	-- Failure flags --
	----------------------------
	img_VSI_fail=img_add("VSI_fail.png",800-235,1522-62-697,235,697)
	img_ALT_fail=img_add("ALT_fail.png",0,0,162,659)
	img_IAS_fail=img_add("IAS_fail.png",800-162,0,162,659)
	-- visible(img_IAS_fail,false)
	-- visible(img_ALT_fail,false)
	-- visible(img_VSI_fail,false)
	------------------
	--  Lateral Menu--
	------------------
	img_lateral_menubar=img_add("bluelateralmenubar.png",800-24,1522-696-63,25,696) -- barre de menu latérale
	img_TPSlegend_green=img_add("TPSlegend_green.png",800-16-3,1522-66.6-696+15,16,66.6)
	img_TPSlegend_gray=img_add("TPSlegend_gray.png",800-16-3,1522-66.6-696+15,16,66.6)
	visible(img_TPSlegend_green,true)
	visible(img_TPSlegend_gray,false)
	img_MINlegend_green=img_add("MINlegend_green.png",800-16-3,1522-66.6-696+155,16,66.6)
	img_MINlegend_gray=img_add("MINlegend_gray.png",800-16-3,1522-66.6-696+155,16,66.6)
	visible(img_MINlegend_green,true)
	visible(img_MINlegend_gray,false)
	img_360legend_green=img_add("360legend_green.png",800-16-3,1522-66.6-696+300,16,66.6)
	img_ARClegend_green=img_add("ARClegend_green.png",800-16-3,1522-66.6-696+300,16,66.6)
	visible(img_360legend_green,true)
	visible(img_ARClegend_green,false)
	img_MAPlegend_green=img_add("MAPlegend_green.png",800-16-3,1522-66.6-696+445,16,66.6)
	img_MAPlegend_gray=img_add("MAPlegend_gray.png",800-16-3,1522-66.6-696+445,16,66.6)
	visible(img_MAPlegend_green,false)
	visible(img_MAPlegend_gray,true)
	img_GPSSlegend_green=img_add("GPSSlegend_green.png",800-16-3,1522-66.6-696+590,16,85.9)
	img_GPSSlegend_gray=img_add("GPSSlegend_gray.png",800-16-3,1522-66.6-696+590,16,85.9)
	visible(img_GPSSlegend_green,false)
	visible(img_GPSSlegend_gray,true)
	-----------------------------------------
	-- Startup & diagnostics images & text --
	-----------------------------------------
	img_startup_bkg_blackscreen=img_add("blackscreen.png",0,0,800,1522) 
	visible(img_startup_bkg_blackscreen,true)
	img_startup_bkg_white=img_add("startup_bkg_white.png",24,800,800-48,400)
	visible(img_startup_bkg_white,true)
	img_startup=img_add_fullscreen("startupscreen1ok.png")
	visible(img_startup,false)
	txt_IOP=txt_add("IOP", "-fx-font-size:24pt; -fx-font-family:Arial; -fx-fill: grey; -fx-font-weight:bold; -fx-text-alignment:left;", 50, 825, 200, 100)
	txt_IOP_statusna=txt_add("n/a", "-fx-font-size:24pt; -fx-font-family:Arial; -fx-fill: grey; -fx-font-weight:bold; -fx-text-alignment:left;", 310, 825, 200, 100)
	txt_IOP_statusinit=txt_add("initializing", "-fx-font-size:24pt; -fx-font-family:Arial; -fx-fill: black; -fx-font-weight:bold; -fx-text-alignment:left;", 310, 825, 200, 100)
	txt_IOP_statuscomplete=txt_add("complete", "-fx-font-size:24pt; -fx-font-family:Arial; -fx-fill: darkgreen; -fx-font-weight:bold; -fx-text-alignment:left;",310, 825, 200, 100)

	txt_ARINC=txt_add("ARINC", "-fx-font-size:24pt; -fx-font-family:Arial; -fx-fill: grey; -fx-font-weight:bold; -fx-text-alignment:left;", 50, 868, 200, 100)
	txt_ARINC_statusna=txt_add("n/a", "-fx-font-size:24pt; -fx-font-family:Arial; -fx-fill: grey; -fx-font-weight:bold; -fx-text-alignment:left;", 310, 868, 200, 100)
	txt_ARINC_statusinit=txt_add("initializing", "-fx-font-size:24pt; -fx-font-family:Arial; -fx-fill: black; -fx-font-weight:bold; -fx-text-alignment:left;", 310, 868, 200, 100)
	txt_ARINC_statuscomplete=txt_add("complete", "-fx-font-size:24pt; -fx-font-family:Arial; -fx-fill: darkgreen; -fx-font-weight:bold; -fx-text-alignment:left;", 310, 868, 200, 100)

	txt_RS232=txt_add("RS232", "-fx-font-size:24pt; -fx-font-family:Arial; -fx-fill: grey; -fx-font-weight:bold; -fx-text-alignment:left;", 50, 911, 200, 100)
	txt_RS232_statusna=txt_add("n/a", "-fx-font-size:24pt; -fx-font-family:Arial; -fx-fill: grey; -fx-font-weight:bold; -fx-text-alignment:left;", 310, 911, 200, 100)
	txt_RS232_statusinit=txt_add("initializing", "-fx-font-size:24pt; -fx-font-family:Arial; -fx-fill: black; -fx-font-weight:bold; -fx-text-alignment:left;", 310, 911, 200, 100)
	txt_RS232_statuscomplete=txt_add("complete", "-fx-font-size:24pt; -fx-font-family:Arial; -fx-fill: darkgreen; -fx-font-weight:bold; -fx-text-alignment:left;", 310, 911, 200, 100)

	txt_CFG=txt_add("Config Module", "-fx-font-size:24pt; -fx-font-family:Arial; -fx-fill: grey; -fx-font-weight:bold; -fx-text-alignment:left;", 50, 954, 280, 100)
	txt_CFG_statusna=txt_add("n/a", "-fx-font-size:24pt; -fx-font-family:Arial; -fx-fill: grey; -fx-font-weight:bold; -fx-text-alignment:left;", 310, 954, 200, 100)
	txt_CFG_statusinit=txt_add("initializing", "-fx-font-size:24pt; -fx-font-family:Arial; -fx-fill: black; -fx-font-weight:bold; -fx-text-alignment:left;", 310, 954, 200, 100)
	txt_CFG_statuscomplete=txt_add("complete", "-fx-font-size:24pt; -fx-font-family:Arial; -fx-fill: darkgreen; -fx-font-weight:bold; -fx-text-alignment:left;",310, 954, 200, 100)

	txt_RSM=txt_add("RSM", "-fx-font-size:24pt; -fx-font-family:Arial; -fx-fill: grey; -fx-font-weight:bold; -fx-text-alignment:left;", 50, 997, 200, 100)
	txt_RSM_statusna=txt_add("n/a", "-fx-font-size:24pt; -fx-font-family:Arial; -fx-fill: grey; -fx-font-weight:bold; -fx-text-alignment:left;", 310, 997, 200, 100)
	txt_RSM_statusinit=txt_add("initializing", "-fx-font-size:24pt; -fx-font-family:Arial; -fx-fill: black; -fx-font-weight:bold; -fx-text-alignment:left;", 310, 997, 200, 100)
	txt_RSM_statuscomplete=txt_add("complete", "-fx-font-size:24pt; -fx-font-family:Arial; -fx-fill: darkgreen; -fx-font-weight:bold; -fx-text-alignment:left;", 310, 997, 200, 100)

	txt_IMU=txt_add("IMU", "-fx-font-size:24pt; -fx-font-family:Arial; -fx-fill: grey; -fx-font-weight:bold; -fx-text-alignment:left;", 50, 1040, 200, 100)
	txt_IMU_statusna=txt_add("n/a", "-fx-font-size:24pt; -fx-font-family:Arial; -fx-fill: grey; -fx-font-weight:bold; -fx-text-alignment:left;", 310, 1040, 200, 100)
	txt_IMU_statusinit=txt_add("initializing", "-fx-font-size:24pt; -fx-font-family:Arial; -fx-fill: black; -fx-font-weight:bold; -fx-text-alignment:left;", 310, 1040, 200, 100)
	txt_IMU_statuscomplete=txt_add("complete", "-fx-font-size:24pt; -fx-font-family:Arial; -fx-fill: darkgreen; -fx-font-weight:bold; -fx-text-alignment:left;", 310, 1040, 200, 100)

	txt_ADC=txt_add("ADC", "-fx-font-size:24pt; -fx-font-family:Arial; -fx-fill: grey; -fx-font-weight:bold; -fx-text-alignment:left;", 50, 1083, 200, 100)
	txt_ADC_statusna=txt_add("n/a", "-fx-font-size:24pt; -fx-font-family:Arial; -fx-fill: grey; -fx-font-weight:bold; -fx-text-alignment:left;", 310, 1083, 200, 100)
	txt_ADC_statusinit=txt_add("initializing", "-fx-font-size:24pt; -fx-font-family:Arial; -fx-fill: black; -fx-font-weight:bold; -fx-text-alignment:left;", 310, 1083, 200, 100)
	txt_ADC_statuscomplete=txt_add("complete", "-fx-font-size:24pt; -fx-font-family:Arial; -fx-fill: darkgreen; -fx-font-weight:bold; -fx-text-alignment:left;", 310, 1083, 200, 100)

	txt_ADAHRS=txt_add("ADAHRS", "-fx-font-size:24pt; -fx-font-family:Arial; -fx-fill: grey; -fx-font-weight:bold; -fx-text-alignment:left;", 50, 1126, 200, 100)
	txt_ADAHRS_statusna=txt_add("n/a", "-fx-font-size:24pt; -fx-font-family:Arial; -fx-fill: grey; -fx-font-weight:bold; -fx-text-alignment:left;", 310, 1126, 200, 100)
	txt_ADAHRS_statusinit=txt_add("initializing", "-fx-font-size:24pt; -fx-font-family:Arial; -fx-fill: black; -fx-font-weight:bold; -fx-text-alignment:left;", 310, 1126, 200, 100)
	txt_ADAHRS_statuscomplete=txt_add("complete", "-fx-font-size:24pt; -fx-font-family:Arial; -fx-fill: darkgreen; -fx-font-weight:bold; -fx-text-alignment:left;", 310, 1126, 200, 100)

	------------------------------------
	-- Shutdown sequence images & text --
	------------------------------------
	-- img_screenoff: ecran noir au démarrage, 
	-- doit être la dernière image affichée
	-- pour pouvoir cacher toutes les autres !
	img_shutdown1=img_add("shutdownmessage1.png",(800-764)/2,(1522-452)/2,764,452)
	visible(img_shutdown1,false)
	txt_shutdown_countdown=txt_add("10","-fx-font-size:32pt; -fx-font-family:Arial; -fx-fill: white; -fx-font-weight:normal; -fx-text-alignment:center;", 450, 693, 200, 100)
	visible(txt_shutdown_countdown,false)
	img_screenoff=img_add("blackscreen.png",0,0,800,1522) 
	visible(img_screenoff,true)
	img_shutdown2=img_add("shutdownmessage2.png",(800-382)/2,(1522-140)/2,382,140)
	visible(img_shutdown2,false)

	---------------
	-- Viewports --
	---------------
	viewport_rect(img_horizon, 0, 0, 800, 800)
	viewport_rect(img_horizonscale, 100, 105, 500,535 )

	viewport_rect(img_roll, 161, 0, 479, 300)

	viewport_rect(img_turnleft, 302, 800, 96, 42)
	viewport_rect(img_turnright, 402, 800, 96, 42)

	-- ============================= END OF GAUGE DEFINITION AND DRAWING SECTION =======================================================

end