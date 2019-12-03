/*
    File: fn_swapInventory.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-12-03
    Last Update: 2019-12-03
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        No description added yet.

    Parameter(s):
        _localVariable - Description [DATATYPE, defaults to DEFAULTVALUE]

    Returns:
        Function reached the end [BOOL]
*/
// TODO
params [ "_unit1", "_unit2" ];
private [ "_loadout" ];

_loadout = [_unit1, ["repetitive"]] call KPLIB_fnc_getLoadout;
[ _unit2, _loadout ] call KPLIB_fnc_setLoadout;
