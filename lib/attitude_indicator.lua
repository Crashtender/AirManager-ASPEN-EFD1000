
function init_attitude_indicator()
------------------- Attitude indicator -------------------------------
function new_attitude(roll, pitch, slip)    

-- Roll outer ring (roll)
	rollind = var_cap(roll, -60, 60)
    img_rotate(img_roll, rollind * -1)
        
-- Roll horizon
   img_rotate(img_horizon, roll * -1)
   img_rotate(img_horizonscale, roll * -1)
    
-- Move horizon pitch
    radial = math.rad(roll * -1)
    pitchscale = var_cap(pitch,-90,90)
    pitchhoriz = var_cap(pitch,-20,20) -- on limite l'affichage de l'horizon pour laisser un bout de ciel ou de terre aux grandes incidences
    xhoriz = -(math.sin(radial) * pitchhoriz * 14)
    yhoriz = (math.cos(radial) * pitchhoriz * 14)
	xhscale = -(math.sin(radial) * pitchscale * 14)
    yhscale = (math.cos(radial) * pitchscale * 14)
    img_move(img_horizon, xhoriz - (2000-800)/2, yhoriz- (1522-154), nil, nil)
    img_move(img_horizonscale, xhscale - (2000-800)/2, yhscale  - (1522-154), nil, nil) 
  
-- Move slip ball
	slip = var_cap(slip * 2,-30,30)
    img_move(img_slip, 400-19 - slip, nil, nil, nil)
	
end

function new_attitude_fsx(roll, pitch, slip)
	
	new_attitude(roll *-1, pitch * -1, slip * -1)

end
-- Autopilot flight director --
function new_flight_director(state, fdpitch, fdroll,pitch,roll) --pitch and roll indegrees
-- Flight director visible
if state ==	1 then
visible(img_flightdirector, true)

img_rotate(img_flightdirector, (fdroll)*-1)
-- Flight director pitch and roll
	pitchind = fdpitch-pitch-- var_cap(pitch,-25,25)
	rollind = fdroll--var_cap(roll,-45,45)
--print("pitch:",pitchind)
	rad_roll = math.rad(rollind*-1)
	rad_pitch = math.rad(pitchind)
	x = -(math.sin(rad_pitch) * pitchind * 14)
	y = (math.cos(rad_pitch) * pitchind*14) --1412.7
--	print(y)
--	img_move(img_flightdirector, (x * -1) + 222, (y * -1) + 1522-1139, nil, nil)--img_move(img_flightdirector, (x * -1) + 222, (y * -1) + 321, nil, nil)
--	img_move(img_flightdirector, 222, (y * -1)+382, nil, nil)--img_move(img_flightdirector, (x * -1) + 222, (y * -1) + 321, nil, nil)
img_move(img_flightdirector, 222, y+383, nil, nil)--img_move(img_flightdirector, (x * -1) + 222, (y * -1) + 321, nil, nil)
	--print(rollind.."°")
  --print(rad_roll.."rad")

else 
 visible(img_flightdirector, false)
end
end

function new_flight_director_fsx(state, fdpitch,fdroll,pitch, roll) --pitch and roll in radians
-- pitch=math.deg(pitch*-1)
-- roll=math.deg(roll)
if state==true then 
new_flight_director(1,fdpitch,fdroll, pitch, roll)
else
new_flight_director(0, fdpitch,fdroll, pitch, roll)
end
end
end