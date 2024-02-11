_car_group = _this select 0;
_pass_pos = getMarkerPos "pass_pos";
_end_waypoint = group _car_group addWaypoint [_pass_pos,25];
_end_waypoint setWaypointStatements ["true",'
_vic = vehicle leader group this;
{deleteVehicle _x } forEach crew _vic;
deleteVehicle _vic;
'];

_cargo = weaponCargo _car_group;
hint format["%1",_cargo];
_has_ak = "rhs_weap_akm" in _cargo;
if(_has_ak) then {
	ar_back = ar_back + 25;
	civilian_rating = civilian_rating + 10;
	publicVariable "ar_back";
	publicVariable "civilian_rating";
};

if(civilian_rating<100) then{
	civilian_rating = civilian_rating + 1;
	publicVariable "civilian_rating";
};

cars_accepted = cars_accepted + 1;
publicVariable "cars_accepted";