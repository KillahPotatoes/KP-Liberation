params [ "_searchposition", "_distance"];

[ allPlayers, { alive _x && _x distance _searchposition < _distance } ] call BIS_fnc_conditionalSelect