/*
    File: playerNamespace.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2020-04-12
    Last Update: 2020-04-12
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Tracks player state values to provide this information for other scripts.
*/

waitUntil {!isNil "one_synchro_done"};
waitUntil {!isNil "one_eco_done"};
waitUntil {one_synchro_done};
waitUntil {one_eco_done};

private _fobPos = [0, 0, 0];
private _fobDist = 99999;
private _fobName = "";
private _nearSector = "";

while {true} do {
    if !(GRLIB_all_fobs isEqualTo []) then {
        _fobPos = [] call KPLIB_fnc_getNearestFob;
        _fobDist = player distance2d _fobPos;
        _fobName = ["", ["FOB", [_fobPos] call KPLIB_fnc_getFobName] joinString " "] select (_fobDist < GRLIB_fob_range);

        player setVariable ["KPLIB_fobPos", _fobPos];
        player setVariable ["KPLIB_fobDist", _fobDist];
        player setVariable ["KPLIB_fobName", _fobName];
    };

    player setVariable ["KPLIB_nearStart", (player distance2d startbase) < 200];
    player setVariable ["KPLIB_awayFromStart", (player distance2d startbase) > 1000];

    _nearSector = [GRLIB_sector_size] call KPLIB_fnc_getNearestSector;
    player setVariable ["KPLIB_nearSector", _nearSector];
    player setVariable ["KPLIB_sectorProd", KP_liberation_production param [KP_liberation_production findIf {(_x select 1) isEqualTo _nearSector}, []]];

    if (KP_liberation_mobilearsenal) then {
        player setVariable ["KPLIB_nearArsenal", !(((player nearObjects [Arsenal_typename, 5]) select {getObjectType _x >= 8}) isEqualTo [])];
    };


    sleep 1;
};
