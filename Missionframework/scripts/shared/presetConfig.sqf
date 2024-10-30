// BLUFOR
if (("BLUFORPreset" call BIS_fnc_getParamValue) != 0) then {
    KP_liberation_preset_blufor = (("BLUFORPreset" call BIS_fnc_getParamValue) - 1);
} else {
    KP_liberation_preset_blufor = KP_liberation_blufor_preset;
};

// OPFOR
if (("OPFORPreset" call BIS_fnc_getParamValue) != 0) then {
    KP_liberation_preset_opfor = (("OPFORPreset" call BIS_fnc_getParamValue) - 1);
} else {
    KP_liberation_preset_opfor = KP_liberation_opfor_preset;
};

// Resistance
if (("ResistancePreset" call BIS_fnc_getParamValue) != 0) then {
    KP_liberation_preset_resistance = (("guerPreset" call BIS_fnc_getParamValue) - 1);
} else {
    KP_liberation_preset_resistance = KP_liberation_resistance_preset;
};

// Civilian
if (("CivPreset" call BIS_fnc_getParamValue) != 0) then {
    KP_liberation_preset_civilians = (("civPreset" call BIS_fnc_getParamValue) - 1);
} else {
    KP_liberation_preset_civilians = KP_liberation_civilians_preset;
};

// Arsenal
if (("ArsenalPreset" call BIS_fnc_getParamValue) != 0) then {
    KP_liberation_arsenal = (("arsenalPreset" call BIS_fnc_getParamValue) - 1);
} else {
    KP_liberation_arsenal = KP_liberation_arsenal_choice;
};