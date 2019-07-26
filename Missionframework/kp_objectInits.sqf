/* - Specific object init codes depending on classnames.
Format = [Array of classnames as strings, Code to apply]
_this is the reference to the object with the classname */

KPLIB_objectInits = [
    // Set KP logo on white flag
    [["Flag_White_F"], {_this setFlagTexture "res\flag_kp_co.paa";}],

    // Add helipads to zeus, as they can't be recycled after built
    [["Land_HelipadSquare_F", "Land_HelipadCircle_F", "Land_HelipadRescue_F", "LAND_uns_Heli_pad", "Helipad", "LAND_uns_evac_pad", "LAND_uns_Heli_H"], {{[_x, [[_this], true]] remoteExecCall ["addCuratorEditableObjects", 2]} forEach allCurators;}],

    // Add ViV action to FOB box
    [[FOB_box_typename], {_this call F_setFobMass; [_this] remoteExecCall ["F_setLoadableViV", 0, _this];}],

    // Add storage type variable to built storage areas (only for FOB built/loaded ones)
    [[KP_liberation_small_storage_building, KP_liberation_large_storage_building], {_this setVariable ["KP_liberation_storage_type", 0, true];}],

    // Add ACE variables to corresponding building types
    [[KP_liberation_recycle_building], {_this setVariable ["ace_isRepairFacility", 1, true];}],
    [KP_liberation_medical_facilities, {_this setVariable ["ace_medical_isMedicalFacility", true, true];}],
    [KP_liberation_medical_vehicles, {_this setVariable ["ace_medical_medicClass", 1, true];}],

    // Hide Cover on big GM trucks
    [["gm_ge_army_kat1_454_cargo", "gm_ge_army_kat1_454_cargo_win"], {_this animateSource ["cover_unhide", 0, true];}]
];
