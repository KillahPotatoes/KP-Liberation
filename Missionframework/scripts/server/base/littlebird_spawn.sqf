waitUntil { time > 1 };
waitUntil { !isNil "huron" };

private ["_KP_liberation_little_bird","_KP_liberation_little_bird_pad"];

for [{_i=0}, {!isNil ("littlebird_" + str _i)}, {_i = _i + 1}] do {
	_KP_liberation_little_bird_pad = missionNamespace getVariable ("littlebird_" + str _i);
	_KP_liberation_little_bird = KP_liberation_little_bird_classname createVehicle [((getposATL _KP_liberation_little_bird_pad) select 0),((getposATL _KP_liberation_little_bird_pad) select 1),((getposATL _KP_liberation_little_bird_pad) select 2) + 0.2];
	_KP_liberation_little_bird enableSimulationGlobal false;
	_KP_liberation_little_bird allowdamage false;
	_KP_liberation_little_bird setposATL (getposATL _KP_liberation_little_bird_pad);
	_KP_liberation_little_bird setDir (getDir _KP_liberation_little_bird_pad);
	sleep 0.5;
	_KP_liberation_little_bird enableSimulationGlobal true;
	_KP_liberation_little_bird setDamage 0;
	_KP_liberation_little_bird allowdamage true;
	_KP_liberation_little_bird setVariable ["KP_liberation_preplaced", true, true];
};
