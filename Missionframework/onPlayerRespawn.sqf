waitUntil {!isNil "KPLIB_initServerDone"};

params ["_newUnit", "_oldUnit"];

if( (uniform _oldUnit) isEqualTo "" ) then {
    _newUnit addUniform KPLIB_b_basic_uniform;
} else {
    removeUniform _newUnit;
    _newUnit addUniform (uniform _oldUnit);
};

if (isNil "KPLIB_respawn_loadout") then {
    removeAllWeapons player;
    removeAllItems player;
    removeAllAssignedItems player;
    removeVest player;
    removeBackpack player;
    removeHeadgear player;
    removeGoggles player;
    player linkItem "ItemMap";
    player linkItem "ItemCompass";
    player linkItem "ItemWatch";
    //player unlinkItem "ItemRadio";
    //player unlinkItem "ItemGPS";
} else {
    sleep 4;
    [player, KPLIB_respawn_loadout] call KPLIB_fnc_setLoadout;
};

[] call KPLIB_fnc_addActionsPlayer;

// Support Module handling
if ([
    false,
    player isEqualTo ([] call KPLIB_fnc_getCommander) || (getPlayerUID player) in KPLIB_whitelist_supportModule,
    true
] select KPLIB_param_supportModule) then {
    waitUntil {!isNil "KPLIB_param_supportModule_req" && !isNil "KPLIB_param_supportModule_arty" && time > 5};

    // Remove link to corpse, if respawned
    if (!isNull _oldUnit) then {
        KPLIB_param_supportModule_req synchronizeObjectsRemove [_oldUnit];
        _oldUnit synchronizeObjectsRemove [KPLIB_param_supportModule_req];
    };

    // Link player to support modules
    [player, KPLIB_param_supportModule_req, KPLIB_param_supportModule_arty] call BIS_fnc_addSupportLink;

    // Init modules, if newly joined and not client host
    if (isNull _oldUnit && !isServer) then {
        [KPLIB_param_supportModule_req] call BIS_fnc_moduleSupportsInitRequester;
        [KPLIB_param_supportModule_arty] call BIS_fnc_moduleSupportsInitProvider;
    };
};
