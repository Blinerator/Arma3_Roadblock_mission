disableSerialization;

1 cutRsc ["H8erHUD","PLAIN"];

_name=name player;
_time=time;
waitUntil {!isNull (uiNameSpace getVariable "H8erHUD")};
	_display = uiNameSpace getVariable "H8erHUD";
		_setText = _display displayCtrl 1001;
			_setText ctrlSetStructuredText (parseText format ["Welcome %1!",_name]);
			_setText ctrlSetBackgroundColor [0.082, 0, 0.871,0.5];
	sleep 5;
	_setText ctrlSetStructuredText (parseText format ["This is the mission status bar."]);
	sleep 5;
	_setText ctrlSetStructuredText (parseText format ["This is the mission status bar.<br/>Keep civ. rating high and attack risk low."]);
	sleep 10;
	_setText ctrlSetStructuredText (parseText format ["Open the 'Briefings' tab on your map to<br/>view tutorial messages.  Good luck!"]);
	sleep 10;
	while {true} do{
		sleep 5;
					_setText ctrlSetStructuredText (parseText format ["Civ. Rating: %1 %<br/> Attack Risk (Rear | Front): %2 % | %3 %",round(civilian_rating),round(ar_back), round(ar_frnt)]);
					_setText ctrlSetBackgroundColor [0,0,0,0];
	};
	1 cutRsc ["default","PLAIN"];