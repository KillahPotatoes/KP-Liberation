params [ "_unit" ];
private ["_vvn", "_str"];

_vvn = vehicleVarName _unit;
_unit setVehicleVarName "";
_str = str _unit;
_unit setVehicleVarName _vvn;

parseNumber (_str select [(_str find ":") + 1])