// By Sacha Ligthert <sacha@lowtac.nl> some modifications by Soapy of ACEGoons


// Nerf equipment
player disableNVGEquipment true;
player disableTIEquipment true;

// TFR settings, really... Short range is fine
tf_no_auto_long_range_radio = true;
TF_give_personal_radio_to_regular_soldier = true;

// Kit up!
player addItem "ACE_Flashlight_XL50";

// Start player with earplugs in
player setVariable ["ACE_hasEarPlugsIn", true, true];


// Start with gun down (prevents friendly fire at mission start)
player switchMove "AmovPercMstpSrasWrflDnon_AmovPercMstpSlowWrflDnon";


// Remove NVG
player unassignItem "NVGoggles";
player removeItem "NVGoggles";


// Swap IR for Flashlight
player removePrimaryWeaponItem "acc_pointer_IR";
player addPrimaryWeaponItem "acc_flashlight";

// Enable Murshun Easy Way Out
murshun_easywayout_canSuicide = true;

// Scenario logic
RBD_CLEAR = 0;
pvHint = "";
RBD_DONE = 1;

// Next gen shit: self interact menu
_action = ["RBD_AUTH", "Checkpoint Authorized", "", {null = execVM "roadblock_clear.sqf";}, {alive player}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToObject;

// Debug hints
"pvHint" addPublicVariableEventHandler { hint format ["%1", _this select 0]; };
"RBD_DONE" addPublicVariableEventHandler { OBJ_REEZO_ROADBLOCKDUTY setTaskState "SUCCEEDED"; null = ["TaskSucceeded",["Roadblock Duty"]] call bis_fnc_showNotification; };

// Final piece of flair
[str ("Roadblock Duty") ,  str(date select 1) + "." + str(date select 2) + "." + str(date select 0), str("1 km South of Sakhe")] spawn BIS_fnc_infoText;


// Briefing + Task
player createDiaryRecord ["Diary", ["Credits", "<br />Created by Reezo of SR5 Tactical<br /><br />March 8th, 2011<br /><br /><br /><br />Ported to A3 by Sacha Ligthert of Lowlands Tactical"]];
player createDiaryRecord ["Diary", ["Mission", "<br />Allied forces are pushing to gain control of some towns in Southern Takistan. The civilian population is probably going to flee using the <marker name='start'>Sar-e Sang Pass</marker>.<br /><br />Your job is to prevent insurgent forces and other enemy personnel leave the area and infiltrate the settlements North of your position."]];

OBJ_REEZO_ROADBLOCKDUTY = player createSimpleTask ["Guard the roadblock"];
OBJ_REEZO_ROADBLOCKDUTY setSimpleTaskDescription ["<br />Your fire team is assigned to watch a <marker name='spot'>remote checkpoint</marker> in order to keep insurgents from leaving town.","Guard the roadblock","Guard the roadblock"];
player setCurrentTask OBJ_REEZO_ROADBLOCKDUTY;