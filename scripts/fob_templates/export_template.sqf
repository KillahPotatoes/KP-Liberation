{ diag_log format [ "[ ""%1"", [%2, %3, %4], %5 ],", 
typeof _x, 
[ (getpos _x select 0) - (getpos player select 0), 2 ] call BIS_fnc_cutDecimals, 
[ (getpos _x select 1) - (getpos player select 1), 2 ] call BIS_fnc_cutDecimals,
[ (getposatl _x select 2), 2 ] call BIS_fnc_cutDecimals, 
[ getdir _x , 2 ] call BIS_fnc_cutDecimals ] 
} foreach ( (nearestObjects [player, [ "Man" ], 50]) - ((nearestObjects [player, [ "Animal" ], 50]) + [player]));

{ diag_log format [ "[ ""%1"", [%2, %3, %4], %5 ],", 
typeof _x, 
[ (getpos _x select 0) - (getpos player select 0), 2 ] call BIS_fnc_cutDecimals, 
[ (getpos _x select 1) - (getpos player select 1), 2 ] call BIS_fnc_cutDecimals,
[ (getposatl _x select 2), 2 ] call BIS_fnc_cutDecimals, 
[ getdir _x , 2 ] call BIS_fnc_cutDecimals ] 
} foreach ( (nearestObjects [player, [ "All" ], 50]) - ((nearestObjects [player, [ "Man","Animal" ], 50]) + [player]));