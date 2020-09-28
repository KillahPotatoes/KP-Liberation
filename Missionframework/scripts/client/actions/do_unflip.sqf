params [ "_veh" ];
if (isNull _veh ) exitWith {};

// Original unflipping
if 	(KP_liberation_unflip_method == 0) exitWith {
    _veh setpos [(getpos _veh) select 0,(getpos _veh) select 1, 0.5];
    _veh setVectorUp surfaceNormal position _veh;
};
// Vet's method
private _upsideDown = (vectorUp _veh vectorDotProduct surfaceNormal getPos _veh) < -0.80;
private _bank = _veh call BIS_fnc_getPitchBank select 1;

private _flipLeft = _bank >= 0;
// When upside down then left is right and right is left
if (_upsideDown) then {
	_flipLeft = !_flipLeft;
};

if (!_upsideDown && 55 > abs _bank) exitWith {false};

private _bbr = boundingBoxReal _veh;
private _vehWidth = abs (_bbr#0#0 * 2);
private _forceFactor = 1;

if !(isNil{CBA_missionTime}) then {
	// force factor is set in vet_unflipping_unflip_start event
	private _lastUnflipAttempt = _veh getVariable ["vet_lastUnflipAttempt", CBA_missionTime];

	if (isNil{UNFLIP_FORCEFACTOR_EXPIRATIONTIME}) then {UNFLIP_FORCEFACTOR_EXPIRATIONTIME = 300};
	private _forceFactor = if ((CBA_missionTime - _lastUnflipAttempt) < UNFLIP_FORCEFACTOR_EXPIRATIONTIME) then {
		_veh getVariable ["vet_forceFactor", 1]
	} else {
		_veh setVariable ["vet_forceFactor", nil];
		1
	};
	_veh setVariable ["vet_lastUnflipAttempt", CBA_missionTime];
};

private _force = getMass _veh * ([1 + (_vehWidth/10), _vehWidth] select _upsideDown) * _forceFactor;
private _forcePointX = _bbr select ([0, 1] select _flipLeft) select 0;
private _forcePointZ = _bbr select ([1, 0] select _upsideDown) select 2;

_veh addForce [
	_veh vectorModelToWorld [[_force, -_force] select _flipLeft, 0, 0],
	[_forcePointX, 0, _forcePointZ]
]; 
