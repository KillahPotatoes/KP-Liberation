private ["_unit_list_halo", "_backpack", "_backpackcontents", "_unit_backpacks"];

dojump = 0;
_backpackcontents = [];
_unit_backpacks = [];

createDialog "liberation_halo";
halo_position = getPosATL player;

["halo_map_event", "onMapSingleClick", { halo_position = _pos }] call BIS_fnc_addStackedEventHandler;
"spawn_marker" setMarkerTextLocal (localize "STR_HALO_PARAM");

waitUntil { dialog };
while { dialog && alive player && dojump == 0 } do {
    "spawn_marker" setMarkerPosLocal halo_position;
    sleep 0.1;
};

if (dialog) then {
    closeDialog 0;
    sleep 0.1;
};

"spawn_marker" setMarkerPosLocal markers_reset;
"spawn_marker" setMarkerTextLocal "";
["halo_map_event", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;

if (player distance2D halo_position < 200) exitWith {
    hintSilent "Too close to player!";
};

_unit_list_halo = (units group player) select {
    !(isPlayer _x) && { alive _x } && { lifestate _x != "INCAPACITATED" } &&
    { isNull objectParent _x } && { _x distance2D player < 50 };
};

hint format ["AI Selected for HALO: %1", count _unit_list_halo];

{
    private _unit = _x;
    private _unit_backpack = backpack _unit;
    private _unit_contents = backpackItems _unit;

    if (_unit_backpack != "" && _unit_backpack != "B_Parachute") then {
        _unit_backpacks pushBack [_unit, _unit_backpack, _unit_contents];
    };

    if (!isNull objectParent _unit) then { moveOut _unit; sleep 0.2; };
    removeBackpack _unit;
    _unit addBackpack "B_Parachute";
    _unit setVelocity [0, 0, 0];

    private _offsetX = random 10 - 5;
    private _offsetY = random 10 - 5;
    private _newPos = [
        (halo_position select 0) + _offsetX,
        (halo_position select 1) + _offsetY,
        GRLIB_halo_altitude + 200
    ];
    _unit setPosATL _newPos;
    sleep 0.2;
} forEach _unit_list_halo;

_backpack = backpack player;
if (_backpack != "" && _backpack != "B_Parachute") then {
    _backpackcontents = backpackItems player;
    removeBackpack player;
    sleep 0.1;
};
player addBackpack "B_Parachute";
player setPosATL [halo_position select 0, halo_position select 1, GRLIB_halo_altitude + 200];

[player, halo_position] remoteExec ["paraDrop", player];
sleep 1;

{
    [_x, halo_position] remoteExec ["paraDrop", _x];
    sleep 1;
} forEach _unit_list_halo;

waitUntil { !alive player || isTouchingGround player };
sleep 2;

if (_backpack != "" && _backpack != "B_Parachute") then {
    removeBackpack player;
    sleep 0.1;
    player addBackpack _backpack;
    clearAllItemsFromBackpack player;
    { player addItemToBackpack _x } foreach _backpackcontents;
};

{
    private _unit = _x select 0;
    private _saved_backpack = _x select 1;
    private _saved_contents = _x select 2;

    if (alive _unit) then {
        removeBackpack _unit;
        sleep 0.1;
        _unit addBackpack _saved_backpack;
        clearAllItemsFromBackpack _unit;
        { _unit addItemToBackpack _x } forEach _saved_contents;
    };
} forEach _unit_backpacks;