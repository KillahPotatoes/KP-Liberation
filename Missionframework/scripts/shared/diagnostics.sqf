scriptName "KPLIB_diagnostics";

private _source = "";

["------------------------------------", "MISSIONSTART"] call KPLIB_fnc_log;
[format ["Name: %1", (localize "STR_MISSION_TITLE")], "MISSIONSTART"] call KPLIB_fnc_log;
[format ["World: %1", worldName], "MISSIONSTART"] call KPLIB_fnc_log;
[format ["Version: %1", (localize "STR_MISSION_VERSION")], "MISSIONSTART"] call KPLIB_fnc_log;
[format ["Author: %1", [missionConfigFile] call BIS_fnc_overviewAuthor], "MISSIONSTART"] call KPLIB_fnc_log;
[format ["Preset player: %1", KPLIB_presetPlayer], "MISSIONSTART"] call KPLIB_fnc_log;
[format ["Preset enemy: %1", KPLIB_presetEnemy], "MISSIONSTART"] call KPLIB_fnc_log;
[format ["Preset resistance: %1", KPLIB_presetResistance], "MISSIONSTART"] call KPLIB_fnc_log;
[format ["Preset civilians: %1", KPLIB_presetCivilians], "MISSIONSTART"] call KPLIB_fnc_log;
[format ["Preset arsenal: %1", KPLIB_presetArsenal], "MISSIONSTART"] call KPLIB_fnc_log;
[format ["CBA: %1", KPPLM_CBA], "MISSIONSTART"] call KPLIB_fnc_log;
[format ["ACE: %1", KPLIB_ace], "MISSIONSTART"] call KPLIB_fnc_log;
[format ["ACE Medical: %1", KPLIB_ace_med], "MISSIONSTART"] call KPLIB_fnc_log;
[format ["KP Ranks: %1", KPPLM_KPR], "MISSIONSTART"] call KPLIB_fnc_log;
["------------------------------------", "MISSIONSTART"] call KPLIB_fnc_log;

waitUntil {sleep 1; !isNil "KPLIB_sectors_active"};

private _delay = 120;

while {true} do {
    if (isDedicated) then {
        _source = "Server";
    } else {
        _source = name player;
        _delay = 300;
    };

    if (isServer) then {
        [
            format [
                "%1 - FPS: %2 - Local groups: %3 - Local units: %4 - Active Sectors: %5 - Active Scripts: [spawn: %6, execVM: %7, exec: %8, execFSM: %9]",
                _source,
                ((round (diag_fps * 100.0)) / 100.0),
                {local _x} count allGroups,
                {local _x} count allUnits,
                count KPLIB_sectors_active,
                diag_activeScripts select 0,
                diag_activeScripts select 1,
                diag_activeScripts select 2,
                diag_activeScripts select 3
            ],
            "STATS"
        ] call KPLIB_fnc_log;
    } else {
        [
            format [
                "%1 - FPS: %2 - Local groups: %3 - Local units: %4 - Active Scripts: [spawn: %5, execVM: %6, exec: %7, execFSM: %8]",
                _source,
                ((round (diag_fps * 100.0)) / 100.0),
                {local _x} count allGroups,
                {local _x} count allUnits,
                diag_activeScripts select 0,
                diag_activeScripts select 1,
                diag_activeScripts select 2,
                diag_activeScripts select 3
            ],
            "STATS"
        ] remoteExecCall ["KPLIB_fnc_log", 2];
    };
    sleep _delay;
};
