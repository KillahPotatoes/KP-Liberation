/*
    File: fn_getLocalCap.sqf
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
private [ "_unitcap_local" ];

_unitcap_local = (round (infantry_cap / 2));
if ( _unitcap_local > GRLIB_blufor_cap ) then {
	_unitcap_local = GRLIB_blufor_cap;
};

_unitcap_local
