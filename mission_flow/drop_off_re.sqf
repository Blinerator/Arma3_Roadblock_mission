_vic = "LOP_AA_M1025_D";
_car = createVehicle [_vic, [5433.4,7845.53,0], [], 0, "NONE"];
_car setDir 155;
_grp = createGroup west;
_driver = "LOP_AA_Infantry_Rifleman";
_driver createUnit [getPos _car, _grp];
_grp setBehaviour "CARELESS";
{
	_x moveInAny _car;
}forEach units _grp;

_grp addWaypoint [getPos medic_respawn,5];

_run = true;
while{_run} do {
if(count(crew _car)>1)then{
	sleep 2;
	_drp = getMarkerPos "re_dropoff";
	_wpnt = _grp addWaypoint[_drp,5];
	_wpnt setWaypointType "TR UNLOAD";
	_wpnt2 = _grp addWaypoint [getPos medic_respawn,5];
	_wpnt2 setWaypointStatements ["true",'
	_vic = vehicle leader group this;
	{deleteVehicle _x } forEach crew _vic;
	deleteVehicle _vic;
	'];

	_run = false;
};
};
