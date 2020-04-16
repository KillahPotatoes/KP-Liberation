/*
    File: playerNamespace.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2020-04-12
    Last Update: 2020-04-13
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Tracks player state values to provide this information for other scripts.
*/

scriptName "KPLIB_playerNamespace";

waitUntil {!isNil "one_synchro_done"};
waitUntil {!isNil "one_eco_done"};
waitUntil {one_synchro_done};
waitUntil {one_eco_done};

private _fobPos = [0, 0, 0];
private _fobDist = 99999;
private _fobName = "";
private _nearSector = "";

while {true} do {
    // FOB distance, name and position
    if !(GRLIB_all_fobs isEqualTo []) then {
        _fobPos = [] call KPLIB_fnc_getNearestFob;
        _fobDist = player distance2d _fobPos;
        _fobName = ["", ["FOB", [_fobPos] call KPLIB_fnc_getFobName] joinString " "] select (_fobDist < GRLIB_fob_range);
    } else {
        _fobPos = [0, 0, 0];
        _fobDist = 99999;
        _fobName = "";
    };
    player setVariable ["KPLIB_fobDist", _fobDist];
    player setVariable ["KPLIB_fobName", _fobName];
    player setVariable ["KPLIB_fobPos", _fobPos];

    // Direct acces due to config, commander or admin
    player setVariable ["KPLIB_hasDirectAccess", (getPlayerUID player) in KP_liberation_commander_actions || {player == ([] call KPLIB_fnc_getCommander)} || {serverCommandAvailable "#kick"}];

    // Outside of startbase "safezone"
    player setVariable ["KPLIB_isAwayFromStart", (player distance2d startbase) > 1000];

    // Is near an arsenal object
    if (KP_liberation_mobilearsenal) then {
        player setVariable ["KPLIB_isNearArsenal", !(((player nearObjects [Arsenal_typename, 5]) select {getObjectType _x >= 8}) isEqualTo [])];
    };

    // Is near a mobile respawn
    if (KP_liberation_mobilerespawn) then {
        player setVariable ["KPLIB_isNearMobRespawn", !((player nearEntities [[Respawn_truck_typename, huron_typename], 10]) isEqualTo [])];
    };

    // Is near startbase
    player setVariable ["KPLIB_isNearStart", (player distance2d startbase) < 200];

    // Nearest activated sector and possible production data
    _nearSector = [GRLIB_sector_size] call KPLIB_fnc_getNearestSector;
    player setVariable ["KPLIB_nearProd", KP_liberation_production param [KP_liberation_production findIf {(_x select 1) isEqualTo _nearSector}, []]];
    player setVariable ["KPLIB_nearSector", _nearSector];

    // Zeus module synced to player
    player setVariable ["KPLIB_ownedZeusModule", getAssignedCuratorLogic player];

    sleep 1;
};
