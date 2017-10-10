params ["_classtotest"];

private _return = false;

if (isClass (configFile >> "CfgVehicles" >> _classtotest)) then {
	_return = true;
} else {
	if (isServer) then {
		diag_log format ["[KP LIBERATION] [CHECKCLASS] %1 not found in CfgVehicles", _classtotest];
	};
};

_return
