-------------------------------------------------------
----
---- F11 Museum 2025 Bengt
-------------------------------------------------------
debug = create_dataref("AJ37/brakechute/want", "number")
sim_heartbeat = create_dataref("AJ37/heartbeat/brakechute", "number")
sim_heartbeat = 100
--dr_firebutton =  find_dataref("sim/joystick/fire_key_is_down")
dr_firebutton =  find_dataref("sim/cockpit/switches/pitot_heat_on")
sim_heartbeat = 101
--sim/engines/idle_hi_lo_toggle
simCMD_deploy_parachute = find_command("sim/flight_controls/deploy_parachute")

-- Plugin funktioner
sim_heartbeat = 102

function flight_start() 
	
	
end

function aircraft_unload()

end

function do_on_exit()

end
debug = 10

button_prev = 0
function checkbutton()
	sim_heartbeat = 200
	if (dr_firebutton >0 and button_prev == 0) then
		simCMD_deploy_parachute:once()
		sim_heartbeat = 301
		debug = 1
	end
	button_prev = dr_firebutton
	sim_heartbeat = 201
	
end

heartbeat = 0
function before_physics() 
	sim_heartbeat = 200
	checkbutton()
	sim_heartbeat = 202

	sim_heartbeat = heartbeat
	heartbeat = heartbeat + 1
end

function after_physics() 	
--
end
