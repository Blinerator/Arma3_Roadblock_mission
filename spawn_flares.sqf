_num_to_spawn = _this select 0;

_spawn_pos = getMarkerPos "flare_pos";

_cnt = 0;

while{_cnt<_num_to_spawn} do {
	_flare = createVehicle["F_40mm_Red", _spawn_pos];
	_randx = random[-100,0,100];
	_randy = random[-100,0,100];
	_x = getPos _flare select 0;
	_y = getPos _flare select 1;
	_flare setPos [_x + _randx, _y + _randy, 150+random(50)];
	_cnt = _cnt + 1;
	_flare setVelocity [0,0,-0.1];
	sleep (5+random(10));
};