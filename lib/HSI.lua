function init_HSI()

	-- Direction indicator (Credits go to macnfly for this code)
	function new_HSI(xhsimode, xrmi1mode, xrmi2mode, nav1name, nav1freq, nav1obs, nav1hasnav, nav1flag, nav1hasloc, nav1hdef, nav1hasgs, nav1gsflag, nav1vdef, nav1bearing, nav1dme, nav1speed, nav2name, nav2freq, nav2obs, nav2hasnav, nav2flag, nav2hasloc, nav2hdef, nav2hasgs, nav2gsflag, nav2vdef, nav2bearing, nav2dme, nav2speed, gpsbearing, gpswptname, gpswptbearing, gpswptdme, gpswptete, apheading, elecheading, groundtrack)

		img_rotate(img_rose, -elecheading) -- rotate the compas rose
		--	bug de cap...\\--
		img_visible(img_headind,false)
		img_visible(img_headindblue,true) 
		img_rotate(img_headind, (apheading-elecheading))

		img_rotate(img_headindblue, (apheading-elecheading))
		img_rotate(img_trueh, (groundtrack-elecheading))

		-- HSI display
		if hsimode == 0 then -- source is VOR1
			hdef=nav1hdef 
			vdef=nav1vdef
			hsihassignal=nav1hasnav
			hsiwptfreq=nav1freq
			hsiwptname=nav1name
			hsiflag=nav1flag
			hsiwptbearing=nav1bearing
			hsiwptdme=nav1dme
			hsiwptspeed=nav1speed
			if nav1hasloc then
				txt_cdi_source="LOC1"
			elseif nav1hasgs then
				txt_cdi_source="ILS1"
			else
				txt_cdi_source="VOR1"
			end
			if nav1speed>0 then 
				hsiwptETA=nav1dme/nav1speed
			else
				hsiwptETA=0
			end
			crs=nav1obs
		end
		
		if hsimode == 1 then --source is VOR2
			hdef=nav2hdef 
			vdef=nav2vdef
			hsihassignal=nav2hasnav
			hsiwptfreq=nav2freq
			hsiwptname=nav2name
			hsiflag=nav2flag
			hsiwptbearing=nav2bearing
			hsiwptdme=nav2dme
			hsiwptspeed=nav2speed
			if nav2hasloc then
				txt_cdi_source="LOC2"
			elseif nav2hasgs then
				txt_cdi_source="ILS2"
			else
				txt_cdi_source="VOR2"
			end
			if nav2speed>0 then
				hsiwptETA=nav2dme/nav2speed
			else
				hsiwptETA=0
			end
			crs=nav2obs
		end
		
		if hsimode == 2 then --source is GPS
			txt_cdi_source="GPS1"
			hdef=gpshdef 
			vdef=gpshdef
			hsihassignal=true
			hsiwptfreq=0
			hsiwptname=gpswptname
			hsiflag=1 -- always TO in GPS mode
			hsiwptbearing=gpswptbearing
			hsiwptdme=gpswptdme
			hsiwptspeed=25.0
			hsiwptETA=gpswptete
			crs=gpsbearing
		end

		hdef = var_cap(hdef, -5, 5)
		vdef = var_cap(vdef, -2, 2)	
		if 	hsihassignal==false then -- no data available, the needle is not displayed
			img_visible(img_to_flag,false)
			img_visible(img_from_flag,false)
			img_visible(img_center_needle_to, false)
			img_visible(img_center_needle_from, false)
			img_visible(img_center_needlehollow_to, false)
			img_visible(img_center_needlehollow_from, false)
		elseif hsiflag==1 then  --TO flag
			img_visible(img_to_flag,true)
			img_visible(img_from_flag,false)
			if (hdef<=-5 or hdef>=5) then -- CDI off limits, (hollow needle is displayed)
				img_visible(img_center_needle_to, false)
				img_visible(img_center_needle_from, false)
				img_visible(img_center_needlehollow_to, true)
				img_visible(img_center_needlehollow_from, false)
			else
				img_visible(img_center_needle_to, true)
				img_visible(img_center_needle_from, false)
				img_visible(img_center_needlehollow_to, false)
				img_visible(img_center_needlehollow_from, false)
			end
		else -- FROM flag
			img_visible(img_to_flag,false)
			img_visible(img_from_flag,true)
			if (hdef<=-5 or hdef>=5) then
				img_visible(img_center_needle_to, false)
				img_visible(img_center_needle_from, false)
				img_visible(img_center_needlehollow_to, false)
				img_visible(img_center_needlehollow_from, true)
			else
				img_visible(img_center_needle_to, false)
				img_visible(img_center_needle_from, true)
				img_visible(img_center_needlehollow_to, false)
				img_visible(img_center_needlehollow_from, false)
			end
		end --if 	nav1flag==0

		-- rotate the CDI needle(including the hollow one), and the to/from flag	  
		img_rotate(img_needle, crs-elecheading)
		img_rotate(img_to_flag, crs-elecheading)
		img_rotate(img_from_flag, crs-elecheading)
		img_rotate(img_center_needle_to, crs-elecheading)
		img_rotate(img_center_needle_from, crs-elecheading)
		img_rotate(img_center_needlehollow_to, crs-elecheading)
		img_rotate(img_center_needlehollow_from, crs-elecheading)
	
		dh = hdef* 30.79* math.cos((-elecheading+crs)*math.pi/180) --(246.3+30.8+30.8)/10)=30.79
		dv = hdef* 30.79* math.sin((-elecheading+crs)*math.pi/180) --(246.3+30.8+30.8)/10)=30.79
		--dm = nav1vdef*54
		flagh =  math.cos((-elecheading+crs)*math.pi/180)
		flagv = math.sin((-elecheading+crs)*math.pi/180)
		-- print("nav1hdef-->"..nav1hdef)
		-- print("dh-->"..dh)
		-- print("dv-->"..dv)
		img_move(img_to_flag, flagh + 400-(549.4/2), flagv + 1139-(549.4/2), nil, nil)--flagh + 400-(29/2), flagv + 1139-(300/2), nil, nil)
		img_move(img_from_flag, flagh + 400-(549.4/2), flagv + 1139-(549.4/2), nil, nil)
		img_move(img_center_needle_to, dh + 400-(549.4/2), dv + 1139-(549.4/2), nil, nil)--dh + 400-(26.5/2), dv + 1139-(251.6/2), nil, nil)
		img_move(img_center_needle_from, dh + 400-(549.4/2), dv + 1139-(549.4/2), nil, nil)--dh + 400-(26.5/2), dv + 1139-(251.6/2), nil, nil)
		img_move(img_center_needlehollow_to, dh + 400-(549.4/2), dv + 1139-(549.4/2), nil, nil)--dh + 400-(13.17/2), dv + 1139-(251.6/2), nil, nil)
		img_move(img_center_needlehollow_from, dh + 400-(549.4/2), dv + 1139-(549.4/2), nil, nil)--dh + 400-(13.17/2), dv + 1139-(251.6/2), nil, nil)

		-- if nav1display > 0 or nav2display > 0 or mode == 2 then
			-- img_visible(img_center_needle, true)
		-- else
			-- img_visible(img_center_needle, false)
		-- end
	   
		-- Source mode selected for HSI
		if hsimode == 0 then --VOR1
			txt_set(txt_CDI_source,txt_cdi_source )
			txt_set(txt_centerbutton, "VLOC1")
			txt_set(txt_CDI_wptid,var_format(var_round(hsiwptfreq,2),2).."MHz")
		elseif hsimode == 1 then
			txt_set(txt_CDI_source, txt_cdi_source)
			txt_set(txt_centerbutton, "VLOC2")
			txt_set(txt_CDI_wptid,var_format(var_round(hsiwptfreq,2),2).."MHz")
		elseif hsimode == 2 then
			txt_set(txt_CDI_source, txt_cdi_source)
			txt_set(txt_centerbutton, "GPS1")
			txt_set(txt_CDI_wptid,hsiwptname)
		end	
			
		if hsihassignal == true then
			visible(img_redslash_centerbutton,false)
			visible(txt_CDI_wptid,true)
			visible(txt_CDI_wptbearingdist,true)
			visible(txt_CDI_wptETA,true)
			if hsiwptdme>99 then
				dmeformat=string.format("%04d" .. "\°", (hsiwptbearing)%360).."/"..var_round(hsiwptdme,0) 
			else 
				dmeformat=string.format("%03d" .. "\°", (hsiwptbearing)%360).."/"..var_format(hsiwptdme,1)
			end
			txt_set(txt_CDI_wptbearingdist,dmeformat)--
			if  hsiwptspeed>20 then --
				hsiwptETA_Hour,hsiwptETA_Min=math.modf(hsiwptETA)
				txt_set(txt_CDI_wptETA,hsiwptETA_Hour..":"..string.format("%02d",hsiwptETA_Min*60))
			end
		else
			visible(txt_CDI_wptid,false)
			visible(txt_CDI_wptbearingdist,false)
			visible(txt_CDI_wptETA,false)
			visible(img_redslash_centerbutton,true)-- on flagge l'indicateur
		end
			
		if rmi1mode ==1 then -- VOR1
			txt_set(txt_leftbutton,"VOR1")
			visible(img_rmi1needleblue,true)
			rmi1ident=nav1freq.."MHz"
			rmi1dme=nav1dme
			rmi1hassignal=nav1hasnav
			rmi1_flagged=not(nav1hasnav)
			rmi1bearing=(nav1bearing)%360
		elseif rmi1mode ==2 then -- VOR2
			txt_set(txt_leftbutton,"VOR2")
			visible(img_rmi1needleblue,true)
			rmi1ident=nav2freq.."MHz"
			rmi1dme=nav2dme
			rmi1hassignal=nav2hasnav
			rmi1_flagged=not(nav2hasnav)
			rmi1bearing=(nav2bearing)%360
		else --GSP1 ou rien, on affiche rien
			txt_set(txt_leftbutton,"")
			visible(img_rmi1needleblue,false)
			rmi1ident=""-- nav1freq.."MHz"
			rmi1dme=0
			rmi1hassignal=false
			rmi1_flagged=false
			rmi1bearing=0--(nav1bearing+180)%180

		end
		----- pas de RMI2 pour l'instant!!!!!!!!!!!!!!!!!
		visible(img_rmi2needleblue,false)
		rmi2ident=""-- nav1freq.."MHz"
		rmi2dme=0
		rmi2hassignal=false
		rmi2_flagged=false
		rmi2bearing=(nav2bearing)%360
		
		img_rotate(img_rmi1needleblue, nav1bearing-elecheading)
		img_rotate(img_rmi2needleblue, nav2bearing-elecheading)	
		
		if rmi1hassignal == true then
			visible(img_redslash_leftbutton,false)
			visible(txt_RMI1_wptid,true)
			visible(txt_RMI1_wptbearingdist,true)
			if rmi1dme>99 then
				dmeformat=var_round(rmi1dme,0).."Nm"
			else 
				dmeformat=var_format(rmi1dme,1).."Nm"
			end
			visible(img_rmi1needleblue,true)
		else
			visible(txt_RMI1_wptid,true)
			visible(txt_RMI1_wptbearingdist,false)
			visible(img_redslash_leftbutton,rmi1_flagged)-- on flagge l'indicateur
			visible(img_rmi1needleblue,false) -- on cache l'aiguille
		end
		
		txt_set(txt_RMI1_wptbearingdist,dmeformat)
		txt_set(txt_RMI1_wptid,rmi1ident)
		
		if rmi2hassignal == true then
			visible(img_redslash_rightbutton,false)
			visible(txt_RMI2_wptid,true)
			visible(txt_RMI2_wptbearingdist,true)
			if rmi2dme>99 then
				dmeformat=var_round(rmi2dme,0).."Nm"-- on force sans virgule
			else 
				dmeformat=var_format(rmi2dme,1).."Nm"
			end

			visible(img_rmi2needleblue,true)
		else
			visible(txt_RMI2_wptid,true)
			visible(txt_RMI2_wptbearingdist,false)
			visible(img_redslash_rightbutton,rmi2_flagged)-- on flagge l'indicateur
			visible(img_rmi2needleblue,false) -- on cache l'aiguille
		end	
		txt_set(txt_RMI2_wptbearingdist,dmeformat)
		txt_set(txt_RMI2_wptid,rmi2ident)
		-- else
			-- txt_set(txt_CDI_source, " ")
			-- visible(txt_CDI_wptid,false)
			-- visible(txt_CDI_wptbearingdist,false)
			-- visible(txt_CDI_wptETA,false)
			-- txt_set(txt_centerbutton, " ")
		-- end
		--// Course text \\--
		txt_style(txt_course,"-fx-font-size:42px; -fx-font-family:Arial; -fx-fill: magenta; -fx-font-weight:bolder; -fx-text-alignment:left;")
		txt_set(txt_course, string.format("%03d" .. "\°", crs) )
		--// Heading text, AP heading dialled in  
		txt_style(txt_hdg,"-fx-font-size:42px; -fx-font-family:Arial; -fx-fill: magenta; -fx-font-weight:bolder; -fx-text-alignment:left;")
		txt_set(txt_hdg, string.format("%03d" .. "\°", apheading) )
	end

	function new_HSI_FSX(nav1name, nav1freq, nav1obs, nav1hasnav, nav1flag, nav1hasloc, nav1hdef, nav1hasgs, nav1gsflag, nav1vdef, nav1bearing, nav1dme, nav1speed,nav2name, nav2freq, nav2obs, nav2hasnav, nav2flag, nav2hasloc, nav2hdef, nav2hasgs, nav2gsflag, nav2vdef, nav2bearing, nav2dme, nav2speed, gpsbearing, gpswptname, gpswptbearing, gpswptdme, gpswptete, apheading, elecheading, groundtrack)

		verticaldeviation = 4 / 119 --* nav1vdef -- value returned by fs is +/- 119
		horizontaldeviation = 5 /127 -- * nv1hdef   -- value returned by fs is +/- 127
		nav1bearing=(nav1bearing+180)%360
		nav2bearing=(nav2bearing+180)%360
		gpswptbearing=(gpswptbearing+180)%360
		xhsimode=hsimode
		new_HSI(xhsimode, 0, 0, nav1name, nav1freq, nav1obs, nav1hasnav, nav1flag, nav1hasloc, nav1hdef*horizontaldeviation, nav1hasgs, nav1gsflag, nav1vdef, nav1bearing, nav1dme, nav1speed,nav2name, nav2freq, nav2obs, nav2hasnav, nav2flag, nav2hasloc, nav2hdef*horizontaldeviation, nav2hasgs, nav2gsflag, nav2vdef, nav2bearing, nav2dme, nav2speed, gpsbearing, gpswptname, gpswptbearing, gpswptdme, gpswptete, apheading, elecheading, groundtrack)
		
	end
end