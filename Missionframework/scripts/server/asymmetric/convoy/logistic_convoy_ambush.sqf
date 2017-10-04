params ["_convoy"];

if (KP_liberation_asymmetric_debug > 0) then {diag_log format ["[KP LIBERATION] [ASYMMETRIC] Logistic convoy %1: spawning ambush", (_convoy select 0)];};

private _pos = [0,0,0];

switch ((_convoy select 7)) do {
	case 2: {_pos = (_convoy select 3) getPos [(_convoy select 8) * 400, (_convoy select 3) getDir (_convoy select 2)]};
	case 4: {_pos = (_convoy select 2) getPos [(_convoy select 8) * 400, (_convoy select 2) getDir (_convoy select 3)]};
	default {diag_log format ["[KP LIBERATION] [ERROR] Logistic convoy %1 ambush: convoy is not travelling", (_convoy select 0)];};
};

if (_pos isEqualTo [0,0,0]) exitWith {diag_log format ["[KP LIBERATION] [ERROR] Logistic convoy %1 ambush: no position", (_convoy select 0)];};

private _roadObj = [_pos, 400, []] call BIS_fnc_nearestRoad;
if (isNull _roadObj) exitWith {
	if (KP_liberation_asymmetric_debug > 0) then {diag_log format ["[KP LIBERATION] [ASYMMETRIC] Logistic convoy %1 ambush: no road near current convoy position", (_convoy select 0)];};
	KP_liberation_convoy_ambush_check = 1;
};

KP_liberation_convoy_ambush_check = 2;
KP_liberation_convoy_ambush_inProgress = true;
[0, getPos _roadObj] remoteExec ["asymm_notifications"];

private _vehicleArray = [];
for "_i" from 1 to (_convoy select 1) do {
	private _veh = createVehicle [KP_liberation_truck_classname, getPos _roadObj, [], 50, "NONE"];
	_veh setDir (getDir _roadObj);
	{
		private _damage = random 0.6;
		if ((_x find "Wheel") != -1) then {
			_damage = _damage + 0.6;
		} else {
			_damage = _damage + 0.3;
		};
		if (_damage > 1) then {_damage = 1.0};
		_veh setHitPointDamage [_x, _damage];
	} forEach ((getAllHitPointsDamage _veh) select 0);
	_vehicleArray pushBack _veh;

	private _driver = createVehicle [crewman_classname, getPos _veh, [], 12, "NONE"];
	_driver setDamage 1;
};
if (KP_liberation_asymmetric_debug > 0) then {diag_log format ["[KP LIBERATION] [ASYMMETRIC] Logistic convoy %1 ambush: truck spawning done", (_convoy select 0)];};

private _supplies = (_convoy select 6) select 0;
private _ammo = (_convoy select 6) select 1;
private _fuel = (_convoy select 6) select 2;
private _crateArray = [];

while {_supplies > 0} do {
	private _crate = createVehicle [KP_liberation_supply_crate, getPos _roadObj, [], 50, "NONE"];
	[_crate, 500] remoteExec ["F_setMass",_crate];
	if ((floor (_supplies / 100)) > 0) then {
		_crate setVariable ["KP_liberation_crate_value", 100, true];
		_supplies = _supplies - 100;
	} else {
		_crate setVariable ["KP_liberation_crate_value", _supplies, true];
		_supplies = 0;
	};
	_crateArray pushBack [_crate];
};

while {_ammo > 0} do {
	private _crate = createVehicle [KP_liberation_ammo_crate, getPos _roadObj, [], 50, "NONE"];
	[_crate, 500] remoteExec ["F_setMass",_crate];
	if ((floor (_ammo / 100)) > 0) then {
		_crate setVariable ["KP_liberation_crate_value", 100, true];
		_ammo = _ammo - 100;
	} else {
		_crate setVariable ["KP_liberation_crate_value", _ammo, true];
		_ammo = 0;
	};
	_crateArray pushBack [_crate];
};

while {_fuel > 0} do {
	private _crate = createVehicle [KP_liberation_fuel_crate, getPos _roadObj, [], 50, "NONE"];
	[_crate, 500] remoteExec ["F_setMass",_crate];
	if ((floor (_fuel / 100)) > 0) then {
		_crate setVariable ["KP_liberation_crate_value", 100, true];
		_fuel = _fuel - 100;
	} else {
		_crate setVariable ["KP_liberation_crate_value", _fuel, true];
		_fuel = 0;
	};
	_crateArray pushBack [_crate];
};
if (KP_liberation_asymmetric_debug > 0) then {diag_log format ["[KP LIBERATION] [ASYMMETRIC] Logistic convoy %1 ambush: resource spawning done", (_convoy select 0)];};

private _grp = createGroup GRLIB_side_resistance;
for "_i" from 1 to (4 + (random (round ((KP_liberation_civ_rep * -1) / 25))) + (random (round (KP_liberation_guerilla_strength / 25)))) do {
	// GUERILLA -> Need adjusting after loadouts are finished
	private _unit = _grp createUnit [selectRandom KP_liberation_guerilla_units, getPos _roadObj, [], 50, "NONE"];
	[_unit] call (selectRandom [loadout_crewman, loadout_rifleman, loadout_autorifleman, loadout_rifleman_light, loadout_marksman]);
};

private _waypoint = _grp addWaypoint [getPos _roadObj, 150];
_waypoint setWaypointType "SAD";
_waypoint setWaypointCompletionRadius 10;
_waypoint = _grp addWaypoint [getPos _roadObj, 150];
_waypoint setWaypointType "SAD";
_waypoint setWaypointCompletionRadius 10;
_waypoint = _grp addWaypoint [getPos _roadObj, 150];
_waypoint setWaypointType "SAD";
_waypoint setWaypointCompletionRadius 10;
_waypoint = _grp addWaypoint [getPos _roadObj, 150];
_waypoint setWaypointType "CYCLE";
_waypoint setWaypointCompletionRadius 10;
if (KP_liberation_asymmetric_debug > 0) then {diag_log format ["[KP LIBERATION] [ASYMMETRIC] Logistic convoy %1 ambush: guerillas spawning done", (_convoy select 0)];};

private _waitingTime = KP_liberation_convoy_ambush_duration;

while {(({alive _x} count (units _grp)) > 0) && (_waitingTime > 0)} do {
	uiSleep 1;			
	private _player_near = false;
	{
		if (((_x distance _roadObj) < 250) && (alive _x)) exitWith {_player_near = true};
	} foreach allPlayers;

	if !(_player_near) then {
		_waitingTime = _waitingTime - 1;
	};
};
if (KP_liberation_asymmetric_debug > 0) then {diag_log format ["[KP LIBERATION] [ASYMMETRIC] Logistic convoy %1 ambush: ambush finished", (_convoy select 0)];};

KP_liberation_convoy_ambush_inProgress = false;

if ((_waitingTime <= 0) && (({alive _x} count (units _grp)) > 0)) then {
	[2] remoteExec ["asymm_notifications"];
	{deleteVehicle _x;} forEach (units _grp);
	{
		if ((typeOf (_x select 0)) == KP_liberation_ammo_crate) then {
			KP_liberation_guerilla_strength = KP_liberation_guerilla_strength + 2;
		} else {
			KP_liberation_guerilla_strength = KP_liberation_guerilla_strength + 1;
		};
		deleteVehicle (_x select 0);
	} forEach _crateArray;
	if (KP_liberation_asymmetric_debug > 0) then {diag_log format ["[KP LIBERATION] [ASYMMETRIC] Logistic convoy %1 ambush: guerillas escaped", (_convoy select 0)];};
} else {
	[1] remoteExec ["asymm_notifications"];
	if (KP_liberation_asymmetric_debug > 0) then {diag_log format ["[KP LIBERATION] [ASYMMETRIC] Logistic convoy %1 ambush: guerillas defeated", (_convoy select 0)];};
};
