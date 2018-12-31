/*
    KPLIB_fnc_plm_save

    File: fn_plm_save.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-08-05
    Last Update: 2018-12-14
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Saves the selected settings from the player menu dialog and calls the apply function.

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/

// Dialog controls
private _dialog = findDisplay 75803;
private _ctrlViewFoot = _dialog displayCtrl 7580310;
private _ctrlViewVeh = _dialog displayCtrl 7580311;
private _ctrlViewAir = _dialog displayCtrl 7580312;
private _ctrlTerrain = _dialog displayCtrl 7580313;
private _ctrlTpv = _dialog displayCtrl 7580314;
private _ctrlRadio = _dialog displayCtrl 7580315;
private _ctrlSliderSound = _dialog displayCtrl 7580317;

// Fetch all selected values
KPLIB_plm_viewFoot = round (parseNumber (ctrlText _ctrlViewFoot));
if (KPLIB_plm_viewFoot == 0) then {KPLIB_plm_viewFoot = 1600;};
KPLIB_plm_viewVeh = round (parseNumber (ctrlText _ctrlViewVeh));
if (KPLIB_plm_viewVeh == 0) then {KPLIB_plm_viewVeh = 1600;};
KPLIB_plm_viewAir = round (parseNumber (ctrlText _ctrlViewAir));
if (KPLIB_plm_viewAir == 0) then {KPLIB_plm_viewAir = 1600;};
KPLIB_plm_terrain = lbCurSel _ctrlTerrain;
KPLIB_plm_tpv = lbCurSel _ctrlTpv;
KPLIB_plm_radio = lbCurSel _ctrlRadio;
KPLIB_plm_soundVeh = (round sliderPosition _ctrlSliderSound) / 100;

// Save settings in user profile
profileNamespace setVariable ["KPPLM_Settings", [KPLIB_plm_viewFoot, KPLIB_plm_viewVeh, KPLIB_plm_viewAir, KPLIB_plm_terrain, KPLIB_plm_tpv, KPLIB_plm_radio, KPLIB_plm_soundVeh]];
saveProfileNamespace;

// Apply settings
[] call KPLIB_fnc_plm_apply;

// Close the dialog
closeDialog 0;

true
