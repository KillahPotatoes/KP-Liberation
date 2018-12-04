private [ "_commanderobj" ];

_commanderobj = objNull;

if (!isNil "commandant") then {
	{ if ( _x == commandant ) exitWith { _commanderobj = _x }; } foreach allPlayers;
};

_commanderobj