/*
    KPLIB_fnc_common_isSectorType

    File: fn_common_isSectorType.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-09-04
    Last Update: 2019-09-04
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: Yes

    Description:
        Given a sector return true if sector is of type to check for.

    Parameter(s):
        _sector - Sector we are checking [STRING, Defaults to ""]
		_type - Sector Type to check against. [STRING, Defaults to ""]

    Returns:
        Boolean [BOOL]
*/

params [
    ["_sector", "", [""]],
	["_type", "", [""]]
];

// Get array of results that match _sector in requested list of sorted sectors
switch (_type) do {
    case "airspawn": {_result = KPLIB_sectors_airspawn select {_sector = _x;};};
    case "military": {_result = KPLIB_sectors_military select {_sector = _x;};};
    case "city": {_result = KPLIB_sectors_city select {_sector = _x;};};
    case "factory": {_result = KPLIB_sectors_factory select {_sector = _x;};};
    case "metropolis": {_result = KPLIB_sectors_metropolis select {_sector = _x;};};
    case "spawn": {_result = KPLIB_sectors_spawn select {_sector = _x;};};
    case "tower": {_result = KPLIB_sectors_tower select {_sector = _x;};};
	default: {_result = [];}
};

// If result array is larger than 1, return true, else false.
if (count _result > 0) then {
	true;
} else {
	// ERROR LOG
	false;
};