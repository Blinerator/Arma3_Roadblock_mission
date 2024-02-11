[speaker_2,["old_money",250]] remoteExec ["say3D"];
[speaker_2] remoteExec ["removeAllActions"];
execVM "vehicle_spawn\spawn_periodic_civilian_cars.sqf";
sleep 14;//675;
_pos = getPos speaker_2;
deleteVehicle speaker_2;
speaker_3 setPos _pos;
