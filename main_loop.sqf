time_multiplier = 7;
execVM "vehicle_spawn\spawn_periodic_civilian_cars.sqf";
execVM "check_checkpoint_clear.sqf";
latch_0 = 0;
latch_7 = 0;
dt = time_multiplier*0.03;
while {true} do{

	if(daytime > 19.75 && dayTime < 19.75 + dt) then {
		speaker_1 say3D ["stalker_short",250,1];
		latch_0 = 1;
	};
	if(daytime > 20 && dayTime < 20 + dt) then {
		execVM "vehicle_spawn\spawn_attack_car_random.sqf";
		sleep 120;
		execVM "vehicle_spawn\spawn_attack_car_random.sqf";
	};
	// if(daytime > 21 && dayTime < 22) then {
	// 	//quest starts...
	// };
	if(daytime > 23 && dayTime < 23 + dt) then {
		execVM "vehicle_spawn\spawn_attack_car_random.sqf";
		execVM "unit_spawn\spawn_attack_wave.sqf";
	};
	if(daytime > 0 && dayTime < 0 + dt) then {
		execVM "vehicle_spawn\spawn_suicide_truck.sqf";
		sleep 20;
		execVM "unit_spawn\spawn_attack_wave.sqf";
	};
	if(daytime > 1 && dayTime < 1 + dt) then {
		execVM "vehicle_spawn\spawn_attack_car_heavy.sqf";
		sleep 15;
		execVM "vehicle_spawn\spawn_attack_car_heavy.sqf";
		sleep 15;
		execVM "vehicle_spawn\spawn_attack_car_random.sqf";
		execVM "unit_spawn\spawn_attack_wave.sqf";
	};
	if(daytime > 2 && dayTime < 2 + dt) then {
		execVM "vehicle_spawn\spawn_attack_car_heavy.sqf";
		sleep 10;
		execVM "vehicle_spawn\spawn_attack_car_heavy.sqf";
	};
	if (daytime > 3 && dayTime < 4 && latch_7 == 0) then {
		civ_car_active = false;
		publicVariable "civ_car_active";
		execVM "final_assault.sqf";
		["skyfall"] remoteExec ["playSound"];
		latch_7 = 1;
	};
	// else if(daytime > 4 && dayTime < 5) then {
		
	// }
	//else if(daytime > 5 && dayTime < 6) then {
		
	// };


	sleep 60;
}

/*
//Check checkpoint clear:
execVM "check_checkpoint_clear.sqf";

//To enable civilian car spawns:
execVM "vehicle_spawn\spawn_periodic_civilian_cars.sqf";

//To disable civilian car spawns:
civ_car_active = false;
publicVariable "civ_car_active";

//To spawn attack wave (infantry):
execVM "unit_spawn\spawn_attack_wave.sqf";

//To spawn attack wave (light vehicle):
execVM "vehicle_spawn\spawn_attack_car_random.sqf";

//To spawn attack wave (heavy vehicle):
execVM "vehicle_spawn\spawn_attack_car_heavy.sqf"; 

//To turn off radio (one time only):
_pos = getPos speaker_1;
deleteVehicle speaker_1;
speaker_2 setPos _pos;

//To spawn suicide truck:
execVM "vehicle_spawn\spawn_suicide_truck.sqf";

//To initiate final assault:
execVM "final_assault.sqf";
["skyfall"] remoteExec ["playSound"];

*/