/*
    File: fn_getLocationName.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-11-25
    Last Update: 2019-11-25
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        No description added yet.

    Parameter(s):
        _localVariable - Description [DATATYPE, defaults to DEFAULTVALUE]

    Returns:
        Function reached the end [BOOL]
*/
// TODO
params [ "_attacked_position" ];
private [ "_attacked_string" ];

_attacked_string = [_attacked_position] call KPLIB_fnc_getFobName;
if ( _attacked_string == "" ) then {
	_attacked_string = markerText  ( [50, _attacked_position ] call F_getNearestSector );
} else {
	_attacked_string = format [ "FOB %1", _attacked_string ];
};

_attacked_string
