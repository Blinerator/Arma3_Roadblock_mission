deleteVehicle arabic_radio;
[ "collect_battery_task", "SUCCEEDED" ] call BIS_fnc_taskSetState;

_actParams = ["<t color='#80BC2B'>Insert Battery</t>", "play_old_money.sqf",null,1.5,true,false,"","true",35,false,"",""]; 
[com_terminal, _actParams] remoteExec ["addAction", 0, true];


execVM "turn_civilians.sqf";