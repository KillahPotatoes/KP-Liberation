/*
    KPLIB_fnc_persistence_getCargo

    File: fn_persistence_getCargo.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-03-20
    Last Update: 2019-04-22
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: Yes

    Description:
        Get serialized object cargo.

    Parameter(s):
        _object - Object to get cargo from [OBJECT, defaults to objNull]

    Returns:
        Serialized cargo [ARRAY]
*/
params [
    ["_object", objNull, [objNull]]
];

// return
[
    getMagazineCargo _object,
    itemCargo _object,
    weaponsItemsCargo _object,
    getBackpackCargo _object,
    (everyContainer _object) apply {[_x select 0, (_x select 1) call KPLIB_fnc_persistence_getCargo]}
]
