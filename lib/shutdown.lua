function init_shutdown()

------------ Shutdown sequence -----------------
function timer_callback01() -- shutdown phase 2
visible(img_screenoff,true)
visible(img_shutdown1,false)
visible(txt_shutdown_countdown,false)
visible(img_shutdown2,true)
timer_start(shutdown_duration2,nil,timer_callback02)
end
function timer_callback02() -- black screen (end of shutdown sequence)
--timer_stop(tmr_countdown)
visible(img_screenoff,true)
visible(img_shutdown1,false)
visible(txt_shutdown_countdown,false)
visible(img_shutdown2,false)
off_state = true
end

function timer_countdown01()
-- if buttonpressed==false then
	if count>=0 then 
		txt_set(txt_shutdown_countdown,count)
		count=count-1
	else
		timer_stop(tmr_countdown)
	end
-- else 
	-- timer_stop(tmr_countdown)
	-- timer_stop(tmr_shutdown)
-- end
end
function display_shutdown()
if off_state==false then
	visible(img_screenoff,false)
	visible(img_shutdown1,true)-- shutdown phase 1
	visible(txt_shutdown_countdown,true)
	count=countdown_duration/1000 -- nombre de secondes du compte à rebours
	tmr_countdown=timer_start(0,1000,timer_countdown01)-- décompte toutes les secondes
	timer_shutdown=timer_start(countdown_duration,nil,timer_callback01)
	end
end

function shutdown_sequence()
if off_state==false then
	display_shutdown()
end
end
-----------------------------------------
	
end