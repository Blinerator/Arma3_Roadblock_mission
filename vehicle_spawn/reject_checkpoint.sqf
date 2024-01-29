_car_group = _this select 0;
_pos1 = getMarkerPos "reject_1";
_pos2 = getMarkerPos "reject_2";
sleep 2;
group _car_group addWaypoint [_pos1,5];
_end_waypoint = group _car_group addWaypoint [_pos2,25];
_end_waypoint setWaypointStatements ["true",'
_vic = vehicle leader group this;
{deleteVehicle _x } forEach crew _vic;
deleteVehicle _vic;
'];