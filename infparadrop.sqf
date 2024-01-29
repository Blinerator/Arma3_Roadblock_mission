//params["_v"];
_v = _this select 0;
hint format["%1",_v];
private _cargo = assignedCargo _v;
private _delay =  (1/(((speed _v) max 55)/150));

if(not(local _v))exitWith{};
{
	// perform action only for cargo
	_x disableAI "MOVE";
	_x disableCollisionWith _v;
	moveout _x;
	unassignVehicle _x;
	[_x] allowGetIn false;
	_x setDir (getDir _v);

	sleep _delay;

	//if units don't have a parachute type backpack then create parachute for him
	private _type = getText (configFile >> "cfgVehicles" >> backpack _x >> "ParachuteClass");
	if( not(_type isKindOf "ParachuteBase") )then
	{
		_para = "CUP_T10_Parachute" createVehicle [0,0,0];
		_para setPosASL (getPosASLVisual _x);
		_para setVectorDirAndUp [vectorDirVisual _x,vectorUpVisual _x];
		if(! local _x)then{[_x,_para] remoteExecCall ["moveInDriver",_x]}else{_x moveInDriver _para;};
		_x assignAsDriver _para;
		[_x] allowGetIn true;
		[_x] orderGetIn true;
	};
	_x enableAI "MOVE";
}foreach _cargo;

{
	(group _x) leaveVehicle _v;
	_x enableCollisionWith _v;
}foreach _cargo;
