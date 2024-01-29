if(checkpoint_is_clear) then {
	_vehicles = ["C_Van_01_transport_F", 
	"C_Van_01_box_F", 
	"RHS_Ural_Civ_01",
	"LOP_AFR_Civ_UAZ_Open", 
	"LOP_AFR_Civ_UAZ", 
	"LOP_AFR_Civ_Offroad", 
	"C_Offroad_02_unarmed_F",
	"C_Truck_02_transport_F", 
	"C_Truck_02_box_F", 
	"C_Truck_02_fuel_F", 
	"C_Truck_02_covered_F", 
	"C_Van_02_medevac_F", 
	"C_Van_02_vehicle_F", 
	"C_Quadbike_01_F", 
	"C_Offroad_01_covered_F", 
	"C_Hatchback_01_F", 
	"C_Van_01_fuel_F", 
	"I_E_Offroad_01_comms_F",
	"C_IDAP_Truck_02_water_F"];

	_pos = getMarkerPos "veh_spawn_1";
	_bunker_pos = getMarkerPos "stop_pos";
	_pos_heavy = getMarkerPos "stop_pos_heavy";

	_car_name = selectRandom _vehicles;
	//_vehicles deleteAt (_vehicles find _car_name);

	_car = createVehicle [_car_name, _pos, [], 0, "NONE"];
	_car setDir 225;
	createVehicleCrew _car;
	random_num = random 4;
	if(random_num > 2.5) then{
		_car addItemCargoGlobal ["rhs_weap_akm",1];
	};


	_grp = group _car;
	_grp setBehaviour "CARELESS";

	_car forceSpeed 25;
	if(_car_name == "RHS_Ural_Civ_01" || _car_name == "RHS_Ural_Civ_03" || _car_name == "RHS_Ural_Civ_02" || _car_name == "RHS_Ural_Open_Civ_03") then{
		_grp addWaypoint[_pos_heavy, 0.1];
	}
	else{
		_grp addWaypoint[_bunker_pos,1];
	};

	_actParams = ["<t color='#80BC2B'>Pass</t>", "vehicle_spawn\pass_checkpoint.sqf",null,1.5,true,false,"","true",35,false,"",""]; 
	[_car, _actParams] remoteExec ["addAction", 0, true];

	_actParams = ["<t color='#FF0000'>Reject</t>", "vehicle_spawn\reject_checkpoint.sqf",null,1.5,true,false,"","true",35,false,"",""]; 
	[_car, _actParams] remoteExec ["addAction", 0, true];
}
else{
	{
		systemChat "Area not clear.  Aborting vehicle spawn.";
	};
	display_warning_message = true;
	publicVariable "display_warning_message";
};