time_multiplier = 7;
execVM "vehicle_spawn\spawn_periodic_civilian_cars.sqf";
execVM "check_checkpoint_clear.sqf";
latch_0 = 0;
latch_7 = 0;
dt = time_multiplier*0.03;
_time_since_start = 0;
/*
We want to have three "difficulties" that increase
as the mission progresses.  We can set difficult to increase every 0.25 of total time.
Every 60 seconds, "roll" probabilities for rear/front attacks.
*/
front_attacks = ["vehicle_spawn\spawn_attack_car_random.sqf"];
low_civ_rating_sounds = ["civ_rating_too_low"];
high_contraband_sounds = ["too_much_contraband"];
while {true} do{
	//First check time:
	if(dayTime > 23 && (count front_attacks < 2)) then {
		front_attacks pushBack "unit_spawn\spawn_attack_wave.sqf";
	};
	if(dayTime > 0 && dayTime < 1 && (count front_attacks < 3)) then {
		front_attacks pushBack "vehicle_spawn\spawn_attack_car_heavy.sqf";
	};

	//Roll probabilities:
	if(random 100 < ar_frnt && ar_frnt > 10)then{
		execVM selectRandom front_attacks;
		ar_frnt = ar_frnt/2;
		publicVariable "ar_frnt";
		};
	if(random 100 < ar_back && ar_back > 25)then{
		execVM "mission_flow\spawn_rear_attack_wave.sqf";
		ar_back = ar_back/2;
		publicVariable "ar_back";
		};
	if(civilian_rating<75 && (count low_civ_rating_sounds != 0))then{
		_sound_to_play = selectRandom low_civ_rating_sounds;
		low_civ_rating_sounds deleteAt(low_civ_rating_sounds find _sound_to_play);
		[_sound_to_play]remoteExec["playSound"];
		};
	if(ar_back > 50 && (count high_contraband_sounds != 0))then{
		_sound_to_play = selectRandom high_contraband_sounds;
		high_contraband_sounds deleteAt(high_contraband_sounds find _sound_to_play);
		[_sound_to_play]remoteExec["playSound"];
		};
	if(daytime > 19.75 && dayTime < 19.75 + dt && latch_0==0) then {
		//MAKE THIS AND ALL SAY3D REMOTE EXEC
		sleep 140;
		[speaker_1,["stalker_short",250,1]] remoteExec ["say3D"];
		//speaker_1 say3D ["stalker_short",250,1];
		latch_0 = 1;
	};
	// if(daytime > 22 && dayTime < 23) then {
	// 	//quest starts...
	// };
	if (daytime > 3 && dayTime < 4 && latch_7 == 0) then {
		civ_car_active = false;
		publicVariable "civ_car_active";
		execVM "final_assault.sqf";
		["skyfall"] remoteExec ["playSound"];
		latch_7 = 1;
	};
	//Check if we should finish the mission:
	if(dayTime > 6 && dayTime < 7 && civilian_rating >= 75) then{
		["goodend"]remoteExec["playSound"];
		sleep 30;
		["END1"] remoteExec ["endMission", 0, true]; // Arma 3
	};
	if(dayTime > 6 && dayTime < 7 && civilian_rating < 75) then{
		["badend"]remoteExec["playSound"];
		sleep 35;
		["LOSER"] remoteExec ["endMission", 0, true];
	};
	_time_since_start = _time_since_start + 60;
	hint format["Mission time: %1",_time_since_start];
	sleep 60;
};

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

	// if(daytime > 23 && dayTime < 23 + dt) then {
	// 	execVM "unit_spawn\spawn_attack_wave.sqf";
	// };
	// if(daytime > 0 && dayTime < 0 + dt) then {
		
	// 	execVM "vehicle_spawn\spawn_suicide_truck.sqf";
	// 	sleep 20;
	// 	execVM "unit_spawn\spawn_attack_wave.sqf";
	// };
	// if(daytime > 1 && dayTime < 1 + dt) then {
	// 	execVM "vehicle_spawn\spawn_attack_car_heavy.sqf";
	// 	sleep 15;
	// 	execVM "vehicle_spawn\spawn_attack_car_heavy.sqf";
	// 	sleep 15;
	// 	execVM "unit_spawn\spawn_attack_wave.sqf";
	// };
	// if(daytime > 2 && dayTime < 2 + dt) then {
	// 	execVM "vehicle_spawn\spawn_attack_car_heavy.sqf";
	// 	sleep 10;
	// 	execVM "vehicle_spawn\spawn_attack_car_heavy.sqf";
	// 	sleep 10;
	// 	execVM "vehicle_spawn\spawn_attack_car_random.sqf";
	// };