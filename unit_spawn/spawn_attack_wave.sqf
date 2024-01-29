_enemy_squad = ["LOP_SYR_Infantry_SL", 
"LOP_SYR_Infantry_TL", 
"LOP_SYR_Infantry_MG", 
"LOP_SYR_Infantry_AT", 
"LOP_SYR_Infantry_AT_Asst", 
"LOP_SYR_Infantry_Corpsman", 
"LOP_SYR_Infantry_Rifleman"];

_spawn_pos_1 = getMarkerPos "unit_attack_spawn_1";
_spawn_pos_2 = getMarkerPos "unit_attack_spawn_2";
_end_pos = getMarkerPos "bomb_pos";

_grp_1 = createGroup east;
{
	_x createUnit [_spawn_pos_1,_grp_1];
}forEach _enemy_squad;

_grp_2 = createGroup east;
{
	_x createUnit [_spawn_pos_2,_grp_2];
}forEach _enemy_squad;

_grp_1 addWaypoint[_end_pos,1];
_grp_2 addWaypoint[_end_pos,1];