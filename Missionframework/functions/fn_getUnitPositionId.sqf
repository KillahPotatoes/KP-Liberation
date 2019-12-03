/*
    File: fn_getUnitPositionId.sqf
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
params [ "_unit" ];
private ["_vvn", "_str"];

_vvn = vehicleVarName _unit;
_unit setVehicleVarName "";
_str = str _unit;
_unit setVehicleVarName _vvn;

parseNumber (_str select [(_str find ":") + 1])
