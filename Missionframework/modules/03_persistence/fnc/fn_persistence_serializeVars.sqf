/*
    KPLIB_fnc_persistence_serializeVars

    File: fn_persistence_serializeVars.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-03-30
    Last Update: 2019-04-22
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: Yes

    Description:
        Get peristable variables from object.

    Parameter(s):
        _object - Description [OBJECT, defaults to objNull]

    Returns:
        Persistable object variables [ARRAY]
*/
params [
    ["_object", objNull, [objNull]]
];

if (isNull _object) exitWith {[]};

// return
KPLIB_persistenceSavedVars apply {[
    _x select 0, // name
    _object getVariable (_x select 0), // val
    _x select 1 // global
]} select {!isNil {_x select 1}};
