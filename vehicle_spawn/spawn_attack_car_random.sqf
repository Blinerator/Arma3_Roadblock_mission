_enemy_group = ["LOP_ISTS_OPF_Infantry_TL", 
"LOP_ISTS_OPF_Infantry_AR_Asst", 
"LOP_ISTS_OPF_Infantry_Rifleman_7", 
"LOP_ISTS_OPF_Infantry_Rifleman_7", 
"LOP_ISTS_OPF_Infantry_Rifleman_6"];

_vehicles = ["LOP_ISTS_OPF_M998_D_4DR", 
"LOP_SYR_UAZ_Open",
"LOP_ISTS_OPF_Offroad"];

_pos = getMarkerPos "veh_spawn_1";
_stop_pos = getMarkerPos "stop_pos";

_car_name = selectRandom _vehicles;
_car = createVehicle [_car_name, _pos, [], 0, "NONE"];
_car setDir 225;
_grp = createGroup east;

{
	_x createUnit [getPos _car, _grp];
}forEach _enemy_group;
{
	_x moveInAny _car;
}forEach units _grp;

_wpnt = _grp addWaypoint[_stop_pos,10];
_wpnt setWaypointType "GETOUT";

_car forceSpeed 50;