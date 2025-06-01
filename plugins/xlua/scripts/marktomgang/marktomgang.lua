-------------------------------------------------------
----
---- F11 Museum 2025 Bengt
-------------------------------------------------------
debug = create_dataref("AJ37/marktom/want", "number")
sim_heartbeat = create_dataref("AJ37/heartbeat/marktom", "number")
sim_heartbeat = 100
--sim/cockpit2/engine/actuators/throttle_ratio
dr_throttle = find_dataref("sim/cockpit2/engine/actuators/throttle_ratio[0]") 
--sim/cockpit/engine/idle_speed
dr_idle = find_dataref("sim/cockpit/engine/idle_speed[0]") 
sim_heartbeat = 101
--sim/engines/idle_hi_lo_toggle
simCMD_toggle_idle = find_command("sim/engines/idle_hi_lo_toggle")
simCMD_drop_tank = find_command("sim/flight_controls/drop_tank")

-- Plugin funktioner
sim_heartbeat = 102
function flight_start() 
	
	
end

function aircraft_unload()

end

function do_on_exit()

end
debug = 10
function marktom()
	sim_heartbeat = 200
	if (dr_throttle >0 and dr_idle == 0) then
		dr_idle = 1
		simCMD_toggle_idle:once()
		sim_heartbeat = 301
		debug = 1
		return
    end
	sim_heartbeat = 201
	if (dr_throttle == 0 and dr_idle == 1) then
		dr_idle = 0
		simCMD_toggle_idle:once()
		simCMD_drop_tank:once()
		debug = 2
		sim_heartbeat = 302
		return
    end
	--simCMD_toggle_idle:stop()
end

heartbeat = 0
function before_physics() 
	sim_heartbeat = 200
	
	sim_heartbeat = 202

	sim_heartbeat = heartbeat
	heartbeat = heartbeat + 1
end

function after_physics() 	
	marktom()
end
