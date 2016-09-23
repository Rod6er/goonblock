/* ammoScript by Sacha Ligthert <sacha@lowtac.nl>

Goals of this script is to empty an ammobox or a vehicle with custom gear

Put the following line in the init of the ammobox or vehicle you wish to setup
 null = [this] execVM "ammobox.sqf";

*/

if (!isServer) exitWith {};

private ["_ammobox","_weapons","_magazines","_items"];
_ammobox = _this select 0;

clearWeaponCargoGlobal _ammobox;
clearMagazineCargoGlobal _ammobox;
clearItemCargoGlobal _ammobox;
clearBackpackCargoGlobal _ammobox;

_weapons = [["launch_NLAW_F",5],["ACE_fieldDressing",24],["ACE_morphine",12],["ACE_epinephrine",12],["ACE_bloodIV",6]];
_magazines = [["3Rnd_UGL_FlareWhite_F",50],["30Rnd_65x39_caseless_mag",50],["100Rnd_65x39_caseless_mag",30],["1Rnd_Smoke_Grenade_shell",10],["1Rnd_HE_Grenade_shell",10],["HandGrenade",24],["SmokeShell",24],["SmokeShellGreen",24],["Chemlight_green",10],["Chemlight_red",10],["Chemlight_yellow",10],["Chemlight_blue",10]];
_items = [["ACE_CableTie",20]];


{
	_ammobox addWeaponCargoGlobal [_x select 0, _x select 1];
} forEach _weapons;

{
	_ammobox addMagazineCargoGlobal [_x select 0, _x select 1];
} forEach _magazines;

{
	_ammobox addItemCargoGlobal [_x select 0, _x select 1];
} forEach _items;
