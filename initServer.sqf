cars_rejected = 0;
cars_apprehended = 0;
cars_accepted = 0;
contraband = 0;

civilian_rating = 100;
ar_frnt = 0;
ar_back = 0;
stop_pos_1_clear = true;
publicVariable "stop_pos_1_clear";
publicVariable "cars_rejected";
publicVariable "cars_apprehended";
publicVariable "cars_accepted";
publicVariable "civilian_rating";
publicVariable "contraband";
publicVariable "ar_frnt";
publicVariable "ar_back";
execVM "main_loop.sqf";
execVM "mission_flow\update_ratings.sqf";
execVM "mission_flow\check_ratings_in_bounds.sqf";
[getMarkerPos "artillery_marker_ambient", "Sh_155mm_AMOS", 300, 240, [0,30]] spawn BIS_fnc_fireSupportVirtual;

//Check for civ kills:
addMissionEventHandler ["EntityKilled",{

		params ["_killed", "_killer", "_instigator"];

		if (side group _killed isequalTo civilian) then{
			civilian_rating = civilian_rating - 10;
			publicVariable "civilian_rating";
			};


}];