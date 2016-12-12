function init_startup()


	---------  Startup sequence ----------------------
	function display_startup() -- first page (all n/a in grey)
		off_state = false
		visible(img_screenoff,false) -- on enlève l'écran noir
		visible(img_startup,false)
		visible(img_startup_bkg_blackscreen,true) -- on met l'écran noir de démarrage
		visible(img_startup_bkg_white,true) -- on met le fond blanc pour le texte
		visible(txt_IOP,true)
		txt_style(txt_IOP,"-fx-font-size:24pt; -fx-font-family:Arial; -fx-fill: grey; -fx-font-weight:bold; -fx-text-alignment:left;")
		visible (txt_IOP_statusna,true)
		visible(txt_IOP_statusinit,false)
		visible(txt_IOP_statuscomplete,false)
		visible(txt_ARINC,true)
		txt_style(txt_ARINC,"-fx-font-size:24pt; -fx-font-family:Arial; -fx-fill: grey; -fx-font-weight:bold; -fx-text-alignment:left;")
		visible (txt_ARINC_statusna,true)
		visible(txt_ARINC_statusinit,false)
		visible(txt_ARINC_statuscomplete,false)
		visible(txt_RS232,true)
		txt_style(txt_RS232,"-fx-font-size:24pt; -fx-font-family:Arial; -fx-fill: grey; -fx-font-weight:bold; -fx-text-alignment:left;")
		visible (txt_RS232_statusna,true)
		visible(txt_RS232_statusinit,false)
		visible(txt_RS232_statuscomplete,false)
		visible(txt_CFG,true)
		txt_style(txt_CFG,"-fx-font-size:24pt; -fx-font-family:Arial; -fx-fill: grey; -fx-font-weight:bold; -fx-text-alignment:left;")
		visible (txt_CFG_statusna,true)
		visible(txt_CFG_statusinit,false)
		visible(txt_CFG_statuscomplete,false)
		visible(txt_RSM,true)
		txt_style(txt_RSM,"-fx-font-size:24pt; -fx-font-family:Arial; -fx-fill: grey; -fx-font-weight:bold; -fx-text-alignment:left;")
		visible (txt_RSM_statusna,true)
		visible(txt_RSM_statusinit,false)
		visible(txt_RSM_statuscomplete,false)
		visible(txt_IMU,true)
		txt_style(txt_IMU,"-fx-font-size:24pt; -fx-font-family:Arial; -fx-fill: grey; -fx-font-weight:bold; -fx-text-alignment:left;")
		visible (txt_IMU_statusna,true)
		visible(txt_IMU_statusinit,false)
		visible(txt_IMU_statuscomplete,false)
		visible(txt_ADC,true)
		txt_style(txt_ADC,"-fx-font-size:24pt; -fx-font-family:Arial; -fx-fill: grey; -fx-font-weight:bold; -fx-text-alignment:left;")
		visible (txt_ADC_statusna,true)
		visible(txt_ADC_statusinit,false)
		visible(txt_ADC_statuscomplete,false)
		visible(txt_ADAHRS,true)
		txt_style(txt_ADAHRS,"-fx-font-size:24pt; -fx-font-family:Arial; -fx-fill: grey; -fx-font-weight:bold; -fx-text-alignment:left;")
		visible (txt_ADAHRS_statusna,true)
		visible(txt_ADAHRS_statusinit,false)
		visible(txt_ADAHRS_statuscomplete,false)
		timer_start(start1_duration1,nil,timer_callback1)
	end
	
	function timer_callback1() -- second page (IOP, ARINC, RS232)
		visible(txt_IOP,true)
		visible (txt_IOP_statusna,false)
		txt_style(txt_IOP,"-fx-font-size:24pt; -fx-font-family:Arial; -fx-fill: black; -fx-font-weight:bold; -fx-text-alignment:left;")
		visible(txt_IOP_statusinit,true) --initializing
		visible(txt_IOP_statuscomplete,false)
		visible(txt_ARINC,true)
		visible (txt_ARINC_statusna,false)
		txt_style(txt_ARINC,"-fx-font-size:24pt; -fx-font-family:Arial; -fx-fill: black; -fx-font-weight:bold; -fx-text-alignment:left;")
		visible(txt_ARINC_statusinit,true)
		visible(txt_ARINC_statuscomplete,false)
		visible(txt_RS232,true)
		txt_style(txt_RS232,"-fx-font-size:24pt; -fx-font-family:Arial; -fx-fill: black; -fx-font-weight:bold; -fx-text-alignment:left;")
		visible (txt_RS232_statusna,false)
		visible(txt_RS232_statusinit,true)
		visible(txt_RS232_statuscomplete,false)
		visible(txt_CFG,true)
		visible (txt_CFG_statusna,true)
		visible(txt_CFG_statusinit,false)
		visible(txt_CFG_statuscomplete,false)
		visible(txt_RSM,true)
		visible (txt_RSM_statusna,true)
		visible(txt_RSM_statusinit,false)
		visible(txt_RSM_statuscomplete,false)
		visible(txt_IMU,true)
		visible (txt_IMU_statusna,true)
		visible(txt_IMU_statusinit,false)
		visible(txt_IMU_statuscomplete,false)
		visible(txt_ADC,true)
		visible (txt_ADC_statusna,true)
		visible(txt_ADC_statusinit,false)
		visible(txt_ADC_statuscomplete,false)
		visible(txt_ADAHRS,true)
		visible (txt_ADAHRS_statusna,true)
		visible(txt_ADAHRS_statusinit,false)
		visible(txt_ADAHRS_statuscomplete,false)
		timer_start(start1_duration2,nil,timer_callback2)
	end
	
	function timer_callback2() -- third page (CFG)
		visible(txt_IOP,true)
		visible (txt_IOP_statusna,false)
		visible(txt_IOP_statusinit,false)
		visible(txt_IOP_statuscomplete,true)
		visible(txt_ARINC,true)
		visible (txt_ARINC_statusna,false)
		visible(txt_ARINC_statusinit,false)
		visible(txt_ARINC_statuscomplete,true)
		visible(txt_RS232,true)
		visible (txt_RS232_statusna,false)
		visible(txt_RS232_statusinit,false)
		visible(txt_RS232_statuscomplete,true)
		visible(txt_CFG,true)
		txt_style(txt_CFG,"-fx-font-size:24pt; -fx-font-family:Arial; -fx-fill: black; -fx-font-weight:bold; -fx-text-alignment:left;")
		visible (txt_CFG_statusna,false)
		visible(txt_CFG_statusinit,true)
		visible(txt_CFG_statuscomplete,false)
		visible(txt_RSM,true)
		visible (txt_RSM_statusna,true)
		visible(txt_RSM_statusinit,false)
		visible(txt_RSM_statuscomplete,false)
		visible(txt_IMU,true)
		visible (txt_IMU_statusna,true)
		visible(txt_IMU_statusinit,false)
		visible(txt_IMU_statuscomplete,false)
		visible(txt_ADC,true)
		visible (txt_ADC_statusna,true)
		visible(txt_ADC_statusinit,false)
		visible(txt_ADC_statuscomplete,false)
		visible(txt_ADAHRS,true)
		visible (txt_ADAHRS_statusna,true)
		visible(txt_ADAHRS_statusinit,false)
		visible(txt_ADAHRS_statuscomplete,false)
		timer_start(start1_duration3,nil,timer_callback3)
	end
	
	function timer_callback3()-- fourth page (RSM)
		-- visible(txt_IOP,true)
		-- visible (txt_IOP_statusna,true)
		-- visible(txt_IOP_statusinit,false)
		-- visible(txt_IOP_statuscomplete,false)
		-- visible(txt_ARINC,true)
		-- visible (txt_ARINC_statusna,true)
		-- visible(txt_ARINC_statusinit,false)
		-- visible(txt_ARINC_statuscomplete,false)
		-- visible(txt_RS232,true)
		-- visible (txt_RS232_statusna,true)
		-- visible(txt_RS232_statusinit,false)
		-- visible(txt_RS232_statuscomplete,false)
		-- visible(txt_CFG,true)
		visible (txt_CFG_statusna,false)
		visible(txt_CFG_statusinit,false)
		visible(txt_CFG_statuscomplete,true)
		visible(txt_RSM,true)
		txt_style(txt_RSM,"-fx-font-size:24pt; -fx-font-family:Arial; -fx-fill: black; -fx-font-weight:bold; -fx-text-alignment:left;")
		visible (txt_RSM_statusna,false)
		visible(txt_RSM_statusinit,true)
		visible(txt_RSM_statuscomplete,false)
		visible(txt_IMU,true)
		visible (txt_IMU_statusna,false)
		visible(txt_IMU_statusinit,false)
		visible(txt_IMU_statuscomplete,false)
		visible(txt_ADC,true)
		visible (txt_ADC_statusna,false)
		visible(txt_ADC_statusinit,false)
		visible(txt_ADC_statuscomplete,false)
		visible(txt_ADAHRS,true)
		visible (txt_ADAHRS_statusna,false)
		visible(txt_ADAHRS_statusinit,false)
		visible(txt_ADAHRS_statuscomplete,false)
		timer_start(start1_duration4,nil,timer_callback4)
	end
	
	function timer_callback4() -- fifth page (ADAHRS)
		-- visible(txt_IOP,true)
		-- visible (txt_IOP_statusna,true)
		-- visible(txt_IOP_statusinit,false)
		-- visible(txt_IOP_statuscomplete,false)
		-- visible(txt_ARINC,true)
		-- visible (txt_ARINC_statusna,true)
		-- visible(txt_ARINC_statusinit,false)
		-- visible(txt_ARINC_statuscomplete,false)
		-- visible(txt_RS232,true)
		-- visible (txt_RS232_statusna,true)
		-- visible(txt_RS232_statusinit,false)
		-- visible(txt_RS232_statuscomplete,false)
		-- visible(txt_CFG,true)
		-- visible (txt_CFG_statusna,true)
		-- visible(txt_CFG_statusinit,false)
		-- visible(txt_CFG_statuscomplete,false)
		visible(txt_RSM,true)
		visible (txt_RSM_statusna,false)
		visible(txt_RSM_statusinit,false)
		visible(txt_RSM_statuscomplete,true)
		visible(txt_IMU,true)
		txt_style(txt_IMU,"-fx-font-size:24pt; -fx-font-family:Arial; -fx-fill: black; -fx-font-weight:bold; -fx-text-alignment:left;")
		visible (txt_IMU_statusna,false)
		visible(txt_IMU_statusinit,true)
		visible(txt_IMU_statuscomplete,false)
		visible(txt_ADC,true)
		txt_style(txt_ADC,"-fx-font-size:24pt; -fx-font-family:Arial; -fx-fill: black; -fx-font-weight:bold; -fx-text-alignment:left;")
		visible (txt_ADC_statusna,false)
		visible(txt_ADC_statusinit,true)
		visible(txt_ADC_statuscomplete,false)
		visible(txt_ADAHRS,true)
		txt_style(txt_ADAHRS,"-fx-font-size:24pt; -fx-font-family:Arial; -fx-fill: black; -fx-font-weight:bold; -fx-text-alignment:left;")
		visible (txt_ADAHRS_statusna,false)
		visible(txt_ADAHRS_statusinit,true)
		visible(txt_ADAHRS_statuscomplete,false)
		timer_start(start1_duration5,nil,timer_callback5)
	end
	
	function timer_callback5() -- sixth page 
		visible(img_screenoff,false) -- on enlève l'écran noir
		visible(img_startup,true) -- on affiche l'écran de démarrage
		visible(img_startup_bkg_blackscreen,false) -- on met l'écran noir de démarrage
		visible(img_startup_bkg_white,false) -- on met le fond blanc pour le texte
		-- visible(txt_IOP,true)
		-- visible (txt_IOP_statusna,false)
		-- visible(txt_IOP_statusinit,false)
		-- visible(txt_IOP_statuscomplete,true)
		-- visible(txt_ARINC,true)
		-- visible (txt_ARINC_statusna,false)
		-- visible(txt_ARINC_statusinit,false)
		-- visible(txt_ARINC_statuscomplete,true)
		-- visible(txt_RS232,true)
		-- visible (txt_RS232_statusna,false)
		-- visible(txt_RS232_statusinit,false)
		-- visible(txt_RS232_statuscomplete,true)
		-- visible(txt_CFG,true)
		-- visible (txt_CFG_statusna,false)
		-- visible(txt_CFG_statusinit,false)
		-- visible(txt_CFG_statuscomplete,true)
		-- visible(txt_RSM,true)
		-- visible (txt_RSM_statusna,false)
		-- visible(txt_RSM_statusinit,false)
		-- visible(txt_RSM_statuscomplete,true)
		-- visible(txt_IMU,true)
		visible (txt_IMU_statusna,false)
		visible(txt_IMU_statusinit,false)
		visible(txt_IMU_statuscomplete,true)
		visible(txt_ADC,true)
		visible (txt_ADC_statusna,false)
		visible(txt_ADC_statusinit,false)
		visible(txt_ADC_statuscomplete,true)
		visible(txt_ADAHRS,true)
		visible (txt_ADAHRS_statusna,false)
		visible(txt_ADAHRS_statusinit,true)
		visible(txt_ADAHRS_statuscomplete,false)
		timer_start(start1_duration6,nil,timer_callback6)
	end
	
	function timer_callback6() --all tests completed
		visible(txt_ADAHRS,true)
		visible (txt_ADAHRS_statusna,false)
		visible(txt_ADAHRS_statusinit,false)
		visible(txt_ADAHRS_statuscomplete,true)
		timer_start(start1_duration7,nil,timer_callback7)
	end
	
	function timer_callback7() -- diagnostic sequence completed, warming up sequence: VSI, ALT and SPD failed
		-- on enlève les textes du startup screen
		visible(txt_IOP,false)
		visible (txt_IOP_statusna,false)
		visible(txt_IOP_statusinit,false)
		visible(txt_IOP_statuscomplete,false)
		visible(txt_ARINC,false)
		visible (txt_ARINC_statusna,false)
		visible(txt_ARINC_statusinit,false)
		visible(txt_ARINC_statuscomplete,false)
		visible(txt_RS232,false)
		visible (txt_RS232_statusna,false)
		visible(txt_RS232_statusinit,false)
		visible(txt_RS232_statuscomplete,false)
		visible(txt_CFG,false)
		visible (txt_CFG_statusna,false)
		visible(txt_CFG_statusinit,false)
		visible(txt_CFG_statuscomplete,false)
		visible(txt_RSM,false)
		visible (txt_RSM_statusna,false)
		visible(txt_RSM_statusinit,false)
		visible(txt_RSM_statuscomplete,false)
		visible(txt_IMU,false)
		visible (txt_IMU_statusna,false)
		visible(txt_IMU_statusinit,false)
		visible(txt_IMU_statuscomplete,false)
		visible(txt_ADC,false)
		visible (txt_ADC_statusna,false)
		visible(txt_ADC_statusinit,false)
		visible(txt_ADC_statuscomplete,false)
		visible(txt_ADAHRS,false)
		visible (txt_ADAHRS_statusna,false)
		visible(txt_ADAHRS_statusinit,false)
		visible(txt_ADAHRS_statuscomplete,false)
		-- on enlève le startup screen, l'instrument s'affiche
		visible(img_startup,false)
		-- on enleve les tapes
		display_tapes(false) 
		-- on enlève les ALT et SPEED Boxes
		visible(img_upperspeedbox,false)
		visible(img_upperaltbox,false)
		visible(img_apaltbox,false)
		visible(txt_apspd1,false)
		visible(txt_apspd2,false)
		visible(txt_apalt1,false)
		visible(txt_apalt2,false)
		-- on enleve l'affichage du VSI 
		visible(txt_vsi,false) 
		visible(txt_vsi2,false)
		-- affichage des flags d'erreur IAS, VSI et ALT
		visible(img_IAS_fail,true)
		visible(img_ALT_fail,true)
		visible(img_VSI_fail,true)
		timer_start(start1_duration8,nil,timer_callback8)
	end
	
	function timer_callback8() -- bringing back everything to view, startup sequence complete
		display_tapes(true)
		visible(img_upperspeedbox,true)
		visible(img_upperaltbox,true)
		visible(img_apaltbox,false)
		visible(txt_apspd1,true)
		visible(txt_apspd2,true)
		visible(txt_apalt1,true)
		visible(txt_apalt2,true)
		visible(txt_vsi,true)
		visible(txt_vsi2,true)
		-- flags d'erreur IAS, VSI et ALT
		visible(img_IAS_fail,false)
		visible(img_ALT_fail,false)
		visible(img_VSI_fail,false)
		off_state=false
	end

	function startup_sequence()
		if off_state==true then
			display_startup()
		end
	end

end