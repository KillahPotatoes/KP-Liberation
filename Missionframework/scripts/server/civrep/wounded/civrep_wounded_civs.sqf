params ["_sector"];

if (!(_sector in KPLIB_sectors_capital) && !(_sector in KPLIB_sectors_city) && !(_sector in KPLIB_sectors_factory)) exitWith {};

if (KPLIB_civrep_debug > 0) then {[format ["civrep_wounded_civs.sqf -> Spawned for %1 on: %2", markerText _sector, debug_source], "CIVREP"] remoteExecCall ["KPLIB_fnc_log", 2];};

private _count = 2 + (ceil (random 2));
private _grp = creategroup [KPLIB_side_civilian, true];
private _civs = [];
private _markers = [];

for "_i" from 1 to _count do {
    private _pos = (markerPos _sector) getPos [(50 + (random 150)), (random 360)];
    while {(surfaceIsWater _pos) || ((count ([_pos, 30] call KPLIB_fnc_getNearbyPlayers)) > 0)} do {
        _pos = (markerPos _sector) getPos [(50 + (random 200)), (random 360)];
    };
    private _civ = [selectRandom KPLIB_c_units, _pos, _grp] call KPLIB_fnc_createManagedUnit;
    _civ setDir (random 360);
    _civ disableAI "ALL";
    removeAllItems _civ;
    _civ setDamage 0.5;
    _civ call F_cr_woundedAnim;
    if (KPLIB_ace_med) then {[_civ] remoteExec ["KPLIB_fnc_crAddAceAction"];};
    _civs pushBack _civ;
    private _marker = createMarker ["wounded_marker_" + str _i, [((_pos select 0) - 20 + (random 40)),((_pos select 1) - 20 + (random 40))]];
    _marker setMarkerShape "ELLIPSE";
    _marker setMarkerSize [25,25];
    _marker setMarkerColor "ColorCIV";
    _marker setMarkerAlpha 0.35;
    _markers pushBack _marker;
};

waitUntil {count _civs isEqualTo _count};
if (KPLIB_civrep_debug > 0) then {[format ["civrep_wounded_civs.sqf -> Spawned %1 wounded civilians at %2", _count, markerText _sector], "CIVREP"] remoteExecCall ["KPLIB_fnc_log", 2];};

private _units_near = [markerPos _sector, 300, KPLIB_side_player] call KPLIB_fnc_getUnitsCount;
private _healed_civs = [];

while {true} do {
    _units_near = [markerPos _sector, 300, KPLIB_side_player] call KPLIB_fnc_getUnitsCount;
    if (_units_near isEqualTo 0) exitWith {
        if (KPLIB_civrep_debug > 0) then {["civrep_wounded_civs.sqf -> no near blufor units. exit heal wait loop", "CIVREP"] remoteExecCall ["KPLIB_fnc_log", 2]};
        sleep 30;
    };
    {
        private _civx = _x;
        private _isHealed = false;
        if !(_civx in _healed_civs) then {
            if (KPLIB_ace_med) then {_isHealed = _civx getVariable ["KPLIB_isHealed", false];} else {_isHealed = (damage _civx < 0.5);};
            if (_isHealed || !alive _civx) then {
                (_markers select _forEachIndex) setMarkerAlpha 0;
                _healed_civs pushBack _civx;
                removeAllActions _civx;
                if (alive _civx) then {
                    [_civx, "AinjPpneMstpSnonWnonDnon_kneel"] remoteExecCall ["switchMove"];
                    [_civx, "AinjPpneMstpSnonWnonDnon_kneel"] remoteExecCall ["playMoveNow"];
                    sleep 2;
                    _civx enableAI "ALL";
                    [4, [(name _civx)]] remoteExec ["KPLIB_fnc_crGlobalMsg"];
                    [KPLIB_cr_wounded_gain] call F_cr_changeCR;
                    stats_civilians_healed = stats_civilians_healed +1;
                };
            };
        };
    } forEach _civs;
    if ((count _healed_civs) isEqualTo (count _civs)) exitWith {
        if (KPLIB_civrep_debug > 0) then {["civrep_wounded_civs.sqf -> all wounded units healed. exit heal wait loop", "CIVREP"] remoteExecCall ["KPLIB_fnc_log", 2]};
        sleep 60;
    };
    sleep 1;
};

{deleteVehicle _x} forEach _civs;
{deleteMarker _x} forEach _markers;

if (KPLIB_civrep_debug > 0) then {[format ["civrep_wounded_civs.sqf -> dropped at %1", markerText _sector], "CIVREP"] remoteExecCall ["KPLIB_fnc_log", 2]};
