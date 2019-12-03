/*
    File: fn_getSectorOwnership.sqf
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
params [ "_thatpos", [ "_localsize", GRLIB_capture_size ] ];
private [ "_cap_thresold_count", "_cap_thresold_ratio", "_cap_min_ratio", "_sectorside", "_countblufor_ownership", "_countopfor_ownership", "_blufor_ratio" ];

_cap_thresold_count = 3;
_cap_thresold_ratio = 0.85;
_cap_min_ratio = 0.51;

_sectorside = GRLIB_side_resistance;
_countblufor_ownership = [_thatpos, _localsize, GRLIB_side_friendly ] call KPLIB_fnc_getUnitsCount;
_countopfor_ownership = [_thatpos, _localsize, GRLIB_side_enemy ] call KPLIB_fnc_getUnitsCount;

_blufor_ratio = 0;
if ( _countblufor_ownership + _countopfor_ownership != 0 ) then {
	_blufor_ratio = _countblufor_ownership / ( _countblufor_ownership + _countopfor_ownership);
};

if ( _countblufor_ownership == 0 && _countopfor_ownership <= _cap_thresold_count ) then { _sectorside = GRLIB_side_civilian; };

if ( _countblufor_ownership > 0 && ( ( _countopfor_ownership <= _cap_thresold_count && _blufor_ratio > _cap_min_ratio ) || _blufor_ratio > _cap_thresold_ratio) ) then { _sectorside = GRLIB_side_friendly; };

if ( _countblufor_ownership == 0 && _countopfor_ownership > _cap_thresold_count ) then { _sectorside = GRLIB_side_enemy; };

_sectorside
