_pos = getMarkerPos "veh_spawn_1";
_bunker_pos = getMarkerPos "bomb_pos";
_truck = createVehicle ["rhs_kraz255b1_fuel_msv", _pos, [], 0, "NONE"];

createVehicleCrew _truck;
_grp = group _truck;
_grp setBehaviour "CARELESS";
_grp setSpeedMode "FULL";
_grp addWaypoint[_bunker_pos,1];
_truck say3D ["god_syria_bashar",150,1];

_sleeptime = 0.25;
time_since_spawn = 0;

while{time_since_spawn < 55} do {
	if((getPos _truck distance getPos bunker)<25) then {
		"Bo_GBU12_LGB" createVehicle (getPos _truck);
		"Bo_GBU12_LGB" createVehicle (getPos _truck);
		_truck setDamage 1;
		break;
	};
	if(!alive _truck) then {
		"Bo_GBU12_LGB" createVehicle (getPos _truck);
		break;
	};
	_driver = (units _grp) select 0;
	if(!alive _driver) then {
		"Bo_GBU12_LGB" createVehicle (getPos _truck);
		_truck setDamage 1;
		break;
	};
	time_since_spawn = time_since_spawn + _sleeptime;
	sleep _sleeptime;
};

//If still alive after a minute, BLAST IT!
if(alive _truck) then {
	"Bo_GBU12_LGB" createVehicle (getPos _truck);
	_truck setDamage 1;
};