waitUntil {!isNil "KPLIB_initServer"};

params ["_newUnit", "_oldUnit"];

if (isNil "GRLIB_respawn_loadout") then {
    removeAllWeapons player;
    removeAllItems player;
    removeAllAssignedItems player;
    removeVest player;
    removeBackpack player;
    removeHeadgear player;
    removeGoggles player;
    if (KP_liberation_arsenal == 17) then {
        removeUniform player;
        player addUniform "vn_b_uniform_macv_04_01";
        player linkItem "vn_b_item_map";
        player linkItem "vn_b_item_compass";
        player linkItem "vn_b_item_watch";
        player linkItem "vn_b_item_radio_urc10";
    };
} else {
    sleep 4;
    [player, GRLIB_respawn_loadout] call KPLIB_fnc_setLoadout;
};

[] call KPLIB_fnc_addActionsPlayer;

// Support Module handling
if ([
    false,
    player isEqualTo ([] call KPLIB_fnc_getCommander) || (getPlayerUID player) in KP_liberation_suppMod_whitelist,
    true
] select KP_liberation_suppMod) then {
    waitUntil {!isNil "KPLIB_suppMod_req" && !isNil "KPLIB_suppMod_arty" && time > 5};

    // Remove link to corpse, if respawned
    if (!isNull _oldUnit) then {
        KPLIB_suppMod_req synchronizeObjectsRemove [_oldUnit];
        _oldUnit synchronizeObjectsRemove [KPLIB_suppMod_req];
    };

    // Link player to support modules
    [player, KPLIB_suppMod_req, KPLIB_suppMod_arty] call BIS_fnc_addSupportLink;

    // Init modules, if newly joined and not client host
    if (isNull _oldUnit && !isServer) then {
        [KPLIB_suppMod_req] call BIS_fnc_moduleSupportsInitRequester;
        [KPLIB_suppMod_arty] call BIS_fnc_moduleSupportsInitProvider;
    };
};

// Cam Lao Nam SOGPF traits
if (worldName == "Cam_Lao_Nam") then {
    player setUnitTrait ["camouflageCoef", 0.6];
    player setUnitTrait ["audibleCoef", 0.3];
    player setUnitTrait ["loadCoef", 0.5];
};
