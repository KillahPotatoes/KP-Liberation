/*
    File: roles_arsenal_config.sqf
    Author: PIG13BR (https://github.com/PiG13BR)
    Date: 26/07/2024
    Updated: 14/07/2025

    Description:
        Set up your arsenal inventory based on role selection in this file.
        Make any changes you want here, just don't change the name of variables with KPLIB tags.
    
    Parameter(s):
        _className - classname of the player's entity [STRING, defaults as ""]

    Returns:
        -
*/

params[["_classRole", "", [""]]];

// ---------------------------------------------------------- Variabes/classification of equipments to be used for the roles
// The already existed variables are suggestion, you can delete them all or used it, but make sure you configure them with the roles below in this file

// Weapons
_rifles_basic = [
   ""
];

_rifles_special = [
    ""
];

_rifles_granadier = [
    ""
];

_lmgs = [
    ""
];

_smgs = [
    ""
];

_rifles_marksman = [
    ""
];

_snipers = [
    ""
];

_shotguns = [
    ""
];

_pistols = [
    ""
];

_ace_metal_detector = [
    ""
];

//Bazookas
_launchers_HAT = [
    ""
];

_launchers_LAT = [
    ""
];

_discard_launchers = [
    ""
];

_launchers_AA = [
    ""
];

// Magazines
_mags = [
    ""
];

// Grenades & explosives
_grenades = [
    ""
];

_explosives = [
    "" 
];

// Weapons attachment
_rifles_optics = [
    ""
];

_lmgs_optics = [
    ""
];

_LAT_optics = [
    ""
];

_marksman_optics = [
    ""
];

_rail_attach = [
    ""
];

_muzzle_attach = [
    ""
];

_rifles_grip = [
    ""
];

_rifles_bipod = [
    ""
];

// Uniforms, Vests, helmets, backpacks, facewears
_uniforms = [
    ""
];

_uniforms_pilot = [
    ""
];

_uniforms_crewman = [
    ""
];

_vests = [
    ""
];

_vests_pilot = [
    ""
];

_vests_crewman = [
    ""
];

_helmets = [
    ""
];

_pilot_helmets = [
    ""
];

_crewman_helmets = [
    ""
];

_caps = [
    ""
];

_sniper_caps = [
    ""
];

_backpacks = [
    ""
];

_backpacks_radio = [
    ""
];

_big_backpacks = [
    ""
];

_facewears = [
    ""
];

// Nightvision
_nvgs = [
    ""
];

// Binoculars
_common_binos = [
    ""
];

_laser_binos = [
    ""
];

// Common tools & medic items
_ace_common_tools = [
    ""
];

_ace_eng_tools = [
    ""
];

_ace_common_medical_items = [
    ""
];

_ace_medic_items = [
    ""
];

_ace_misc = [
    ""
];

// Items & Communication
_common_items = [
    "ItemMap",
    "ItemGPS",
    "ItemCompass",
    "ItemWatch"
];

_radio = [ 
    ""
];

_uav_terminal = [
    "B_UavTerminal"
];

// ---------------------------------------------------------- Defined roles classnames
// The playable characters in the editor must match these classnames below
// Make any chances you want here, just make sure you register them in the switch do command below (after "case")
_commander = "B_officer_F";
_sqleader = "B_Soldier_SL_F";
_mg = "B_soldier_AR_F";
_rifleman = "B_Soldier_F";
_engineer = "B_engineer_F";
_medic = "B_medic_F";
_rifleman_LAT = "B_soldier_LAT2_F";
_rifleman_HAT = "B_soldier_AT_F";
_rifleman_AA = "B_soldier_AA_F";
_granadier = "B_Soldier_GL_F";
_marksman = "B_soldier_M_F";
_sniper = "B_Sharpshooter_F";
_pilot = "B_Helipilot_F";
_crewman = "B_crew_F";
_uav_operator = "B_soldier_UAV_F";
_spotter = "B_Soldier_lite_F";

// If the right class is provided, fill the KPLIB arrays with items
switch (_classRole) do {
        case _commander : {
        // Put all weapons here
        KPLIB_arsenalWeapons = (_rifles_basic + _pistols);
        // Put all Magazines, and throwable items such as grenades
        KPLIB_arsenalMagazines = (_mags + _grenades);
        // Put here uniforms, vests, facemasks, nvgs, binoculares, medical items, tool items, attachments...
        KPLIB_arsenalItems = (_uniforms + _uniforms_pilot + _vests + _vests_pilot + _helmets + _caps + _pilot_helmets + _facewears + _rifles_optics + _rail_attach + _muzzle_attach + _rifles_grip + _common_binos + _laser_binos + _ace_common_tools + _ace_common_medical_items + _common_items + _radio + _ace_misc + _nvgs);
        // Put only backpacks here
        KPLIB_arsenalBackpacks = (_backpacks_radio + _backpacks);
        };
        case _sqleader : {
                // Put all weapons here
        KPLIB_arsenalWeapons = (_rifles_basic + _pistols);
        // Put all Magazines, and throwable items such as grenades
        KPLIB_arsenalMagazines = (_mags + _grenades);
        // Put here uniforms, vests, facemasks, nvgs, binoculares, medical items, tool items, attachments...
        KPLIB_arsenalItems = (_uniforms + _vests + _helmets + _facewears + _rifles_optics + _rail_attach + _muzzle_attach + _rifles_grip + _nvgs + _common_binos + _laser_binos + _ace_common_tools + _ace_common_medical_items + _common_items + _radio + _ace_misc + _nvgs);
        // Put only backpacks here
        KPLIB_arsenalBackpacks = (_backpacks_radio + _backpacks);
        };
        case _mg : {
                // Put all weapons here
        KPLIB_arsenalWeapons = (_lmgs);
        // Put all Magazines, and throwable items such as grenades
        KPLIB_arsenalMagazines = (_mags + _grenades);
        // Put here uniforms, vests, facemasks, nvgs, binoculares, medical items, tool items, attachments...
        KPLIB_arsenalItems = (_uniforms + _vests + _helmets + _facewears + _lmgs_optics + _rail_attach + _muzzle_attach + _rifles_bipod + _nvgs + _common_binos + _ace_common_tools + _ace_common_medical_items + _common_items + _radio + _ace_misc + _nvgs);
        // Put only backpacks here
        KPLIB_arsenalBackpacks = _backpacks;
        };
        case _rifleman : {
                // Put all weapons here
        KPLIB_arsenalWeapons = (_rifles_basic + _pistols);
        // Put all Magazines, and throwable items such as grenades
        KPLIB_arsenalMagazines = (_mags + _grenades);
        // Put here uniforms, vests, facemasks, nvgs, binoculares, medical items, tool items, attachments...
        KPLIB_arsenalItems = (_uniforms + _vests + _helmets + _facewears + _rifles_optics + _rail_attach + _muzzle_attach + _rifles_grip + _nvgs + _common_binos + _ace_common_tools + _ace_common_medical_items + _common_items + _radio + _ace_misc + _nvgs);
        // Put only backpacks here
        KPLIB_arsenalBackpacks = _backpacks;
        };
        case _medic : {
                // Put all weapons here
        KPLIB_arsenalWeapons = (_rifles_basic + _pistols);
        // Put all Magazines, and throwable items such as grenades
        KPLIB_arsenalMagazines = (_mags + _grenades);
        // Put here uniforms, vests, facemasks, nvgs, binoculares, medical items, tool items, attachments...
        KPLIB_arsenalItems = (_uniforms + _vests + _helmets + _facewears + _rifles_optics + _rail_attach + _rifles_grip + _common_binos + _ace_common_tools + _ace_common_medical_items + _common_items + _radio + _ace_misc + _ace_medic_items + _nvgs);
        // Put only backpacks here
        KPLIB_arsenalBackpacks = (_backpacks + _big_backpacks);
        };
        case _engineer : {
        // Put all weapons here
        KPLIB_arsenalWeapons = (_rifles_basic + _pistols + _metal_detector);
        // Put all Magazines, and throwable items such as grenades
        KPLIB_arsenalMagazines = (_mags + _grenades + _explosives);
        // Put here uniforms, vests, facemasks, nvgs, binoculares, medical items, tool items, attachments...
        KPLIB_arsenalItems = (_uniforms + _vests + _helmets + _facewears + _rifles_optics + _rail_attach + _rifles_grip + _common_binos + _ace_common_tools + _ace_common_medical_items + _common_items + _radio + _ace_misc + _ace_eng_tools + _nvgs);
        // Put only backpacks here
        KPLIB_arsenalBackpacks = (_backpacks + _big_backpacks);
        };
        case _rifleman_LAT : {
        // Put all weapons here
        KPLIB_arsenalWeapons = (_rifles_basic + _pistols + _discard_launchers + _launchers_LAT);
        // Put all Magazines, and throwable items such as grenades
        KPLIB_arsenalMagazines = (_mags + _grenades);
        // Put here uniforms, vests, facemasks, nvgs, binoculares, medical items, tool items, attachments...
        KPLIB_arsenalItems = (_uniforms + _vests + _helmets + _facewears + _rifles_optics + _rail_attach + _rifles_grip + _common_binos + _ace_common_tools + _ace_common_medical_items + _common_items + _radio + _ace_misc + _nvgs);
        // Put only backpacks here
        KPLIB_arsenalBackpacks = _backpacks;
        };
        case _rifleman_HAT : {
        // Put all weapons here
        KPLIB_arsenalWeapons = (_rifles_basic + _launchers_HAT);
        // Put all Magazines, and throwable items such as grenades
        KPLIB_arsenalMagazines = (_mags + _grenades);
        // Put here uniforms, vests, facemasks, nvgs, binoculares, medical items, tool items, attachments...
        KPLIB_arsenalItems = (_uniforms + _vests + _helmets + _facewears + _rifles_optics + _rail_attach + _rifles_grip + _common_binos + _ace_common_tools + _ace_common_medical_items + _common_items + _radio + _ace_misc + _nvgs);
        // Put only backpacks here
        KPLIB_arsenalBackpacks = _backpacks;
        };
        case _rifleman_AA : {
                // Put all weapons here
        KPLIB_arsenalWeapons = (_rifles_basic + _pistols + _launchers_AA);
        // Put all Magazines, and throwable items such as grenades
        KPLIB_arsenalMagazines = (_mags + _grenades);
        // Put here uniforms, vests, facemasks, nvgs, binoculares, medical items, tool items, attachments...
        KPLIB_arsenalItems = (_uniforms + _vests + _helmets + _facewears + _rifles_optics + _rail_attach + _rifles_grip + _common_binos + _ace_common_tools + _ace_common_medical_items + _common_items + _radio + _ace_misc + _LAT_optics + _nvgs);
        // Put only backpacks here
        KPLIB_arsenalBackpacks = _backpacks;
        };
        case _granadier : {
        // Put all weapons here
        KPLIB_arsenalWeapons = (_rifles_granadier + _pistols);
        // Put all Magazines, and throwable items such as grenades
        KPLIB_arsenalMagazines = (_mags + _grenades);
        // Put here uniforms, vests, facemasks, nvgs, binoculares, medical items, tool items, attachments...
        KPLIB_arsenalItems = (_uniforms + _vests + _helmets + _facewears + _rifles_optics + _rail_attach + _rifles_grip + _common_binos + _ace_common_tools + _ace_common_medical_items + _common_items + _radio + _ace_misc + _nvgs);
        // Put only backpacks here
        KPLIB_arsenalBackpacks = _backpacks;
        };
        case _marksman : {
        // Put all weapons here
        KPLIB_arsenalWeapons = (_rifles_marksman + _pistols);
        // Put all Magazines, and throwable items such as grenades
        KPLIB_arsenalMagazines = (_mags + _grenades);
        // Put here uniforms, vests, facemasks, nvgs, binoculares, medical items, tool items, attachments...
        KPLIB_arsenalItems = (_uniforms + _vests + _helmets + _facewears + _marksman_optics + _rail_attach + _muzzle_attach + _rifles_bipod + _nvgs + _common_binos + _ace_common_tools + _ace_common_medical_items + _common_items + _radio + _ace_misc + _nvgs);
        // Put only backpacks here
        KPLIB_arsenalBackpacks = _backpacks;
        };
        case _sniper : {
        // Put all weapons here
        KPLIB_arsenalWeapons = (_snipers + _pistols);
        // Put all Magazines, and throwable items such as grenades
        KPLIB_arsenalMagazines = (_mags + _grenades);
        // Put here uniforms, vests, facemasks, nvgs, binoculares, medical items, tool items, attachments...
        KPLIB_arsenalItems = (_uniforms + _vests + _helmets + _sniper_caps + _facewears + _marksman_optics + _rail_attach + _muzzle_attach + _rifles_bipod + _nvgs + _common_binos + _ace_common_tools + _ace_common_medical_items + _common_items + _radio + _ace_misc + _nvgs);
        // Put only backpacks here
        KPLIB_arsenalBackpacks = _backpacks;
        };
        case _pilot : {
        // Put all weapons here
        KPLIB_arsenalWeapons = (_smgs + _pistols);
        // Put all Magazines, and throwable items such as grenades
        KPLIB_arsenalMagazines = (_mags + _grenades);
        // Put here uniforms, vests, facemasks, nvgs, binoculares, medical items, tool items, attachments...
        KPLIB_arsenalItems = (_uniforms_pilot + _vests_pilot + _pilot_helmets + _facewears + _rifles_optics + _rail_attach + _rifles_grip + _common_binos + _ace_common_tools + _ace_common_medical_items + _common_items + _radio + _ace_misc + _nvgs);
        // Put only backpacks here
        KPLIB_arsenalBackpacks = (_backpacks + _backpacks_radio);
        };
        case _crewman : {
        // Put all weapons here
        KPLIB_arsenalWeapons = (_smgs + _pistols);
        // Put all Magazines, and throwable items such as grenades
        KPLIB_arsenalMagazines = (_mags + _grenades);
        // Put here uniforms, vests, facemasks, nvgs, binoculares, medical items, tool items, attachments...
        KPLIB_arsenalItems = (_uniforms_crewman + _vests_crewman + _crewman_helmets + _facewears + _rifles_optics + _rail_attach + _rifles_grip + _nvgs + _common_binos + _ace_common_tools + _ace_common_medical_items + _common_items + _radio + _ace_misc + _ace_eng_tools + _nvgs);
        // Put only backpacks here
        KPLIB_arsenalBackpacks = (_backpacks + _backpacks_radio);
        };
        case _uav_operator : {
        // Put all weapons here
        KPLIB_arsenalWeapons = (_rifles_basic + _pistols);
        // Put all Magazines, and throwable items such as grenades
        KPLIB_arsenalMagazines = (_mags + _grenades);
        // Put here uniforms, vests, facemasks, nvgs, binoculares, medical items, tool items, attachments...
        KPLIB_arsenalItems = (_uniforms + _vests + _helmets + _facewears + _rifles_optics + _rail_attach + _muzzle_attach + _rifles_grip + _nvgs + _common_binos + _ace_common_tools + _ace_common_medical_items + _common_items + _radio + _ace_misc + _uav_terminal + _nvgs);
        // Put only backpacks here
        KPLIB_arsenalBackpacks = (_backpacks_radio + _backpacks);
        };
        case _spotter : {
        // Put all weapons here
        KPLIB_arsenalWeapons = (_rifles_basic + _pistols);
        // Put all Magazines, and throwable items such as grenades
        KPLIB_arsenalMagazines = (_mags + _grenades);
        // Put here uniforms, vests, facemasks, nvgs, binoculares, medical items, tool items, attachments...
        KPLIB_arsenalItems = (_uniforms + _vests + _helmets + _caps + _facewears + _rifles_optics + _rail_attach + _muzzle_attach + _rifles_grip + _commom_binos + _laser_binos + _ace_commom_tools + _ace_commom_medical_items + _commom_items + _radio + _ace_misc + _nvgs);
        // Put only backpacks here
        KPLIB_arsenalBackpacks = (_backpacks_radio + _backpacks);
                
        };
        case default {	
        ["This classname doesn't match with a configurated classname from roles_arsenal_config.sqf"] call bis_fnc_error
        }
};
