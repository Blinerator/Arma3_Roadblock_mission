_cnt = 0;
sleep 80;
[50] execVM "spawn_flares.sqf";
while{_cnt<2} do{
	bm21 commandArtilleryFire [[6366.33,7180.3,0],currentMagazine BM21, 20];
	_cnt = _cnt + 1;
	sleep 10;
};
//Now spawn the paradrop helicopter:
_helo_drop_crew = ["LOP_SYR_Infantry_SL", 
"LOP_SYR_Infantry_TL", 
"LOP_SYR_Infantry_MG", 
"LOP_SYR_Infantry_AT", 
"LOP_SYR_Infantry_AT_Asst", 
"LOP_SYR_Infantry_Rifleman", 
"LOP_SYR_Infantry_Corpsman"];

_grp = createGroup EAST;
_marker_pos = getMarkerPos "helo_spawn";
_pos = [_marker_pos select 0, _marker_pos select 1, 200];
_helicopter = [_pos,0,"LOP_TKA_Mi8MTV3_FAB",_grp] call BIS_fnc_spawnVehicle;
_helo_obj = _helicopter select 0;
_drop_grp = createGroup EAST;

{_x createUnit[_marker_pos,_drop_grp];}forEach _helo_drop_crew;

{_x moveInAny _helo_obj;}forEach units _drop_grp;

_drop_wp = _grp addWaypoint[getMarkerPos "para_start",5];
_drop_wp setWaypointType "MOVE";
_drop_wp setWaypointStatements["true",'
_helo = vehicle leader group this;
[_helo] spawn rhs_fnc_infantryParadrop;
'];
_grp addWaypoint[getMarkerPos "para_stop", 5];
attack_wp = _grp addWaypoint[getMarkerPos "bomb_pos",5];
attack_wp setWaypointType "SAD";
sleep 30;
execVM "unit_spawn\spawn_attack_wave.sqf";
//spawn second one
sleep 40;
_grp = createGroup EAST;
_marker_pos = getMarkerPos "helo_spawn";
_pos = [_marker_pos select 0, _marker_pos select 1, 200];
_helicopter = [_pos,0,"LOP_TKA_Mi8MTV3_FAB",_grp] call BIS_fnc_spawnVehicle;
_helo_obj = _helicopter select 0;
_drop_grp = createGroup EAST;

{_x createUnit[_marker_pos,_drop_grp];}forEach _helo_drop_crew;

{_x moveInAny _helo_obj;}forEach units _drop_grp;

_drop_wp = _grp addWaypoint[getMarkerPos "para_start",5];
_drop_wp setWaypointType "MOVE";
_drop_wp setWaypointStatements["true",'
_helo = vehicle leader group this;
[_helo] spawn rhs_fnc_infantryParadrop;
'];
attack_wp = _grp addWaypoint[[15919.7,4759.87,0],5];
attack_wp setWaypointType "MOVE";

//spawn attack waves:
while{true} do{
	execVM "unit_spawn\spawn_attack_wave.sqf";
	sleep 60;
};