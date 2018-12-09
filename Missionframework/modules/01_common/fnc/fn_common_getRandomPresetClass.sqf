/*
    KPLIB_fnc_common_getRandomPresetClass

    File: fn_common_getRandomPresetClass.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-12-08
    Last Update: 2018-12-09
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Gets random class of given type from preset.

    Parameter(s):
        _type - Preset type name    [STRING, defaults to ""]
        _side - Preset side         [SIDE, defaults to KPLIB_preset_sideEnemy]

    Returns:
        Classname from preset [STRING]
*/
params [
    ["_type", "", [""]],
    ["_side", KPLIB_preset_sideEnemy, [sideEmpty]]
];

// Determine classname side
private _sideSuffix = switch (_side) do {
    case KPLIB_preset_sideF: {"F"};
    case KPLIB_preset_sideR: {"R"};
    case KPLIB_preset_sideC: {"C"};
    default {"E"};
};

private _classNamesVar = format ["KPLIB_preset_%1%2", _type, _sideSuffix];

private _classNames = missionNamespace getVariable [_classNamesVar, nil];

// Exit if there are no classnames of given type in preset
if (isNil "_classNames") exitWith {
    diag_log format ["[KP LIBERATION] [%1] [COMMON] Could not find preset variable '%2'", diag_tickTime, _classNamesVar];
    ""
};

// Return random className
if (_classNames isEqualType []) then {
    selectRandom _classNames
} else {
    _classNames
}
