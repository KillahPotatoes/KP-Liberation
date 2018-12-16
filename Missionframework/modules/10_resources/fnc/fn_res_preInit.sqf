/*
    KPLIB_fnc_res_preInit

    File: fn_res_preInit.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-12-13
    Last Update: 2018-12-16
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        The preInit function defines global variables, adds event handlers and set some vital settings which are used in this module.

    Parameter(s):
        NONE

    Returns:
        Module preInit finished [BOOL]
*/

if (isServer) then {diag_log format ["[KP LIBERATION] [%1] [PRE] [RESOURCES] Module initializing...", diag_tickTime];};

/*
    ----- Module Globals -----
*/

// Intel currency resource amount
KPLIB_res_intel = 0;

// Large storage area placement position offsets.
KPLIB_res_storageOffsetsLarge = [
    [ -5.59961,        3.60938,     0.6],
    [ -3.99902,        3.60938,     0.6],
    [ -2.39941,        3.60938,     0.6],
    [-0.799805,        3.60938,     0.6],
    [ 0.800781,        3.60938,     0.6],
    [  2.40039,        3.60938,     0.6],
    [  4.00098,        3.60938,     0.6],
    [  5.60059,        3.60938,     0.6],
    [ -5.59961,        1.80859,     0.6],
    [ -3.99902,        1.80859,     0.6],
    [ -2.39941,        1.80859,     0.6],
    [-0.799805,        1.80859,     0.6],
    [ 0.800781,        1.80859,     0.6],
    [  2.40039,        1.80859,     0.6],
    [  4.00098,        1.80859,     0.6],
    [  5.60059,        1.80859,     0.6],
    [ -5.59961,     0.00976563,     0.6],
    [ -3.99902,     0.00976563,     0.6],
    [ -2.39941,     0.00976563,     0.6],
    [-0.799805,     0.00976563,     0.6],
    [ 0.800781,     0.00976563,     0.6],
    [  2.40039,     0.00976563,     0.6],
    [  4.00098,     0.00976563,     0.6],
    [  5.60059,     0.00976563,     0.6],
    [ -5.59961,       -1.79102,     0.6],
    [ -3.99902,       -1.79102,     0.6],
    [ -2.39941,       -1.79102,     0.6],
    [-0.799805,        1.79102,     0.6],
    [ 0.800781,        1.79102,     0.6],
    [  2.40039,       -1.79102,     0.6],
    [  4.00098,       -1.79102,     0.6],
    [  5.60059,       -1.79102,     0.6],
    [ -5.59961,       -3.58984,     0.6],
    [ -3.99902,       -3.58984,     0.6],
    [ -2.39941,       -3.58984,     0.6],
    [-0.799805,        3.58984,     0.6],
    [ 0.800781,        3.58984,     0.6],
    [  2.40039,       -3.58984,     0.6],
    [  4.00098,       -3.58984,     0.6],
    [  5.60059,       -3.58984,     0.6]
];

// Small storage area placement position offsets.
KPLIB_res_storageOffsetsSmall = [
    [ -2.34961,        1.80078,     0.6],
    [    -0.75,        1.80078,     0.6],
    [ 0.850586,        1.80078,     0.6],
    [   2.4502,        1.80078,     0.6],
    [ -2.34961,              0,     0.6],
    [    -0.75,              0,     0.6],
    [ 0.850586,              0,     0.6],
    [   2.4502,              0,     0.6],
    [ -2.34961,       -1.79883,     0.6],
    [    -0.75,       -1.79883,     0.6],
    [ 0.850586,       -1.79883,     0.6],
    [   2.4502,       -1.79883,     0.6]
];

// Configuration settings for crates transported by vehicles ["classname", distance from vehicle center to unload crate, attachTo positions for each box].
// Set and filtered on the server
if (isServer) then {
    KPLIB_res_transportConfigs = [[
        ["B_Heli_Transport_03_F",                        7.5, [[0.00,  2.20, -1.00], [0.00,  0.50, -1.00], [0.00, -1.20, -1.00]                                            ]],
        ["B_Heli_Transport_03_unarmed_F",                7.5, [[0.00,  2.20, -1.00], [0.00,  0.50, -1.00], [0.00, -1.20, -1.00]                                            ]],
        ["B_T_Truck_01_covered_F",                       6.5, [[0.00, -0.40,  0.40], [0.00, -2.10,  0.40], [0.00, -3.80,  0.40]                                            ]],
        ["B_T_Truck_01_transport_F",                     6.5, [[0.00, -0.40,  0.40], [0.00, -2.10,  0.40], [0.00, -3.80,  0.40]                                            ]],
        ["B_T_VTOL_01_infantry_F",                       7.5, [[0.00,  4.70, -4.88], [0.00,  3.00, -4.88], [0.00,  1.30, -4.88], [0.00, -0.40, -4.88], [0.00, -2.10, -4.88]]],
        ["B_T_VTOL_01_vehicle_F",                        7.5, [[0.00,  4.70, -4.88], [0.00,  3.00, -4.88], [0.00,  1.30, -4.88], [0.00, -0.40, -4.88], [0.00, -2.10, -4.88]]],
        ["B_Truck_01_covered_F",                         6.5, [[0.00, -0.40,  0.40], [0.00, -2.10,  0.40], [0.00, -3.80,  0.40]                                            ]],
        ["B_Truck_01_transport_F",                       6.5, [[0.00, -0.40,  0.40], [0.00, -2.10,  0.40], [0.00, -3.80,  0.40]                                            ]],
        ["CUP_B_Wolfhound_GMG_GB_W",                     6.5, [[0.00, -3.50,  2.30]                                                                                        ]],
        ["CUP_B_Wolfhound_HMG_GB_W",                     6.5, [[0.00, -3.50,  2.30]                                                                                        ]],
        ["CUP_B_Wolfhound_LMG_GB_W",                     6.5, [[0.00, -3.50,  2.30]                                                                                        ]],
        ["C_Offroad_01_F",                               6.5, [[0.00, -1.70,  0.40]                                                                                        ]],
        ["C_Truck_02_covered_F",                         6.5, [[0.00,  0.30,  0.05], [0.00, -1.30,  0.05], [0.00, -2.90,  0.05]                                            ]],
        ["C_Truck_02_transport_F",                       6.5, [[0.00,  0.30,  0.05], [0.00, -1.30,  0.05], [0.00, -2.90,  0.05]                                            ]],
        ["C_Van_01_transport_F",                         6.5, [[0.00, -1.10,  0.25], [0.00, -2.60,  0.25]                                                                  ]],
        ["I_C_Van_01_transport_F",                       6.5, [[0.00, -1.10,  0.25], [0.00, -2.60,  0.25]                                                                  ]],
        ["I_G_Offroad_01_F",                             6.5, [[0.00, -1.70,  0.40]                                                                                        ]],
        ["I_G_Van_01_transport_F",                       6.5, [[0.00, -1.10,  0.25], [0.00, -2.60,  0.25]                                                                  ]],
        ["I_Heli_Transport_02_F",                        6.5, [[0.00,  4.20, -1.45], [0.00,  2.50, -1.45], [0.00,  0.80, -1.45], [0.00, -0.90, -1.45]                      ]],
        ["LOP_TAK_Civ_Ural",                             6.5, [[0.00, -0.20,  0.55], [0.00, -1.40,  0.55], [0.00, -2.55,  0.55]                                            ]],
        ["LOP_TAK_Civ_Ural_open",                        6.5, [[0.00, -0.20,  0.55], [0.00, -1.40,  0.55], [0.00, -2.55,  0.55]                                            ]],
        ["O_G_Offroad_01_F",                             6.5, [[0.00, -1.70,  0.40]                                                                                        ]],
        ["O_G_Van_01_transport_F",                       6.5, [[0.00, -1.10,  0.25], [0.00, -2.60,  0.25]                                                                  ]],
        ["O_T_Truck_03_covered_ghex_F",                  6.5, [[0.00, -0.80,  0.40], [0.00, -2.40,  0.40], [0.00, -4.00,  0.40]                                            ]],
        ["O_T_Truck_03_transport_ghex_F",                6.5, [[0.00, -0.80,  0.40], [0.00, -2.40,  0.40], [0.00, -4.00,  0.40]                                            ]],
        ["O_Truck_03_covered_F",                         6.5, [[0.00, -0.80,  0.40], [0.00, -2.40,  0.40], [0.00, -4.00,  0.40]                                            ]],
        ["O_Truck_03_transport_F",                       6.5, [[0.00, -0.80,  0.40], [0.00, -2.40,  0.40], [0.00, -4.00,  0.40]                                            ]],
        ["RHS_CH_47F",                                   7.5, [[0.00,  2.20, -1.70], [0.00,  0.50, -1.70], [0.00, -1.20, -1.70]                                            ]],
        ["RHS_CH_47F_10",                                7.5, [[0.00,  2.20, -1.70], [0.00,  0.50, -1.70], [0.00, -1.20, -1.70]                                            ]],
        ["RHS_CH_47F_light",                             7.5, [[0.00,  2.20, -1.70], [0.00,  0.50, -1.70], [0.00, -1.20, -1.70]                                            ]],
        ["RHS_Ural_Civ_03",                              6.5, [[0.00, -0.20,  0.55], [0.00, -1.40,  0.55], [0.00, -2.55,  0.55]                                            ]],
        ["RHS_Ural_MSV_01",                              6.5, [[0.00, -0.20,  0.55], [0.00, -1.40,  0.55], [0.00, -2.55,  0.55]                                            ]],
        ["RHS_Ural_Open_Civ_03",                         6.5, [[0.00, -0.20,  0.55], [0.00, -1.40,  0.55], [0.00, -2.55,  0.55]                                            ]],
        ["RHS_Ural_Open_MSV_01",                         6.5, [[0.00, -0.20,  0.55], [0.00, -1.40,  0.55], [0.00, -2.55,  0.55]                                            ]],
        ["UK3CB_BAF_Merlin_HC3_18_DPMT",                 7.5, [[0.25,  3.70, -1.50], [0.25,  1.60, -1.50], [0.25, -0.40, -1.50]                                            ]],
        ["UK3CB_BAF_Merlin_HC3_32_MTP",                  7.5, [[0.25,  3.70, -1.50], [0.25,  1.60, -1.50], [0.25, -0.40, -1.50]                                            ]],
        ["UK3CB_BAF_Merlin_HC3_CSAR_MTP",                7.5, [[0.25,  3.70, -1.50], [0.25,  1.60, -1.50], [0.25, -0.40, -1.50]                                            ]],
        ["rhsusf_M1078A1P2_B_M2_d_flatbed_fmtv_usarmy",  5.0, [[0.00, -0.20,  0.45], [0.00, -1.90,  0.45]                                                                  ]],
        ["rhsusf_M1078A1P2_B_M2_wd_flatbed_fmtv_usarmy", 5.0, [[0.00, -0.20,  0.45], [0.00, -1.90,  0.45]                                                                  ]],
        ["rhsusf_M1078A1P2_d_flatbed_fmtv_usarmy",       5.0, [[0.00, -0.20,  0.45], [0.00, -1.90,  0.45]                                                                  ]],
        ["rhsusf_M1078A1P2_wd_flatbed_fmtv_usarmy",      5.0, [[0.00, -0.20,  0.45], [0.00, -1.90,  0.45]                                                                  ]],
        ["rhsusf_M1083A1P2_B_M2_d_flatbed_fmtv_usarmy",  5.0, [[0.00, -0.20,  0.45], [0.00, -1.90,  0.45]                                                                  ]],
        ["rhsusf_M1083A1P2_B_M2_wd_flatbed_fmtv_usarmy", 5.0, [[0.00, -0.20,  0.45], [0.00, -1.90,  0.45]                                                                  ]],
        ["rhsusf_M1083A1P2_d_fmtv_usarmy",               5.0, [[0.00, -0.20,  0.45], [0.00, -1.90,  0.45]                                                                  ]],
        ["rhsusf_M1083A1P2_d_open_fmtv_usarmy",          5.0, [[0.00, -0.20,  0.45], [0.00, -1.90,  0.45]                                                                  ]],
        ["rhsusf_M1083A1P2_wd_fmtv_usarmy",              5.0, [[0.00, -0.20,  0.45], [0.00, -1.90,  0.45]                                                                  ]],
        ["rhsusf_M1083A1P2_wd_open_fmtv_usarmy",         5.0, [[0.00, -0.20,  0.45], [0.00, -1.90,  0.45]                                                                  ]],
        ["rhsusf_M977A4_BKIT_M2_usarmy_d",               6.5, [[0.00,  0.40,  0.70], [0.00, -1.30,  0.70], [0.00, -3.00,  0.70]                                            ]],
        ["rhsusf_M977A4_BKIT_M2_usarmy_wd",              6.5, [[0.00,  0.40,  0.70], [0.00, -1.30,  0.70], [0.00, -3.00,  0.70]                                            ]],
        ["rhsusf_M977A4_BKIT_usarmy_d",                  6.5, [[0.00,  0.40,  1.40], [0.00, -1.30,  1.40], [0.00, -3.00,  1.40]                                            ]],
        ["rhsusf_M977A4_BKIT_usarmy_wd",                 6.5, [[0.00,  0.40,  1.40], [0.00, -1.30,  1.40], [0.00, -3.00,  1.40]                                            ]],
        ["rhsusf_m998_d_2dr_halftop",                    4.5, [[0.00, -0.90, -0.20]                                                                                        ]],
        ["rhsusf_m998_w_2dr_halftop",                    4.5, [[0.00, -0.90, -0.20]                                                                                        ]]
    ]] call KPLIB_fnc_init_filterMods;

    // Plain transport vehicle classnames array
    KPLIB_res_transportVehicles = [];
    {
        KPLIB_res_transportVehicles pushBack (_x select 0);
    } forEach KPLIB_res_transportConfigs;

    // Send filtered lists to clients
    publicVariable "KPLIB_res_transportConfigs";
    publicVariable "KPLIB_res_transportVehicles";
};


/*
    ----- Module Initialization -----
*/

// Process CBA Settings
[] call KPLIB_fnc_res_settings;

// Server section (dedicated and player hosted)
if (isServer) then {
    // Register load event handler
    ["KPLIB_doLoad", {[] call KPLIB_fnc_res_loadData;}] call CBA_fnc_addEventHandler;

    // Register save event handler
    ["KPLIB_doSave", {[] call KPLIB_fnc_res_saveData;}] call CBA_fnc_addEventHandler;

    // Adding actions to spawned crates and storages
    ["KPLIB_vehicle_spawned", {[_this select 0] call KPLIB_fnc_res_addActions}] call CBA_fnc_addEventHandler;

    // Some globals defined here on the server as the used preset variables aren't present on the clients yet but needed in initial loading
    // All valid crate classnames
    KPLIB_res_crateClasses = [
        KPLIB_preset_crateSupplyF,
        KPLIB_preset_crateAmmoF,
        KPLIB_preset_crateFuelF,
        KPLIB_preset_crateSupplyE,
        KPLIB_preset_crateAmmoE,
        KPLIB_preset_crateFuelE
    ];

    // All valid storage classnames
    KPLIB_res_storageClasses = [
        KPLIB_preset_storageSmallE,
        KPLIB_preset_storageSmallF,
        KPLIB_preset_storageLargeE,
        KPLIB_preset_storageLargeF
    ];

    // Publish variables to clients
    publicVariable "KPLIB_res_crateClasses";
    publicVariable "KPLIB_res_storageClasses";

    // Array for all spawned resource crates
    KPLIB_res_allCrates = [];

    // Array for all storages
    KPLIB_res_allStorages = [];
};

// HC section
if (!hasInterface && !isDedicated) then {

};

// Player section
if (hasInterface) then {

};

if (isServer) then {diag_log format ["[KP LIBERATION] [%1] [PRE] [RESOURCES] Module initialized", diag_tickTime];};

true
