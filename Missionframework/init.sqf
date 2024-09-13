
KPLIB_init = false;
KPLIB_endgame = 0;
KPLIB_respawn_marker = "respawn";

// Version of the KP Liberation framework
KPLIB_version = [0, 96, 8];

enableSaving [false, false];

if (isDedicated) then {debug_source = "Server";} else {debug_source = name player;};

[] call KPLIB_fnc_initSectors;
if (!isServer) then {waitUntil {!isNil "KPLIB_initServerDone"};};
[] call compile preprocessFileLineNumbers "KPLIB_config.sqf";
[] call compile preprocessFileLineNumbers "KPLIB_whitelists.sqf";
[] call compile preprocessFileLineNumbers "KPLIB_transportConfigs.sqf";
[] call compile preprocessFileLineNumbers "KPLIB_classnameLists.sqf";
[] call compile preprocessFileLineNumbers "scripts\shared\fetch_params.sqf";
[] call compile preprocessFileLineNumbers "presets\init_presets.sqf";
[] call compile preprocessFileLineNumbers "KPLIB_objectInits.sqf";

// Activate selected player menu. If CBA isn't loaded -> fallback to GREUH
if (KPPLM_CBA && KPLIB_param_playerMenu) then {
    [] call KPPLM_fnc_postInit;
} else {
    [] execVM "GREUH\scripts\GREUH_activate.sqf";
};

[] call compile preprocessFileLineNumbers "scripts\shared\init_shared.sqf";

if (isServer) then {
    [] call compile preprocessFileLineNumbers "scripts\server\init_server.sqf";
};

if (!isDedicated && !hasInterface && isMultiplayer) then {
    execVM "scripts\server\offloading\hc_manager.sqf";
};

if (!isDedicated && hasInterface) then {
    // Get mission version and readable world name for Discord rich presence
    [
        ["UpdateDetails", [localize "STR_MISSION_VERSION", "on", getText (configfile >> "CfgWorlds" >> worldName >> "description")] joinString " "]
    ] call (missionNamespace getVariable ["DiscordRichPresence_fnc_update", {}]);

    // Add EH for curator to add kill manager and object init recognition for zeus spawned units/vehicles
    {
        _x addEventHandler ["CuratorObjectPlaced", {[_this select 1] call KPLIB_fnc_handlePlacedZeusObject;}];
    } forEach allCurators;

    waitUntil {alive player};
    if (debug_source != name player) then {debug_source = name player};
    [] call compile preprocessFileLineNumbers "scripts\client\init_client.sqf";
} else {
    setViewDistance 1600;
};

//Activate cratefiller on true param and active CBA
if ((isClass (configFile >> "CfgPatches" >> "cba_main")) && KPLIB_param_cratefiller) then {
    [] call KPLIB_fnc_cratefiller_postInit;
};

// Execute fnc_reviveInit again (by default it executes in postInit)
if ((isNil {player getVariable "bis_revive_ehHandleHeal"} || isDedicated) && !(bis_reviveParam_mode == 0)) then {
    [] call bis_fnc_reviveInit;
};

KPLIB_init = true;

// Notify clients that server is ready
if (isServer) then {
    KPLIB_initServerDone = true;
    publicVariable "KPLIB_initServerDone";
};
