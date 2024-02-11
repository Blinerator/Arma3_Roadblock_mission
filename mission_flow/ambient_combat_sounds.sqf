if (!isdedicated && hasInterface) then {

	waitUntil {!isNull player};
	waitUntil {player == player};
	//hint format ["%1",count _this];
	_source = _this select 0;//objective_pos_logic;// object/logic		
	_plays = true;
	AmB_nosound = false;
	_battle_radius = if (count _this >=1) then {(_this select 1)} else {350};
	hint format ["Battle radius %1",_battle_radius];
	while {_plays} do {
		_center = createCenter sideLogic;
		_group = createGroup _center;
		_logic = _group createUnit ["LOGIC",(getPos _source) , [], 0, ""];	
		sleep (1 + random 7);
		for "_s" from 1 to (1 + Ceil (random 2)) do {
			[_logic,_source,_battle_radius] spawn {	
				for "_s" from 1 to (random 7 + random 56) do {
					private ["_logic","_source","_radius","_allsounds"];
					_logic = _this select 0;
					_source = _this select 1;
					_radius = if ((_this select 2) > 100) then {(_this select 2)/25} else {(_this select 2)};
					_allsounds = [];
					_logic setPos (_logic modelToWorld [random _radius - Random _radius,random _radius - Random _radius,random 1 - Random 2]);
					private ["_sound","_sound1","_sound2","_maxtype"];
					_sound1 = format ["A3\Sounds_F\ambient\battlefield\battlefield_explosions%1.wss",floor (random 4)+1];
					_sound2 = format ["A3\Sounds_F\ambient\battlefield\battlefield_firefight%1.wss",floor (random 2)+2];
					if (!(surfaceIsWater getPos _logic)) then {_allsounds pushBack _sound2;} else {AmB_nosound = true};
					if (random 1 > .5 or (surfaceIsWater getPos _logic) or AmB_nosound) then {_allsounds pushBack _sound1;};
					_vol = switch (true) do {
						case (_logic distance player <= 250) : {.1};
						case (_logic distance player > 250 and _logic distance player <= 500) : {.5};
						case (_logic distance player > 500 and _logic distance player <= 800) : {1};
						case (_logic distance player > 800 and _logic distance player <= 1000) : {1.5};
						case (_logic distance player > 1000) : {2};
					};
					_maxtype = (count _allsounds);
					_sound = _allsounds select (floor random _maxtype);
					_pitch = if (_sound == _sound1) then {random .5 + .5} else {random .6 + .8};
					_volumn = if (_sound == _sound1) then {_vol + 1 + random 3} else {_vol + .1 + random 2};
					playsound3d [_sound,_logic,false,getPosasl _logic,_volumn,_pitch,0];
					sleep (random 1 + random 14);
				};
			};//spawn
			sleep (random 60 + random 60);
		};
		deleteVehicle _logic;
	};

};