//rear_vic_attack_spawn
//rear_unit_attack_spawn
_enemy_squad = ["LOP_ISTS_OPF_Infantry_SL", 
"LOP_ISTS_OPF_Infantry_Rifleman_3", 
"LOP_ISTS_OPF_Infantry_AT", 
"LOP_ISTS_OPF_Infantry_Rifleman_5", 
"LOP_ISTS_OPF_Infantry_GL", 
"LOP_ISTS_OPF_Infantry_Corpsman", 
"LOP_ISTS_OPF_Infantry_Marksman"];

_enemy_group_car = ["LOP_ISTS_OPF_Infantry_TL", 
"LOP_ISTS_OPF_Infantry_AR_Asst"];

_vehicles = ["LOP_ISTS_OPF_Offroad_M2"];

_pos = getMarkerPos "rear_vic_attack_spawn";
_stop_pos = getMarkerPos "bomb_pos";
_spawn_pos_1 = getMarkerPos "rear_unit_attack_spawn";
_end_pos = getMarkerPos "bomb_pos";

_cnt = 0;
while{_cnt<3}do{
	_car_name = selectRandom _vehicles;
	_car = createVehicle [_car_name, _pos, [], 0, "NONE"];
	_grp = createGroup east;

	{
		_x createUnit [getPos _car, _grp];
	}forEach _enemy_group_car;
	{
		_x moveInAny _car;
	}forEach units _grp;

	_wpnt = _grp addWaypoint[_stop_pos,10];

	_car forceSpeed 50;

	_grp_1 = createGroup east;
	{
		_x createUnit [_spawn_pos_1,_grp_1];
	}forEach _enemy_squad;

	_grp_1 addWaypoint[_end_pos,1];
	sleep 30;
	_cnt = _cnt + 1;
};