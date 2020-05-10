/*
    KPPLM_fnc_save

    File: fn_save.sqf
    Author: Wyqer - https://github.com/KillahPotatoes
    Date: 2018-08-05
    Last Update: 2018-11-10
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
KPPLM_viewFoot = round (parseNumber (ctrlText _ctrlViewFoot));
if (KPPLM_viewFoot == 0) then {KPPLM_viewFoot = 1600;};
KPPLM_viewVeh = round (parseNumber (ctrlText _ctrlViewVeh));
if (KPPLM_viewVeh == 0) then {KPPLM_viewVeh = 1600;};
KPPLM_viewAir = round (parseNumber (ctrlText _ctrlViewAir));
if (KPPLM_viewAir == 0) then {KPPLM_viewAir = 1600;};
KPPLM_terrain = lbCurSel _ctrlTerrain;
KPPLM_tpv = lbCurSel _ctrlTpv;
KPPLM_radio = lbCurSel _ctrlRadio;
KPPLM_soundVeh = (round sliderPosition _ctrlSliderSound) / 100;

// Save settings in user profile
profileNamespace setVariable ["KPPLM_Settings", [KPPLM_viewFoot, KPPLM_viewVeh, KPPLM_viewAir, KPPLM_terrain, KPPLM_tpv, KPPLM_radio, KPPLM_soundVeh]];
saveProfileNamespace;

// Apply settings
[] call KPPLM_fnc_apply;

// Close the dialog
closeDialog 0;

true
