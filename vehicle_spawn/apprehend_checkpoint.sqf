_car_group = _this select 0;
_driver = leader _car_group;
_cargo = weaponCargo _car_group;
hint format["%1",_cargo];
_has_ak = "rhs_weap_akm" in _cargo;
//Two options: get out, or get out and become hostile.
if(random 1 < 0.51) then {//HOSTILE
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
		civilian_rating = civilian_rating - 15;
		publicVariable "civilian_rating";
	};
	if(ar_frnt < 100)then{
		ar_frnt = ar_frnt + 25;
		publicVariable "ar_frnt";
	};
	if(!_has_ak) then {
		civilian_rating = civilian_rating - 5;
		ar_frnt = ar_frnt + 10;
		publicVariable "ar_frnt";
		publicVariable "civilian_rating";
	};
}
else{//COMPLY
	_dismount = group _car_group addWaypoint [getPos _driver,5];
	_dismount setWaypointType "GETOUT";
	sleep 1;
	_driver switchMove "AmovPercMstpSsurWnonDnon";
 	_driver setVelocity [0,0,0]; 
 	sleep 0.01; 
 	_driver disableAI "ANIM";

	if(civilian_rating > 0)then{
		civilian_rating = civilian_rating - 10;
		publicVariable "civilian_rating";
	};
	if(ar_frnt < 100)then{
		ar_frnt = ar_frnt + 10;
		publicVariable "ar_frnt";
	};
	if(ar_back > 0)then{
		ar_back = ar_back - 50;
		publicVariable "ar_back";
	};
	if(!_has_ak) then {
		civilian_rating = civilian_rating - 2.5;
		ar_frnt = ar_frnt + 5;
		publicVariable "ar_frnt";
		publicVariable "civilian_rating";
	};
};

cars_apprehended = cars_apprehended + 1;
publicVariable "cars_apprehended";