// A simple carbomb script by Sacha Ligthert <sacha@lowtac.nl>

if (!isServer) exitWith{};

_veh = _this select 0;
_tgt = _this select 1;


waitUntil { count (crew _veh) >= 1 };

sleep 30;

waitUntil { (!canMove _veh) or (!alive driver _veh) or ((_veh distance (getMarkerPos "spot")) <= 5) };


if ( (!canMove _veh) or (_veh distance (getMarkerPos "spot") <= 5 ) ) then {
	_veh setDamage 1;
	"R_80mm_HE" createVehicle (getPos _veh);
};