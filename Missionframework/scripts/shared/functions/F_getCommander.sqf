private [ "_commanderobj" ];

_commanderobj = objNull;

{ if ( typeOf _x == commander_classname ) exitWith { _commanderobj = _x }; } foreach allPlayers;

_commanderobj