_enemy_group = ["LOP_ISTS_OPF_Infantry_TL", 
"LOP_ISTS_OPF_Infantry_AR_Asst"];

_vehicles = ["LOP_TKA_UAZ_DshKM", 
"LOP_AFR_OPF_Offroad_M2",
"LOP_TKA_BTR60"];

_pos = getMarkerPos "veh_spawn_attack";
_stop_pos = getMarkerPos "bomb_pos";

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

_car forceSpeed 50;