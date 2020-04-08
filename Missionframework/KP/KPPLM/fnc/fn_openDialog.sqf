/*
    KPPLM_fnc_openDialog

    File: fn_openDialog.sqf
    Author: Wyqer - https://github.com/KillahPotatoes
    Date: 2018-08-03
    Last Update: 2018-11-10
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Opens the player menu dialog.

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/

// Create player options dialog
createDialog "KPPLM_dialog";
disableSerialization;

// Dialog controls
private _dialog = findDisplay 75803;
private _ctrlLabelRank = _dialog displayCtrl 758031;
private _ctrlRank = _dialog displayCtrl 758032;
private _ctrlLabelScore = _dialog displayCtrl 758033;
private _ctrlScore = _dialog displayCtrl 758034;
private _ctrlLabelPlaytime = _dialog displayCtrl 758035;
private _ctrlPlaytime = _dialog displayCtrl 758036;
private _ctrlNoRanks = _dialog displayCtrl 758037;
private _ctrlGroupList = _dialog displayCtrl 758038;
private _ctrlViewFoot = _dialog displayCtrl 7580310;
private _ctrlViewVeh = _dialog displayCtrl 7580311;
private _ctrlViewAir = _dialog displayCtrl 7580312;
private _ctrlTerrain = _dialog displayCtrl 7580313;
private _ctrlTpv = _dialog displayCtrl 7580314;
private _ctrlRadio = _dialog displayCtrl 7580315;
private _ctrlValueSound = _dialog displayCtrl 7580316;
private _ctrlSliderSound = _dialog displayCtrl 7580317;

// Display KP Ranks data or hide the player menu entries for the data
if (KPPLM_KPR) then {
    [] call KPPLM_fnc_showRankData;
} else {
    {
        _x ctrlShow false;
    } forEach [_ctrlLabelRank, _ctrlRank, _ctrlLabelScore, _ctrlScore, _ctrlLabelPlaytime, _ctrlPlaytime];
};

// Fill group list with all groups leaded by players
{
    if (player in units _x) then {
        _ctrlGroupList lbSetCurSel (_ctrlGroupList lbAdd format [">> %1 - %2 (%3)", groupId _x, name leader _x, count units _x]);
    } else {
        _ctrlGroupList lbAdd format ["%1 - %2 (%3)", groupId _x, name leader _x, count units _x];
    };

} forEach KPPLM_groups;

// Set initial values for view distances
_ctrlViewFoot ctrlSetText str KPPLM_viewFoot;
_ctrlViewVeh ctrlSetText str KPPLM_viewVeh;
_ctrlViewAir ctrlSetText str KPPLM_viewAir;

// Fill density, auto tpv and radio dropdowns. Also preselect the saved values
_ctrlTerrain lbAdd localize "STR_KPPLM_TERRAINLOW"; // 50
_ctrlTerrain lbAdd localize "STR_KPPLM_TERRAINSTANDARD"; // 25
_ctrlTerrain lbAdd localize "STR_KPPLM_TERRAINHIGH"; // 12.5
_ctrlTerrain lbAdd localize "STR_KPPLM_TERRAINVHIGH"; // 6.25
_ctrlTerrain lbAdd localize "STR_KPPLM_TERRAINULTRA"; // 3.125
_ctrlTerrain lbSetCurSel KPPLM_terrain;

_ctrlTpv lbAdd localize "STR_KPPLM_TPDISABLED";
_ctrlTpv lbAdd localize "STR_KPPLM_TPVAIR";
_ctrlTpv lbAdd localize "STR_KPPLM_TPVLAND";
_ctrlTpv lbAdd localize "STR_KPPLM_TPVALL";
_ctrlTpv lbSetCurSel KPPLM_tpv;

_ctrlRadio lbAdd localize "STR_KPPLM_RADIONO";
_ctrlRadio lbAdd localize "STR_KPPLM_RADIOVOICE";
_ctrlRadio lbAdd localize "STR_KPPLM_RADIOALL";
_ctrlRadio lbSetCurSel KPPLM_radio;

// Initialize sound slider range, position and speed
_ctrlSliderSound sliderSetRange [0, 100];
_ctrlSliderSound sliderSetPosition (KPPLM_soundVeh * 100);
_ctrlSliderSound sliderSetSpeed [1, 1];

// Set sound value output to initial sound slider value
_ctrlValueSound ctrlSetText format ["%1%2", round sliderPosition _ctrlSliderSound, "%"];

true
