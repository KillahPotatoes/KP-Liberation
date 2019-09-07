if (!isServer) exitWith {false};

params [
    ["_centerPos", [0, 0, 0], [[]], [3]],
    ["_radius", 0, [0]],
    ["_save", false, [false]]
];

if (save_is_loaded && {(KP_liberation_clearances findIf {(_x select 0) isEqualTo _centerPos}) != -1}) exitWith {false};

{
    _x switchLight "OFF";
    _x hideObjectGlobal true;
    _x allowDamage false;
} forEach (nearestTerrainObjects [_centerPos, [], _radius, false, true]);

if (_save) then {
    KP_liberation_clearances pushBackUnique [_centerPos, _radius];
    publicVariable "KP_liberation_clearances";
};

true
