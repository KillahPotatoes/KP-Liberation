params [
	"_sectorpos",
	"_classname",
	[ "_precise_position", false ],
	[ "_random_rotate", true ]
];

private _newvehicle = objNull;
private _spawnpos = zeropos;
private _grp = grpNull;

if ( _precise_position ) then {
	_spawnpos = [] + _sectorpos;
} else {
	while { _spawnpos distance zeropos < 1000 } do {
		_spawnpos = (_sectorpos getPos [random 150, random 360]) findEmptyPosition [10, 100, 'B_Heli_Transport_01_F'];
		if ( count _spawnpos == 0 ) then { _spawnpos = zeropos; };
	};
};

_newvehicle = objNull;
if ( _classname in opfor_choppers ) then {
	_newvehicle = createVehicle [_classname, _spawnpos, [], 0, 'FLY'];
	_newvehicle flyInHeight (100 + (random 200));
} else {
	_newvehicle = _classname createVehicle _spawnpos;
	_newvehicle setpos _spawnpos;
};
_newvehicle allowdamage false;

if(KP_liberation_clear_cargo) then {
	clearWeaponCargoGlobal _newvehicle;
	clearMagazineCargoGlobal _newvehicle;
	clearItemCargoGlobal _newvehicle;
	clearBackpackCargoGlobal _newvehicle;
};

if ( _classname in militia_vehicles ) then {
	[ _newvehicle ] call F_libSpawnMilitiaCrew;
} else {
	_grp = createGroup [GRLIB_side_enemy, true]; //TODO test
	createVehicleCrew _newvehicle;
	(crew _newvehicle) joinSilent _grp;

	sleep 0.1;
	{ _x addMPEventHandler ['MPKilled', {_this spawn kill_manager}]; } foreach (crew _newvehicle);
};

_newvehicle addMPEventHandler ['MPKilled', {_this spawn kill_manager}];
if ( _random_rotate ) then {
	_newvehicle setdir (random 360);
};
_newvehicle setVectorUp surfaceNormal position _newvehicle;

sleep 0.1;
_newvehicle allowdamage true;
_newvehicle setdamage 0;

_newvehicle
