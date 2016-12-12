function init_data_subscriptions()

------------------------
-- Data bus subscribe --
------------------------
-- V-Speed values may be set for: 
-- •  Va – Design Maneuvering Speed 
-- •  Vbg – Best Glide Speed 
-- •  Vref – Approach Reference Speed 
-- •  Vr – Rotation Speed 
-- •  Vx – Best Angle of Climb Speed 
-- •  Vy – Best Rate of Climb Speed 
-- •  Vlo – Maximum Landing Gear Operating Speed 
-- •  Vle – Maximum Landing Gear Extended Speed 



xpl_dataref_subscribe("sim/cockpit2/gauges/indicators/radio_altimeter_height_ft_pilot", "FLOAT",
					  "sim/cockpit/misc/radio_altimeter_minimum", "FLOAT",
					  "sim/flightmodel/misc/h_ind", "FLOAT", 
					  "sim/cockpit2/gauges/indicators/airspeed_kts_pilot", "FLOAT",
					  --"sim/aircraft/view/acf_Vne", "FLOAT",
					  --"sim/aircraft/view/acf_Vno", "FLOAT", 
					  "sim/cockpit/autopilot/altitude", "FLOAT", new_altitudeorspeed)
fsx_variable_subscribe("RADIO HEIGHT", "FEET",
					   "INDICATED ALTITUDE", "FEET",
					   "AIRSPEED INDICATED", "KNOTS",
					   "AUTOPILOT ALTITUDE LOCK VAR", "FEET", new_altitudeorspeed_fsx)
--------------------------------------------------------------------------------------------------------------------------
xpl_dataref_subscribe("sim/flightmodel/position/phi", "FLOAT",
					  "sim/flightmodel/position/theta", "FLOAT", 
					  "sim/cockpit2/gauges/indicators/slip_deg", "FLOAT", new_attitude)
fsx_variable_subscribe("ATTITUDE INDICATOR BANK DEGREES", "Degrees",
					   "ATTITUDE INDICATOR PITCH DEGREES", "Degrees",
					   --"INCIDENCE BETA", "Degrees", 
					   "TURN COORDINATOR BALL","Number",new_attitude_fsx)
--------------------------------------------------------------------------------------------------------------------------
xpl_dataref_subscribe("sim/cockpit/autopilot/airspeed", "FLOAT", 
					  "sim/cockpit/autopilot/altitude", "FLOAT", 
					  "sim/cockpit2/gauges/indicators/airspeed_kts_pilot", "FLOAT", new_infobartop)
fsx_variable_subscribe("AUTOPILOT AIRSPEED HOLD VAR", "Knots",
					   "AUTOPILOT ALTITUDE LOCK VAR", "Feet",
					   "AIRSPEED INDICATED", "KNOTS", new_infobartop)
--------------------------------------------------------------------------------------------------------------------------
xpl_dataref_subscribe("sim/cockpit/autopilot/autopilot_mode", "INT",
					  "sim/cockpit/autopilot/flight_director_pitch", "FLOAT",
					  "sim/cockpit/autopilot/flight_director_roll", "FLOAT", new_flight_director)
fsx_variable_subscribe("AUTOPILOT FLIGHT DIRECTOR ACTIVE", "BOOL",
					   "AUTOPILOT FLIGHT DIRECTOR PITCH", "Degrees",
					   "AUTOPILOT FLIGHT DIRECTOR BANK", "Degrees",
						"ATTITUDE INDICATOR PITCH DEGREES", "Degrees",
					   "ATTITUDE INDICATOR BANK DEGREES", "Degrees",new_flight_director_fsx)
--------------------------------------------------------------------------------------------------------------------------
xpl_dataref_subscribe("sim/flightmodel/position/true_airspeed", "FLOAT",
					  "sim/flightmodel/position/groundspeed", "FLOAT",
					  "sim/cockpit2/temperature/outside_air_temp_degc", "FLOAT",
					  "sim/cockpit2/gauges/indicators/wind_heading_deg_mag", "FLOAT", 
					  "sim/weather/wind_speed_kt", "FLOAT",
					  "sim/cockpit/gyros/psi_ind_degm3", "FLOAT",
					  "sim/cockpit2/gauges/actuators/barometer_setting_in_hg_pilot", "FLOAT", new_infobarcenter)
fsx_variable_subscribe("AIRSPEED TRUE", "Meters per second",
					   "GPS GROUND SPEED", "Meters per second",
					   "AMBIENT TEMPERATURE", "Celsius",
					   "AMBIENT WIND DIRECTION", "Degrees", 
					   "AMBIENT WIND VELOCITY", "Knots",
					   "GPS GROUND TRUE HEADING", "Degrees",
					   "KOHLSMAN SETTING HG", "inHg", new_infobarcenter)
--------------------------------------------------------------------------------------------------------------------------
xpl_dataref_subscribe("sim/cockpit/gyros/psi_ind_degm3", "FLOAT",
					  "sim/flightmodel/misc/turnrate_roll", "FLOAT", new_heading)
fsx_variable_subscribe("PLANE HEADING DEGREES GYRO", "Degrees", 
					   "DELTA HEADING RATE","Degrees",
					   new_heading_FSX)
--------------------------------------------------------------------------------------------------------------------------
xpl_dataref_subscribe("sim/cockpit2/gauges/indicators/vvi_fpm_pilot", "FLOAT", new_vsi)
fsx_variable_subscribe("VERTICAL SPEED", "Feet per minute", new_vsi)
--------------------------------------------------------------------------------------------------------------------------
-- xpl_dataref_subscribe(
			  -- "sim/cockpit/gyros/psi_vac_ind_degm", "FLOAT",
              -- "sim/cockpit2/radios/actuators/HSI_source_select_pilot", "INT",
              -- "sim/cockpit2/radios/actuators/hsi_obs_deg_mag_pilot", "FLOAT",
			  -- "sim/cockpit/radios/nav1_fromto","INT",
			  -- "sim/cockpit/radios/nav2_fromto","INT",
			  -- "sim/cockpit/radios/gps_fromto","INT",
              -- "sim/cockpit2/radios/indicators/nav1_hdef_dots_pilot", "FLOAT",
              -- "sim/cockpit2/radios/indicators/nav2_hdef_dots_pilot", "FLOAT",
              -- "sim/cockpit2/radios/indicators/gps_hdef_dots_pilot", "FLOAT",
              -- "sim/cockpit2/radios/indicators/nav1_vdef_dots_pilot", "FLOAT",
              -- "sim/cockpit2/radios/indicators/nav2_vdef_dots_pilot", "FLOAT",
              -- "sim/cockpit2/radios/indicators/gps_vdef_dots_pilot", "FLOAT", 
              -- "sim/cockpit2/radios/indicators/nav1_display_horizontal", "INT", 
              -- "sim/cockpit2/radios/indicators/nav2_display_horizontal", "INT",
			  -- "sim/cockpit/autopilot/heading_mag", "FLOAT", 
			  -- "sim/cockpit/gyros/psi_ind_degm3", "FLOAT",
			  -- "sim/flightmodel/position/psi", "FLOAT", new_HSI)
--function new_HSI(heading, mode, crs, nav1flag, nav2flag, gpsflag, nav1hdef, nav2hdef, gpshdef, nav1vdef, nav2vdef, gpsvdef, nav1display, nav2display, hsihassignal, hsiwptfreq, hsiwptname, hsiwptbearing, hsiwptdme,hsiwptspeed,apheading, elecheading, groundtrack,)
   


fsx_variable_subscribe(
					"NAV IDENT:1","String",					
					"NAV ACTIVE FREQUENCY:1","Megahertz",
					"NAV OBS:1", "Degrees",
					"NAV HAS NAV:1","Bool",
					"NAV TOFROM:1","Number", 
					"NAV HAS LOCALIZER:1","Bool",
					"NAV CDI:1", "Number",
					"NAV HAS GLIDE SLOPE:1", "Bool",
					"NAV GS FLAG:1", "Bool", 
					"NAV GSI:1", "Number",
					"NAV RADIAL:1","Degrees",
					"NAV DME:1","Nautical miles",
					"NAV DMESPEED:1","Knots",						
					"NAV IDENT:2","String",					
					"NAV ACTIVE FREQUENCY:2","Megahertz",
					"NAV OBS:2", "Degrees",
					"NAV HAS NAV:2","Bool",
					"NAV TOFROM:2","Number", 
					"NAV HAS LOCALIZER:2","Bool",
					"NAV CDI:2", "Number",
					"NAV HAS GLIDE SLOPE:2", "Bool",
					"NAV GS FLAG:2", "Bool", 
					"NAV GSI:2", "Number",
					"NAV RADIAL:2","Degrees",
					"NAV DME:2","Nautical miles",
					"NAV DMESPEED:2","Knots",					
					"GPS WP DESIRED TRACK", "Degrees",-- obs en mode GPS
					"NAV IDENT","String",
					"GPS WP BEARING","Degrees",
					"GPS WP DISTANCE","Nautical miles",
					"GPS WP ETE","Hours",			
					"AUTOPILOT HEADING LOCK DIR", "Degrees",
					"PLANE HEADING DEGREES GYRO", "Degrees",
					"GPS GROUND TRUE TRACK", "Degrees",					   
						new_HSI_FSX)
					-- "HSI STATION IDENT","String",	
					-- "HSI BEARING VALID","BOOL",
   					-- "HSI TF FLAG","Number"	
					-- "HSI CDI NEEDLE VALID","BOOL",
					-- "HSI HAS LOCALIZER","BOOL",
					-- "HSI CDI NEEDLE","Number",
					-- "HSI GSI NEEDLE VALID","BOOL",
					-- "HSI GSI NEEDLE","Number",
					-- "HSI BEARING","Degrees",
					-- "HSI DISTANCE","Nautical miles",
					-- "HSI SPEED","Knots",	
-- function new_HSI(heading,cdimode, rmi1mode,rmi2mode, nav1wptname, nav1wptfreq, nav1obs, nav1hasnav, nav1flag, nav1hasloc, nav1hdef, nav1hasgs, nav1gsflag, nav1vdef, nav1bearing, nav1dme, nav1speed,nav2wptname, nav2wptfreq, nav2obs, nav2hasnav, nav2flag, nav2hasloc, nav2hdef, nav2hasgs, nav2gsflag, nav2vdef, nav2bearing, nav2dme, nav2speed,gpsbearing, gpswptname, gpshdef, gpswptbearing, gpswptdme, gpswptete, apheading, elecheading, groundtrack) --nav1display, nav2display


end