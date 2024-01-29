display_warning_message = false;
civ_car_active = true;
time_multiplier = 7;
publicVariable "time_multiplier";
while{civ_car_active} do {
	setTimeMultiplier time_multiplier;
	execVM "vehicle_spawn\spawn_civilian_car_random.sqf";
	sleep random[40,45,50];
};
setTimeMultiplier 1;