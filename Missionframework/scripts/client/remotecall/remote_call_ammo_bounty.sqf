if ( isDedicated ) exitWith {};

params [ "_classname", "_bounty", "_killer" ];
private [ "_vehiclename", "_playername" ];

_vehiclename =  getText ( configFile >> "cfgVehicles" >> _classname >> "displayName" );
_playername = "";
if(count (squadParams _killer) != 0) then {
	_playername = "[" + ((squadParams _killer select 0) select 0) + "] ";
};
_playername = _playername + name _killer;

gamelogic globalChat (format [ localize "STR_BOUNTY_MESSAGE",  _bounty, _vehiclename, _playername ] );