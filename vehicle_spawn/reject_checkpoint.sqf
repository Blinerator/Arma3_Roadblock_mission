_car_group = _this select 0;
_driver = leader _car_group;
_cargo = weaponCargo _car_group;
hint format["%1",_cargo];
_has_ak = "rhs_weap_akm" in _cargo;
//Two options: drive away, or get out and become hostile.
if(random 1 < 0.33333) then {//HOSTILE
	_driver addWeaponGlobal "rhs_weap_ak74";
	_driver addMagazineGlobal "rhs_30Rnd_545x39_AK";
	_driver addMagazineGlobal "rhs_30Rnd_545x39_AK";
	_dismount = group _car_group addWaypoint [getPos _driver,5];
	_dismount setWaypointType "GETOUT";
	sleep 1;
	private _eastGroup = createGroup east;
	[_driver] joinSilent _eastGroup;
	_eastGroup setBehaviour "COMBAT";
	if(civilian_rating > 0)then{
		civilian_rating = civilian_rating - 1;
		publicVariable "civilian_rating";
	};
	if(ar_frnt < 100)then{
		ar_frnt = ar_frnt + 5;
		publicVariable "ar_frnt";
	};
	if(!_has_ak) then {
		civilian_rating = civilian_rating - 2.5;
		ar_frnt = ar_frnt + 5;
		publicVariable "ar_frnt";
		publicVariable "civilian_rating";
	};
}
else{//DRIVE AWAY
	_pos1 = getMarkerPos "reject_1";
	_pos2 = getMarkerPos "reject_2";
	sleep 2;
	group _car_group addWaypoint [_pos1,1];
	_end_waypoint = group _car_group addWaypoint [_pos2,1];
	_end_waypoint setWaypointStatements ["true",'
	_vic = vehicle leader group this;
	{deleteVehicle _x } forEach crew _vic;
	deleteVehicle _vic;
	'];


	//Civilians upset if wrongly rejected
	if(!_has_ak) then {
		civilian_rating = civilian_rating - 1;
		ar_frnt = ar_frnt + 1;
		publicVariable "ar_frnt";
		publicVariable "civilian_rating";
	};
	if(civilian_rating > 0)then{
		civilian_rating = civilian_rating - 1;
		publicVariable "civilian_rating";
	};
	if(ar_frnt < 100)then{
		ar_frnt = ar_frnt + 1;
		publicVariable "ar_frnt";
	};
};

cars_rejected = cars_rejected + 1;
publicVariable "cars_rejected";