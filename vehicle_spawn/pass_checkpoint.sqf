_car_group = _this select 0;
_pass_pos = getMarkerPos "pass_pos";
_end_waypoint = group _car_group addWaypoint [_pass_pos,25];
_end_waypoint setWaypointStatements ["true",'
_vic = vehicle leader group this;
{deleteVehicle _x } forEach crew _vic;
deleteVehicle _vic;
'];