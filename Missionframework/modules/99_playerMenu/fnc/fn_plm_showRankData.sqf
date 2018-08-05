/*
    KPLIB_fnc_plm_showRankData

    File: fn_plm_showRankData.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-08-05
    Last Update: 2018-08-05
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Reads the KP Ranks data of the current player and displays it in the player menu dialog.

    Parameter(s):
    NONE

    Returns:
    BOOL
*/

// Dialog controls
private _dialog = findDisplay 75803;
private _ctrlRank = _dialog displayCtrl 758032;
private _ctrlScore = _dialog displayCtrl 758034;
private _ctrlPlaytime = _dialog displayCtrl 758036;
private _ctrlNoRanks = _dialog displayCtrl 758037;

// Disable no ranks hint
_ctrlNoRanks ctrlShow false;

// Get data of current player
private _playerData = +(KPR_players select (KPR_players findIf {_x select 1 == getPlayerUID player}));
private _playtime = _playerData select 6;

// Get index of the current player uniform
private _indexU = KPR_uniforms findIf {_x select 0 == uniform player};

// Configclass of the insignia
private _insigniaClass = configNull;

// Get configClass of the insignia, if player wears a supported uniform
if (_indexU != -1) then {
    _validUniform = true;

    private _nation = KPR_uniforms select _indexU select 1;
    if (KPR_playerNation) then {_nation = _playerData select 3;};

    switch (_nation) do {
        case 0: {_nation = "BWF";};
        case 1: {_nation = "BWT";};
        case 2: {_nation = "CRO";};
        case 3: {_nation = "USA";};
        default {_nation = "USA";};
    };

    _insigniaClass = [["CfgUnitInsignia", format ["KPR_%1_%2", _nation, str (_playerData select 2)]], configNull] call BIS_fnc_loadClass;
};

// Get readable name of the current player rank
private _rankname = getText (_insigniaClass >> "displayname");

// Generate readable time values
private _playtimeD = floor (_playtime / 1440);
_playtime = _playtime % 1440;
private _playtimeH = floor (_playtime / 60);
private _playtimeM = _playtime % 60;

// Show data in dialog
_ctrlRank ctrlSetText (_rankname select [6]);
_ctrlScore ctrlSetText str (_playerData select 5);
_ctrlPlaytime ctrlSetText format ["%1d %2h %3m", _playtimeD, _playtimeH, _playtimeM];

true
