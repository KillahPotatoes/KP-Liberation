/*
    File: playerNamespace.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2020-04-12
    Last Update: 2023-03-02
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

while {true} do {
    // FOB distance, name and position
    if !(KPLIB_sectors_fob isEqualTo []) then {
        _fobPos = [] call KPLIB_fnc_getNearestFob;
        _fobDist = player distance2d _fobPos;
        _fobName = ["", ["FOB", [_fobPos] call KPLIB_fnc_getFobName] joinString " "] select (_fobDist < KPLIB_range_fob);
    } else {
        _fobPos = [0, 0, 0];
        _fobDist = 99999;
        _fobName = "";
    };
    // TODO more self explanatory names, KPLIB_nearestFobDist, KPLIB_currentFobName, KPLIB_nearestFobPos
    player setVariable ["KPLIB_fobDist", _fobDist];
    player setVariable ["KPLIB_fobName", _fobName];
    player setVariable ["KPLIB_fobPos", _fobPos];

    // Direct acces due to config, commander or quartermaster or admin
    player setVariable ["KPLIB_hasDirectAccess", (getPlayerUID player) in KPLIB_whitelist_cmdrActions || {player == ([] call KPLIB_fnc_getCommander)} || {player isEqualto (missionnamespace getVariable ['quartermaster',objNull])} || {serverCommandAvailable "#kick"}];

    // Outside of startbase "safezone"
    player setVariable ["KPLIB_isAwayFromStart", (player distance2d startbase) > 1000];

    // Is near an arsenal object
    if (KPLIB_param_mobileArsenal) then {
        player setVariable ["KPLIB_isNearArsenal", !(((player nearObjects [KPLIB_b_arsenal, 5]) select {getObjectType _x >= 8}) isEqualTo [])];
    };

    // Is near a mobile respawn
    if (KPLIB_param_mobileRespawn) then {
        player setVariable ["KPLIB_isNearMobRespawn", !((player nearEntities [(KPLIB_b_mobileRespawns)+ [KPLIB_b_potato01], 10]) isEqualTo [])];
    };

    // Is near startbase
    player setVariable ["KPLIB_isNearStart", (player distance2d startbase) < 200];

    // Nearest activated sector and possible production data
    player setVariable ["KPLIB_nearProd", KPLIB_production param [KPLIB_production findIf {(_x select 1) isEqualTo ([100] call KPLIB_fnc_getNearestSector)}, []]];
    player setVariable ["KPLIB_nearSector", [KPLIB_range_sectorActivation] call KPLIB_fnc_getNearestSector];

    // Zeus module synced to player
    player setVariable ["KPLIB_ownedZeusModule", getAssignedCuratorLogic player];

    // Update state in Discord rich presence
    [] call KPLIB_fnc_setDiscordState;

    sleep 1;
};
