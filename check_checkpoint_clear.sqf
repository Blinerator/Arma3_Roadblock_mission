_center = getMarkerPos "stop_pos";
checkpoint_is_clear = true;
while{true}do{
	_objects = nearestObjects [_center,["Car","Truck"],25];

	if(count _objects > 0) then {checkpoint_is_clear = false;}
	else{checkpoint_is_clear = true;};
	
	publicVariable "checkpoint_is_clear";
	sleep 1;
};