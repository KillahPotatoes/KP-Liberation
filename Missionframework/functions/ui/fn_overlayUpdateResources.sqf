#include "script_components.hpp"
/*
    File: fn_overlayUpdateResources.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2020-05-01
    Last Update: 2020-08-25
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Update resources overlay.

    Parameter(s):
        _overlay        - Overlay display                               [DISPLAY, defaults to displayNull]
        _show           - Should the resources controls be shown        [BOOL, defaults to true]
        _updateValues   - Should values controls be updated with data   [BOOL, defaults to true]
        _resourceArea   - Name of resource area to be shown             [STRING, defaults ""]

    Returns:
        Resources overlay visible [BOOL]
*/

params [
    ["_overlay", displayNull, [displayNull]],
    ["_show", true, [true]],
    ["_updateValues", true, [true]],
    ["_resourceArea", "", [""]]
];

if (isNull _overlay) exitWith {
    ["Null overlay given"] call BIS_fnc_error;
    false
};
if (!_show) exitWith {
    {
        (_overlay displayCtrl _x) ctrlShow false;
    } forEach OVERLAY_RSC_IDCS;
    false
};

if (_updateValues) then {

    (_overlay displayCtrl IDC_OVERLAY_RSC_LABEL_FOB) ctrlSetText toUpper (_resourceArea select [4]);
    (_overlay displayCtrl IDC_OVERLAY_RSC_LABEL_SUPPLIES) ctrlSetText str floor KP_liberation_supplies;
    (_overlay displayCtrl IDC_OVERLAY_RSC_LABEL_AMMO) ctrlSetText str floor KP_liberation_ammo;
    (_overlay displayCtrl IDC_OVERLAY_RSC_LABEL_FUEL) ctrlSetText str floor KP_liberation_fuel;
    (_overlay displayCtrl IDC_OVERLAY_RSC_LABEL_UNITCAP) ctrlSetText ([unitcap, "/", [] call KPLIB_fnc_getLocalCap] joinString "");
    (_overlay displayCtrl IDC_OVERLAY_RSC_LABEL_HELIPAD) ctrlSetText ([KP_liberation_heli_count, "/", KP_liberation_heli_slots] joinString "");
    (_overlay displayCtrl IDC_OVERLAY_RSC_LABEL_PLANE) ctrlSetText ([KP_liberation_plane_count, "/", KP_liberation_plane_slots] joinString "");
    (_overlay displayCtrl IDC_OVERLAY_RSC_LABEL_ALERT) ctrlSetText ([round combat_readiness, "%"] joinString "");
    (_overlay displayCtrl IDC_OVERLAY_RSC_LABEL_CIVREP) ctrlSetText ([KP_liberation_civ_rep,"%"] joinString "");
    (_overlay displayCtrl IDC_OVERLAY_RSC_LABEL_INTEL) ctrlSetText str round resources_intel;

    private _color_readiness = [0.8,0.8,0.8,1];
    if (combat_readiness >= 25) then {_color_readiness = [0.8,0.8,0,1]};
    if (combat_readiness >= 50) then {_color_readiness = [0.8,0.6,0,1]};
    if (combat_readiness >= 75) then {_color_readiness = [0.8,0.3,0,1]};
    if (combat_readiness >= 100) then {_color_readiness = [0.8,0,0,1]};

    (_overlay displayCtrl IDC_OVERLAY_RSC_PIC_ALERT) ctrlSetTextColor _color_readiness;
    (_overlay displayCtrl IDC_OVERLAY_RSC_LABEL_ALERT) ctrlSetTextColor _color_readiness;

    private _color_reputation = [0.8,0.8,0.8,1];
    if (KP_liberation_civ_rep >= 25) then {_color_reputation = [0,0.7,0,1]};
    if (KP_liberation_civ_rep <= -25) then {_color_reputation = [0.7,0,0,1]};

    (_overlay displayCtrl IDC_OVERLAY_RSC_PIC_CIVREP) ctrlSetTextColor _color_reputation;
    (_overlay displayCtrl IDC_OVERLAY_RSC_LABEL_CIVREP) ctrlSetTextColor _color_reputation;

};

{
    (_overlay displayCtrl _x) ctrlShow true;
} forEach OVERLAY_RSC_IDCS;

true
