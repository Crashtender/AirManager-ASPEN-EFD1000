------------------------------------------------------------------------
-- This is a Aspen EFD1000 inspired EFD                               --
-- Made by Ralph with help from Corjan                                --
-- Improved VERSION 2.00 beta                                         --
-- J.ZAHAR ET T. GEORGELIN                                            --
-- 03/03/16                                                           --
------------------------------------------------------------------------
-- *********************************************************************************************** --
------------------------------------------------------------------------
--                       DISPLAY OPTIONS VARIABLES                    --
--                         (Modify to taste)   	                      --
------------------------------------------------------------------------
----------- Barometer default Unit setting ----------
-- Set baro_unit to "inHg" to display in Hg
-----------------------------------------------------
baro_unit="Millibars" 
----------- V-Speed values --------------------------
--  adjust values to the current airplane
-- (Set all values to zero to hide speedtapes)
-----------------------------------------------------
-- vne=0 
-- vno=0 
-- vfe=0 
-- vs=0
-- vs0=0 
vne=210 -- Never exceed speed: start of red speedtape in kts (min 0, max 450)
vno=180 -- Normal operation speed: start of yellow speedtape in kts(min 0, max 450)
vfe=122 -- max flaps extension speed: start of green tape in kts
vs=84 -- Stall speed flaps 0°: start of white tape 1 in kts
vs0=55 -- Stall speed full flaps: start of white tape 2 and end of bottom red tape in kts
----------- Vref values ------------------------------
-- To be done....
------------------------------------------------------
-- •  Va – Design Maneuvering Speed 
-- •  Vbg – Best Glide Speed 
-- •  Vref – Approach Reference Speed 
-- •  Vr – Rotation Speed 
-- •  Vx – Best Angle of Climb Speed 
-- •  Vy – Best Rate of Climb Speed 
-- •  Vlo – Maximum Landing Gear Operating Speed 
-- •  Vle – Maximum Landing Gear Extended Speed
-------- Startup Diagnostics message durations -------
-- set all values to 0  to bypass startup sequence
------------------------------------------------------
start1_duration1=1000 -- duration of message in milliseconds, set duration to 0 for no display
start1_duration2=4000 -- duration of message in milliseconds, set duration to 0 for no display
start1_duration3=3000 -- duration of message in milliseconds, set duration to 0 for no display
start1_duration4=1500 -- duration of message in milliseconds, set duration to 0 for no display
start1_duration5=3000 -- duration of message in milliseconds, set duration to 0 for no display
start1_duration6=3000 -- duration of message in milliseconds, set duration to 0 for no display
start1_duration7=5000 -- duration of message in milliseconds, set duration to 0 for no display
start1_duration8=10000 -- duration of message in milliseconds, set duration to 0 for no display
-- start1_duration1=000
-- start1_duration2=000 
-- start1_duration3=000 
-- start1_duration4=000
-- start1_duration5=000
-- start1_duration6=000
-- start1_duration7=000
-- start1_duration8=000
---------- Shutdown phase message durations ---------
-- set all values to 0 to bypass shutdown phase
-----------------------------------------------------
countdown_duration=10000 -- duration of countdown message in milliseconds, set duration to 0 for no display
shutdown_duration2=3000 --- duration of message in milliseconds, set duration to 0 for no display
-- countdown_duration=000
-- shutdown_duration2=000
------------------------------------------------------------------------
--                      DISPLAY OPTIONS VARIABLES                     --
--                            END OF SECTION   	                      --
--                Do not modifiy the code beyond this point!          --
------------------------------------------------------------------------
-- *********************************************************************************************** --


init_sounds()
init_global_vars()
init_visual_elements()


---------------
-- Functions --
---------------

init_speed()
init_startup()
init_shutdown()
init_altimeter()
init_attitude_indicator()
init_info_bars()
init_HSI()
init_bezel_input()
init_data_subscriptions()









