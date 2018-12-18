/*
    KPLIB_fnc_res_checkCrate

    File: fn_res_checkCrate.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-12-15
    Last Update: 2018-12-16
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Displays the amount of resources inside a given crate as hint.

    Parameter(s):
        _crate - Resource crate to check [OBJECT, defaults to objNull]

    Returns:
        Function reached the end [BOOL]
*/

params [
    ["_crate", objNull, [objNull]]
];

// Get the specific resource type string
private _resource = switch (typeOf _crate) do {
    case KPLIB_preset_crateSupplyE;
    case KPLIB_preset_crateSupplyF: {"STR_KPLIB_SUPPLIES"};
    case KPLIB_preset_crateAmmoE;
    case KPLIB_preset_crateAmmoF: {"STR_KPLIB_AMMO"};
    case KPLIB_preset_crateFuelE;
    case KPLIB_preset_crateFuelF: {"STR_KPLIB_FUEL"};
};

// Display hint
hint format [localize "STR_KPLIB_HINT_RESCRATECONTENT", _crate getVariable ["KPLIB_res_crateValue", 0], localize _resource];
[{hintSilent "";}, [], 3] call CBA_fnc_waitAndExecute;

true
