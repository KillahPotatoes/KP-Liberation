/*
    File: fn_initArsenal.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2020-05-11
    Last Update: 2020-09-26
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Loads the arsenal preset and adjusts the available arsenal gear accordingly.

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/

if (KPLIB_param_useArsenalPreset) then {
    KPLIB_arsenalWeapons = [];
    KPLIB_arsenalMagazines = [];
    KPLIB_arsenalItems = [];
    KPLIB_arsenalBackpacks = [];
    KPLIB_arsenalBlacklist = [];
    KPLIB_arsenalAllowed = [];
    KPLIB_arsenalAllowedExtension = [];

    switch (KPLIB_presetArsenal) do {
        case  1: {[] call compile preprocessFileLineNumbers "presets\arsenal\custom.sqf";};
        case  2: {[] call compile preprocessFileLineNumbers "presets\arsenal\rhsusaf.sqf";};
        case  3: {[] call compile preprocessFileLineNumbers "presets\arsenal\3cbBAF.sqf";};
        case  4: {[] call compile preprocessFileLineNumbers "presets\arsenal\gm_west.sqf";};
        case  5: {[] call compile preprocessFileLineNumbers "presets\arsenal\gm_east.sqf";};
        case  6: {[] call compile preprocessFileLineNumbers "presets\arsenal\csat.sqf";};
        case  7: {[] call compile preprocessFileLineNumbers "presets\arsenal\unsung.sqf";};
        case  8: {[] call compile preprocessFileLineNumbers "presets\arsenal\sfp.sqf";};
        case  9: {[] call compile preprocessFileLineNumbers "presets\arsenal\bwmod.sqf";};
        case  10: {[] call compile preprocessFileLineNumbers "presets\arsenal\vanilla_nato_mtp.sqf";};
        case  11: {[] call compile preprocessFileLineNumbers "presets\arsenal\vanilla_nato_tropic.sqf";};
        case  12: {[] call compile preprocessFileLineNumbers "presets\arsenal\vanilla_nato_wdl.sqf";};
        case  13: {[] call compile preprocessFileLineNumbers "presets\arsenal\vanilla_csat_hex.sqf";};
        case  14: {[] call compile preprocessFileLineNumbers "presets\arsenal\vanilla_csat_ghex.sqf";};
        case  15: {[] call compile preprocessFileLineNumbers "presets\arsenal\vanilla_aaf.sqf";};
        case  16: {[] call compile preprocessFileLineNumbers "presets\arsenal\vanilla_ldf.sqf";};
        default  {[] call compile preprocessFileLineNumbers "presets\arsenal\blacklist.sqf";};
    };
    [] call compile preprocessFileLineNumbers "presets\arsenal\allowedExtension.sqf";

    private _crawled = [] call KPLIB_fnc_crawlAllItems;

    if (KPLIB_arsenalWeapons isEqualTo []) then {KPLIB_arsenalWeapons = (_crawled select 0) select {!(_x in KPLIB_arsenalBlacklist)};};
    [missionNamespace, KPLIB_arsenalWeapons] call BIS_fnc_addVirtualWeaponCargo;
    KPLIB_arsenalAllowed append KPLIB_arsenalWeapons;

    if (KPLIB_arsenalMagazines isEqualTo []) then {KPLIB_arsenalMagazines = (_crawled select 1) select {!(_x in KPLIB_arsenalBlacklist)};};
    [missionNamespace, KPLIB_arsenalMagazines] call BIS_fnc_addVirtualMagazineCargo;
    KPLIB_arsenalAllowed append KPLIB_arsenalMagazines;

    if (KPLIB_arsenalItems isEqualTo []) then {KPLIB_arsenalItems = (_crawled select 2) select {!(_x in KPLIB_arsenalBlacklist)};};
    [missionNamespace, KPLIB_arsenalItems] call BIS_fnc_addVirtualItemCargo;
    KPLIB_arsenalAllowed append KPLIB_arsenalItems;

    if (KPLIB_arsenalBackpacks isEqualTo []) then {KPLIB_arsenalBackpacks = (_crawled select 3) select {!(_x in KPLIB_arsenalBlacklist)};};
    [missionNamespace, KPLIB_arsenalBackpacks] call BIS_fnc_addVirtualBackpackCargo;
    KPLIB_arsenalAllowed append KPLIB_arsenalBackpacks;

    // Support for CBA disposable launchers, https://github.com/CBATeam/CBA_A3/wiki/Disposable-Launchers
    if !(configProperties [configFile >> "CBA_DisposableLaunchers"] isEqualTo []) then {
        private _disposableLaunchers = ["CBA_FakeLauncherMagazine"];
        {
            private _loadedLauncher = cba_disposable_LoadedLaunchers getVariable _x;
            if (!isNil "_loadedLauncher") then {
                _disposableLaunchers pushBack _loadedLauncher;
            };

            private _normalLauncher = cba_disposable_NormalLaunchers getVariable _x;
            if (!isNil "_normalLauncher") then {
                _normalLauncher params ["_loadedLauncher"];
                _disposableLaunchers pushBack _loadedLauncher;
            };
        } forEach KPLIB_arsenalAllowed;
        KPLIB_arsenalAllowed append _disposableLaunchers;
    };

    {
        // Handle CBA optics, https://github.com/CBATeam/CBA_A3/wiki/Scripted-Optics
        if (missionNamespace getVariable ["CBA_optics", false]) then {
            private _pipOptic = CBA_optics_PIPOptics getVariable _x;
            if (!isNil "_pipOptic") then {
                KPLIB_arsenalAllowedExtension pushBackUnique _pipOptic;
            };

            private _nonPipOptic = CBA_optics_NonPIPOptics getVariable _x;
            if (!isNil "_nonPipOptic") then {
                KPLIB_arsenalAllowedExtension pushBackUnique _nonPipOptic;
            };
        };

        // Handle CBA (MRT) Accessories, https://github.com/CBATeam/CBA_A3/wiki/Accessory-Functions
        private _itemCfg = configFile >> "CfgWeapons" >> _x;
        if (!isNull _itemCfg) then {
            private _nextItem = getText (_cfg >> "MRT_SwitchItemPrevClass");
            if (_nextItem != "") then {
                KPLIB_arsenalAllowedExtension pushBackUnique _nextItem;
            };

            private _prevItem = getText (_cfg >> "MRT_SwitchItemNextClass");
            if (_prevItem != "") then {
                KPLIB_arsenalAllowedExtension pushBackUnique _prevItem;
            };
        };
    } forEach KPLIB_arsenalAllowed;

    KPLIB_arsenalAllowed append KPLIB_arsenalAllowedExtension;
    if (KPLIB_ace && KPLIB_param_arsenalType) then {[player, KPLIB_arsenalAllowed, false] call ace_arsenal_fnc_addVirtualItems;};

    // Lowering to avoid issues with incorrect capitalized classnames in KPLIB_fnc_checkGear
    KPLIB_arsenalAllowed = KPLIB_arsenalAllowed apply {toLowerANSI _x};
} else {
    [missionNamespace, true] call BIS_fnc_addVirtualWeaponCargo;
    [missionNamespace, true] call BIS_fnc_addVirtualMagazineCargo;
    [missionNamespace, true] call BIS_fnc_addVirtualItemCargo;
    [missionNamespace, true] call BIS_fnc_addVirtualBackpackCargo;
    if (KPLIB_ace && KPLIB_param_arsenalType) then {[player, true, false] call ace_arsenal_fnc_addVirtualItems;};
};

true
