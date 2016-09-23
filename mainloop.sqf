private ["_vehicles_civs","_vehicles_ins_weapons","_vehicles_ins_truck","_insurgents","_civilians","_veh_of_choice",
	"_weapons","_magazines","_numberOfCrewUnits","_numberofCargoUnits","_grp","_veh","_units","_chance",
	"_action","_bodyCount","_wait","_round","_ieds","_bomb","_eventInterval"];

_vehicles_civs = 
	["C_Offroad_01_F","C_Offroad_01_repair_F","C_Offroad_01_red_F","C_Offroad_01_sand_F",
	"C_Offroad_01_white_F","C_Offroad_01_blue_F","C_Offroad_01_darkred_F","C_Offroad_01_bluecustom_F",
	"C_Offroad_luxe_F","C_Offroad_default_F","C_Offroad_stripped_F","C_Hatchback_01_F",
	"C_Hatchback_01_grey_F","C_Hatchback_01_green_F","C_Hatchback_01_blue_F","C_Hatchback_01_bluecustom_F",
	"C_Hatchback_01_beigecustom_F","C_Hatchback_01_yellow_F","C_Hatchback_01_white_F","C_Hatchback_01_black_F",
	"C_Hatchback_01_dark_F","C_SUV_01_F","SUV_01_base_red_F","SUV_01_base_black_F","SUV_01_base_grey_F",
	"SUV_01_base_orange_F","C_Van_01_transport_F","C_Van_01_box_F","RHS_Ural_Civ_01","RHS_Ural_Civ_03",
	"RHS_Ural_Open_Civ_02","LOP_AFR_Civ_Landrover","LOP_AFR_Civ_Offroad","LOP_AFR_Civ_UAZ","LOP_AFR_Civ_UAZ_Open",
	"LOP_AFR_Civ_Ural","LOP_AFR_Civ_Ural_open"];
	
_vehicles_ins_weapons = 
	["O_G_Offroad_01_F","O_G_Offroad_01_armed_F","O_Truck_02_transport_F","O_G_Van_01_transport_F",
	"LOP_AM_Offroad_M2","LOP_AM_UAZ_DshKM","LOP_AM_UAZ_SPG","rhsgref_ins_g_gaz66_zu23",
	"LOP_AM_BTR60","LOP_ISTS_M1025_W_M2","LOP_ISTS_Offroad_M2","LOP_ISTS_T34",
	"LOP_ISTS_BMP1","rhsgref_brdm2_ins","rhsgref_brdm2_hq_ins"];
	
_vehicles_ins_truck = 
	["O_Truck_02_covered_F","O_Truck_02_transport_F","rhs_uaz_open_chdkz","rhs_ural_chdkz","C_Van_01_transport_F",
	"RHS_Ural_Civ_01","RHS_Ural_Civ_03","RHS_Ural_Open_Civ_02","LOP_AFR_Civ_Landrover","C_Truck_02_covered_F","C_Truck_02_transport_F",
	"LOP_AFR_Civ_Offroad","LOP_AFR_Civ_UAZ","LOP_AFR_Civ_UAZ_Open","LOP_AFR_Civ_Ural","LOP_AFR_Civ_Ural_open",
	"LOP_ISTS_BMP1","LOP_ISTS_M113_W","rhsgref_brdm2_ins","rhsgref_brdm2_hq_ins","rhs_gaz66_msv", "rhs_bmd1_chdkz",
	"rhs_bmd2_chdkz"];

_insurgents = ["O_G_engineer_F","O_G_medic_F","O_G_officer_F","O_G_Sharpshooter_F","O_G_Soldier_A_F",
	"O_G_Soldier_AR_F","O_G_Soldier_exp_F","O_G_Soldier_F","O_G_soldier_GL_F","O_G_Soldier_LAT_F",
	"O_G_Soldier_lite_f","O_G_Soldier_M_F","O_G_Soldier_SL_F","O_G_Soldier_TL_F","rhs_g_Soldier_F",
	"rhs_g_Soldier_AR_F","rhs_g_medic_F","LOP_ISTS_Infantry_TL","LOP_ISTS_Infantry_SL","LOP_ISTS_Infantry_Corpsman",
	"LOP_ISTS_Infantry_AR","LOP_ISTS_Infantry_AR_Asst","LOP_ISTS_Infantry_AT","LOP_ISTS_Infantry_AT_Asst",
	"LOP_ISTS_Infantry_Marksman","LOP_ISTS_Infantry_Engineer","LOP_ISTS_Infantry_Rifleman","LOP_ISTS_Infantry_Rifleman_2",
	"LOP_ISTS_Infantry_Rifleman_3","LOP_AM_Infantry_TL","LOP_AM_Infantry_SL","LOP_AM_Infantry_Corpsman",
	"LOP_AM_Infantry_AR","LOP_AM_Infantry_AR_Asst","LOP_AM_Infantry_AT","LOP_AM_Infantry_Marksman","LOP_AM_Infantry_Engineer",
	"LOP_AM_Infantry_Rifleman","LOP_AM_Infantry_Rifleman_2","LOP_AM_Infantry_Rifleman_3"];
	
_civilians = ["C_man_polo_1_F","C_man_polo_2_F","C_man_polo_3_F","C_man_polo_4_F","C_man_polo_5_F","C_man_polo_6_F",
	"C_man_p_fugitive_F","C_man_p_beggar_F","C_man_p_shorts_1_F","C_man_shorts_1_F","C_man_shorts_2_F","C_man_shorts_3_F",
	"C_man_shorts_4_F","C_journalist_F","LOP_CHR_Civ_Villager_01","LOP_CHR_Civ_Woodlander_01","LOP_CHR_Civ_Worker_01",
	"LOP_CHR_Civ_Profiteer_01","LOP_Tak_Civ_Man_01","LOP_Tak_Civ_Man_02","LOP_Tak_Civ_Man_04"];

_weapons = ["arifle_TRG21_F","rhs_weap_aks74u","rhs_weap_m590_5rd","rhs_weap_akms","rhs_weap_pkm","rhs_weap_makarov_pmm","rhs_weap_rpg7","rhs_weap_akm"];
_magazines = ["30Rnd_556x45_Stanag","HandGrenade","9Rnd_45ACP_Mag","SmokeShell","rhs_30rnd_762x39mm"];
_ieds = ["SatchelCharge_Remote_Mag","DemoCharge_Remote_Mag","IEDUrbanBig_Remote_Mag","IEDLandBig_Remote_Mag","IEDUrbanSmall_Remote_Mag","IEDLandSmall_Remote_Mag"];

// set our eventInterval as per mission parameters
_eventInterval = "EventInterval" call BIS_fnc_getParamValue;

	
// if we're on low-intensity mode then revise the lists of stuff
if ( ( "LowIntensity" call BIS_fnc_getParamValue ) == 1 ) then {

	if (debug == 1) then { hint "low-intensity enabled" };

	_insurgents = ["O_G_engineer_F","O_G_medic_F","O_G_officer_F","O_G_Soldier_A_F","LOP_AM_Infantry_Rifleman",
	"LOP_AM_Infantry_Rifleman_2","LOP_AM_Infantry_Rifleman_3","LOP_ISTS_Infantry_Rifleman","LOP_ISTS_Infantry_Rifleman_2",
	"LOP_ISTS_Infantry_Rifleman_3","LOP_AM_Infantry_TL","LOP_AM_Infantry_SL"];
	_vehicles_ins_weapons = 
	["O_G_Offroad_01_F","LOP_AM_UAZ_DshKM","LOP_AM_UAZ_SPG"];
	_vehicles_ins_truck = 
	["rhs_uaz_open_chdkz","LOP_AFR_Civ_Landrover","LOP_AFR_Civ_Offroad","LOP_AFR_Civ_UAZ","LOP_AFR_Civ_UAZ_Open"];
};

// The main loop
_round = 1;

while { _round != rounds } do {

	_chance = 0;
	_rnd_action = 0;

	_chance = ceil random 3;
	
	if ( _chance == 2 ) then {
		_veh_of_choice = _vehicles_civs call bis_fnc_selectRandom;
		_veh = _veh_of_choice createVehicle (getMarkerPos "start");
		_numberofCargoUnits = _veh emptyPositions "cargo";
		_bodyCount = ceil random _numberofCargoUnits;
		_units = [_civilians,_bodyCount] call sl_fnc_compileGroup;
		_grp = [getPos _veh, civilian,_units] call BIS_fnc_spawnGroup;
		_grp addVehicle _veh;
		{ [_x] orderGetIn true; } forEach units _grp;
		null = [_grp,"MOVE"] call sl_fnc_createWaypoints;
	};

	if ( _chance != 2 ) then {

		_rnd_action =  ceil random 4;
		// no carbombs for low-intensity
		if( ( "LowIntensity" call BIS_fnc_getParamValue ) == 1 ) then {
			_rnd_action = ceil random 3;
		};

		// event : truck of badguys race through or unload and attack the checkpoint
		if ( _rnd_action == 1 ) then {
			_action = ["RACE","UNLOAD","UNLOAD"];
			_veh_of_choice = _vehicles_ins_truck call bis_fnc_selectRandom;
			_veh = _veh_of_choice createVehicle (getMarkerPos "start");
			_numberOfCargoUnits = _veh emptyPositions "cargo";
			_units = [_insurgents,_numberOfCargoUnits] call sl_fnc_compileGroup;
		};

		// event : armedvehicle of badguys race through or attack the checkpoint
		if ( _rnd_action == 2 ) then {
			_action = ["ATTACK","ATTACK","RACE"];
			_veh_of_choice = _vehicles_ins_weapons call bis_fnc_selectRandom;
			_veh = _veh_of_choice createVehicle (getMarkerPos "start");
			_numberOfCrewUnits = count ( [ _veh, grpnull, true, typeof _veh ] call BIS_fnc_spawnCrew );
			_units = [_insurgents,_numberOfCrewUnits] call sl_fnc_compileGroup;
		};

		// event : civilian vehicle attempts smuggle arms through
		if ( _rnd_action == 3 ) then {
			_action = ["MOVE"];
			_veh_of_choice = _vehicles_civs call bis_fnc_selectRandom;
			_veh = _veh_of_choice createVehicle (getMarkerPos "start");
			_numberofCargoUnits = _veh emptyPositions "cargo";
			_units = [_civilians,_numberofCargoUnits] call sl_fnc_compileGroup;

			{ _veh addWeaponCargoGlobal [_x, (ceil random 5)] } forEach ( [_weapons,(ceil random 5)] call sl_fnc_compileGroup );
			{ _veh addMagazineCargoGlobal [_x, (ceil random 5)] } forEach ( [_magazines,(ceil random 5)] call sl_fnc_compileGroup );

		};

		// event : carbomb
		if ( _rnd_action == 4 ) then {
			_action = ["RACE"];
			_veh_of_choice = _vehicles_civs call bis_fnc_selectRandom;
			_veh = _veh_of_choice createVehicle (getMarkerPos "start");
			_numberofCargoUnits = _veh emptyPositions "cargo";
			_units = [_civilians,_numberofCargoUnits] call sl_fnc_compileGroup;

			_veh allowCrewInImmobile true;
			_bomb = _ieds call bis_fnc_selectRandom;
			_veh addMagazineCargoGlobal [_bomb, 1];
			null = [_veh,"spot"] execVM "carbomb.sqf";

		};

		// spawns our group of either opfor or civilian side (for smuggle),
		if ( _rnd_action == 3 ) then {
			_grp = [getPos _veh, civilian,_units] call BIS_fnc_spawnGroup;
		} else {
			_grp = [getPos _veh, EAST,_units] call BIS_fnc_spawnGroup;
		};
		// spawns and orders our group in
		_grp addVehicle _veh;
		{ [_x] orderGetIn true; } forEach units _grp;
		// gives our group one of set of waypoints , see functions.sqf
		null = [_grp,(_action call bis_fnc_selectRandom)] call sl_fnc_createWaypoints;

	};

	// sets wait period for about event interval time
	_wait = (_eventInterval - 10 + (random 20));

	if (debug == 1) then {
		hintSilent format["Chance: %1; Action: %2; Wait: %3; Round: %4/%5; Vehicle: %6;",_chance,_rnd_action,_wait,_round,rounds,_veh_of_choice];
		diag_log format["Chance: %1; Action: %2; Wait: %3; Round: %4/%5; Vehicle: %6;",_chance,_rnd_action,_wait,_round,rounds,_veh_of_choice];
		pvHint = format["Chance: %1; Action: %2; Wait: %3; Round: %4/%5; Vehicle: %6;",_chance,_rnd_action,_wait,_round,rounds,_veh_of_choice];
		publicVariable "pvHint";
	};

	// waits, increments roundnumber, and resets our event selectors
	sleep _wait;
	_round = _round + 1;
	_chance = 0;
	_rnd_action = 0;

};

sleep 120;

RBD_DONE = 1;
publicVariable "RBD_DONE";
OBJ_REEZO_ROADBLOCKDUTY setTaskState "SUCCEEDED";
null = ["TaskSucceeded",["Roadblock Duty"]] call bis_fnc_showNotification;
sleep 10;
"end1" call BIS_fnc_endMission;