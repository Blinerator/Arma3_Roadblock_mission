//Put opening cinematic here:


if(1==0) then{
	5 fadeRadio 0;
	5 fadeSpeech 0;

	titlecut ["","black out",2];
	//5 fadeSound 0.1;
	sleep 3;
	_camera = "camera" camcreate [5592.49,7492.4,5];
	camUseNVG true;
	_camera cameraeffect ["internal", "back"];
	showcinemaBorder false;
	_camera camPrepareTarget cam3;
	_camera camPrepareFOV 0.740;
	_camera camCommitPrepared 0;
	_camera CamSetPos [5604.69,7486.43,5];
	_camera camCommitPrepared 15;
	titlecut["","BLACK IN",2];
	sleep 1;
	cutText ["<t color='#ffffff' size='5'>Four hours after radar site destruction...", "PLAIN", -1, true, true];
	sleep 5;
	playSound "intro";
	sleep 9;

	_camera CamSetPos [5572.5,7546.82,2];
	_camera camPrepareTarget cam4;
	_camera camCommitPrepared 0;
	_camera CamSetPos [5583.1,7521.81,2];
	_camera camCommitPrepared 30;
	sleep 10;

	_camera CamSetPos [7626.38,7791.2,20];
	_camera camPrepareTarget [7863.9,7806.48,10];
	_camera camCommitPrepared 0;
	_camera CamSetPos [7795.71,7814.69,10];
	_camera camCommitPrepared 60;
	sleep 20;

	_camera CamSetPos [6383.28,7252.63,0];
	_camera camPrepareTarget gate;
	titlecut ["","black out",2];
	sleep 2;
	_camera camCommitPrepared 0;
	_angle = 0;
	_camera camSetRelPos [35*cos(_angle),35*sin(_angle),2];
	_camera camCommit 0;
	camUseNVG false;
	titlecut["","BLACK IN",3];
	while {_angle < 100} do {
		_angle = _angle + 1;

		_camera camSetRelPos [35*cos(_angle),35*sin(_angle),2];
		_camera camCommit 0.25;
		sleep 0.25;
	};

	_camera CamSetPos [6358.32,7143.09,2];
	_camera camPrepareTarget cam6;
	_camera camCommitPrepared 0;
	_camera CamSetPos [6357.94,7224.85,2];
	_camera camCommitPrepared 60;
	sleep 10;

	_camera CamSetPos [6302.64,7115.92,30];
	_camera camPrepareTarget [6839.16,7518.3,2];
	_camera camCommitPrepared 0;
	_camera CamSetPos [6302.64,7115.92,0];
	_camera camCommitPrepared 60;
	sleep 10;
	[
		[
			["Objective: Hold the bridge through the night.", "<t align = 'left' shadow = '1' size = '1'>%1</t><br/>"],
			[" ", "<t align = 'left' shadow = '1' size = '1'>%1</t><br/>"],
			["Prevent contraband from getting through.", "<t align = 'left' shadow = '1' size = '1'>%1</t><br/>"],
			[" ", "<t align = 'left' shadow = '1' size = '1'>%1</t><br/>"],
			["Maintain flow of civilians.", "<t align = 'left' shadow = '1' size = '1'>%1</t><br/>"],
			[" ", "<t align = 'left' shadow = '1' size = '1'>%1</t><br/>"],
			["Use force if necessary.", "<t align = 'left' shadow = '1' size = '1'>%1</t><br/>"]
		]
	] spawn BIS_fnc_typeText;
	sleep 20;

	titlecut["","BLACK OUT",2];
	5 fadeRadio 1;
	5 fadeSpeech 1;
	sleep 5;
	_camera cameraEffect ["terminate", "back"];
	camDestroy _camera;
	titlecut["","BLACK IN",2];
};
execVM "callResource.sqf";
sleep 40;
if(1==1) then{
	sleep 5;
	hint parseText("<t color='#80BC2B'>Pass</t> allows vehicles through the checkpoint.  It improves 
			relations with the locals, but letting contraband through increases the chances of an 
			attack from the rear.");
	sleep 25;
	hint parseText "<t color='#fcc612'>Reject</t> orders the vehicle to return to the city. This will degrade
			relations with the locals, but decreases the chances of an attack from the rear.
			An unsuccessful rejection will only have the former effect.";
	sleep 25;
	hint parseText "<t color='#ff0000'>Apprehend</t> orders the person to surrender and enter custody. This
		greatly degrades relations with the locals, but almost completely reduces the chance of a rear attack.
		An unsuccessful detention will have only the former effect.";
	sleep 25;
	hint parseText "In order to successfully complete the mission, you must maintain over 75% positive relations.";
	sleep 15;
	hint parseText "Attacks from the rear are far stronger than from the front, and are well coordinated. They should be avoided at all cost.";
	sleep 15;
	playSound "tips_from_british_guy";
};

display_warning_message = false;
while{true} do{
	if(display_warning_message) then {
		hint "Keep the road clear!";
		display_warning_message = false;
		publicVariable "display_warning_message";
		sleep 1;
	};
};