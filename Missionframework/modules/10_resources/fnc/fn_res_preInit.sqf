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

KPLIB_res_intel = 0;

// Large storage area placement position offsets.
KPLIB_storage_largeOffsets = [
    [-5.59961,3.60938,0.6],
    [-3.99902,3.60938,0.6],
    [-2.39941,3.60938,0.6],
    [-0.799805,3.60938,0.6],
    [0.800781,3.60938,0.6],
    [2.40039,3.60938,0.6],
    [4.00098,3.60938,0.6],
    [5.60059,3.60938,0.6],
    [-5.59961,1.80859,0.6],
    [-3.99902,1.80859,0.6],
    [-2.39941,1.80859,0.6],
    [-0.799805,1.80859,0.6],
    [0.800781,1.80859,0.6],
    [2.40039,1.80859,0.6],
    [4.00098,1.80859,0.6],
    [5.60059,1.80859,0.6],
    [-5.59961,0.00976563,0.6],
    [-3.99902,0.00976563,0.6],
    [-2.39941,0.00976563,0.6],
    [-0.799805,0.00976563,0.6],
    [0.800781,0.00976563,0.6],
    [2.40039,0.00976563,0.6],
    [4.00098,0.00976563,0.6],
    [5.60059,0.00976563,0.6],
    [-5.59961,-1.79102,0.6],
    [-3.99902,-1.79102,0.6],
    [-2.39941,-1.79102,0.6],
    [-0.799805,-1.79102,0.6],
    [0.800781,-1.79102,0.6],
    [2.40039,-1.79102,0.6],
    [4.00098,-1.79102,0.6],
    [5.60059,-1.79102,0.6],
    [-5.59961,-3.58984,0.6],
    [-3.99902,-3.58984,0.6],
    [-2.39941,-3.58984,0.6],
    [-0.799805,-3.58984,0.6],
    [0.800781,-3.58984,0.6],
    [2.40039,-3.58984,0.6],
    [4.00098,-3.58984,0.6],
    [5.60059,-3.58984,0.6]
];

// Small storage area placement position offsets.
KPLIB_storage_smallOffsets = [
    [-2.34961,1.80078,0.6],
    [-0.75,1.80078,0.6],
    [0.850586,1.80078,0.6],
    [2.4502,1.80078,0.6],
    [-2.34961,0,0.6],
    [-0.75,0,0.6],
    [0.850586,0,0.6],
    [2.4502,0,0.6],
    [-2.34961,-1.79883,0.6],
    [-0.75,-1.79883,0.6],
    [0.850586,-1.79883,0.6],
    [2.4502,-1.79883,0.6]
];

// Configuration settings for crates transported by vehicles ["classname", distance behind vehicle to unload crate, attachTo positions for each box].
KPLIB_transport_config = [
    ["BW_AW101_Trans_Heer_F", -6.5, [0,4.2,-1.45], [0,2.5,-1.45], [0,0.8,-1.45], [0,-0.9,-1.45]],
    ["BW_LKW7T_Trans_F", -6.5, [0,-0.8,0.4], [0,-2.4,0.4], [0,-4.0,0.4]],
    ["B_Heli_Transport_03_F", -7.5, [0,2.2,-1], [0,0.5,-1], [0,-1.2,-1]],
    ["B_Heli_Transport_03_unarmed_F", -7.5, [0,2.2,-1], [0,0.5,-1], [0,-1.2,-1]],
    ["B_T_Truck_01_covered_F", -6.5, [0,-0.4,0.4], [0,-2.1,0.4], [0,-3.8,0.4]],
    ["B_T_Truck_01_transport_F", -6.5, [0,-0.4,0.4], [0,-2.1,0.4], [0,-3.8,0.4]],
    ["B_T_VTOL_01_infantry_F", -7.5, [0,4.7,-4.88], [0,3,-4.88], [0,1.3,-4.88], [0,-0.4,-4.88], [0,-2.1,-4.88]],
    ["B_T_VTOL_01_vehicle_F", -7.5, [0,4.7,-4.88], [0,3,-4.88], [0,1.3,-4.88], [0,-0.4,-4.88], [0,-2.1,-4.88]],
    ["B_Truck_01_covered_F", -6.5, [0,-0.4,0.4], [0,-2.1,0.4], [0,-3.8,0.4]],
    ["B_Truck_01_transport_F", -6.5, [0,-0.4,0.4], [0,-2.1,0.4], [0,-3.8,0.4]],
    ["CUP_B_Wolfhound_GMG_GB_W", -6.5, [0,-3.5,2.3]],
    ["CUP_B_Wolfhound_HMG_GB_W", -6.5, [0,-3.5,2.3]],
    ["CUP_B_Wolfhound_LMG_GB_W", -6.5, [0,-3.5,2.3]],
    ["C_Offroad_01_F", -6.5, [0,-1.7,0.4]],
    ["C_Truck_02_covered_F", -6.5, [0,0.3,0.05], [0,-1.3,0.05], [0,-2.9,0.05]],
    ["C_Truck_02_transport_F", -6.5, [0,0.3,0.05], [0,-1.3,0.05], [0,-2.9,0.05]],
    ["C_Van_01_transport_F", -6.5, [0,-1.1,0.25], [0,-2.6,0.25]],
    ["I_C_Van_01_transport_F", -6.5, [0,-1.1,0.25], [0,-2.6,0.25]],
    ["I_G_Offroad_01_F", -6.5, [0,-1.7,0.4]],
    ["I_G_Van_01_transport_F", -6.5, [0,-1.1,0.25], [0,-2.6,0.25]],
    ["I_Heli_Transport_02_F", -6.5, [0,4.2,-1.45], [0,2.5,-1.45], [0,0.8,-1.45], [0,-0.9,-1.45]],
    ["LOP_TAK_Civ_Ural", -6.5, [0,-0.2,0.55], [0,-1.4,0.55], [0,-2.55,0.55]],
    ["LOP_TAK_Civ_Ural_open", -6.5, [0,-0.2,0.55], [0,-1.4,0.55], [0,-2.55,0.55]],
    ["O_G_Offroad_01_F", -6.5, [0,-1.7,0.4]],
    ["O_G_Van_01_transport_F", -6.5, [0,-1.1,0.25], [0,-2.6,0.25]],
    ["O_T_Truck_03_covered_ghex_F", -6.5, [0,-0.8,0.4], [0,-2.4,0.4], [0,-4.0,0.4]],
    ["O_T_Truck_03_transport_ghex_F", -6.5, [0,-0.8,0.4], [0,-2.4,0.4], [0,-4.0,0.4]],
    ["O_Truck_03_covered_F", -6.5, [0,-0.8,0.4], [0,-2.4,0.4], [0,-4.0,0.4]],
    ["O_Truck_03_transport_F", -6.5, [0,-0.8,0.4], [0,-2.4,0.4], [0,-4.0,0.4]],
    ["RHS_CH_47F", -7.5, [0,2.2,-1.7], [0,0.5,-1.7], [0,-1.2,-1.7]],
    ["RHS_CH_47F_10", -7.5, [0,2.2,-1.7], [0,0.5,-1.7], [0,-1.2,-1.7]],
    ["RHS_CH_47F_light", -7.5, [0,2.2,-1.7], [0,0.5,-1.7], [0,-1.2,-1.7]],
    ["RHS_Ural_Civ_03", -6.5, [0,-0.2,0.55], [0,-1.4,0.55], [0,-2.55,0.55]],
    ["RHS_Ural_MSV_01", -6.5, [0,-0.2,0.55], [0,-1.4,0.55], [0,-2.55,0.55]],
    ["RHS_Ural_Open_Civ_03", -6.5, [0,-0.2,0.55], [0,-1.4,0.55], [0,-2.55,0.55]],
    ["RHS_Ural_Open_MSV_01", -6.5, [0,-0.2,0.55], [0,-1.4,0.55], [0,-2.55,0.55]],
    ["UK3CB_BAF_Merlin_HC3_18_DPMT", -7.5, [0.25,3.7,-1.5], [0.25,1.6,-1.5], [0.25,-0.4,-1.5]],
    ["UK3CB_BAF_Merlin_HC3_32_MTP", -7.5, [0.25,3.7,-1.5], [0.25,1.6,-1.5], [0.25,-0.4,-1.5]],
    ["UK3CB_BAF_Merlin_HC3_CSAR_MTP", -7.5, [0.25,3.7,-1.5], [0.25,1.6,-1.5], [0.25,-0.4,-1.5]],
    ["greuh_eh101_gr", -6.5, [0,4.2,-1.45], [0,2.5,-1.45], [0,0.8,-1.45], [0,-0.9,-1.45]],
    ["rhsusf_M1078A1P2_B_M2_d_flatbed_fmtv_usarmy", -5.0, [0,-0.2,0.45], [0,-1.9,0.45]],
    ["rhsusf_M1078A1P2_B_M2_wd_flatbed_fmtv_usarmy", -5.0, [0,-0.2,0.45], [0,-1.9,0.45]],
    ["rhsusf_M1078A1P2_d_flatbed_fmtv_usarmy", -5.0, [0,-0.2,0.45], [0,-1.9,0.45]],
    ["rhsusf_M1078A1P2_wd_flatbed_fmtv_usarmy", -5.0, [0,-0.2,0.45], [0,-1.9,0.45]],
    ["rhsusf_M1083A1P2_B_M2_d_flatbed_fmtv_usarmy", -5.0, [0,-0.2,0.45], [0,-1.9,0.45]],
    ["rhsusf_M1083A1P2_B_M2_wd_flatbed_fmtv_usarmy", -5.0, [0,-0.2,0.45], [0,-1.9,0.45]],
    ["rhsusf_M1083A1P2_d_fmtv_usarmy", -5.0, [0,-0.2,0.45], [0,-1.9,0.45]],
    ["rhsusf_M1083A1P2_d_open_fmtv_usarmy", -5.0, [0,-0.2,0.45], [0,-1.9,0.45]],
    ["rhsusf_M1083A1P2_wd_fmtv_usarmy", -5.0, [0,-0.2,0.45], [0,-1.9,0.45]],
    ["rhsusf_M1083A1P2_wd_open_fmtv_usarmy", -5.0, [0,-0.2,0.45], [0,-1.9,0.45]],
    ["rhsusf_M977A4_BKIT_M2_usarmy_d", -6.5, [0,0.4,0.7], [0,-1.3,0.7], [0,-3,0.7]],
    ["rhsusf_M977A4_BKIT_M2_usarmy_wd", -6.5, [0,0.4,0.7], [0,-1.3,0.7], [0,-3,0.7]],
    ["rhsusf_M977A4_BKIT_usarmy_d", -6.5, [0,0.4,1.4], [0,-1.3,1.4], [0,-3,1.4]],
    ["rhsusf_M977A4_BKIT_usarmy_wd", -6.5, [0,0.4,1.4], [0,-1.3,1.4], [0,-3,1.4]],
    ["rhsusf_m998_d_2dr_halftop", -4.5, [0,-0.9,-0.2]],
    ["rhsusf_m998_w_2dr_halftop", -4.5, [0,-0.9,-0.2]]
];


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
