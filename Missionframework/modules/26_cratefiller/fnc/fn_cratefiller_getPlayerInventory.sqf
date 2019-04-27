#include "script_component.hpp"
/*
    KPLIB_fnc_cratefiller_getPlayerInventory

    File: fn_cratefiller_getPlayerInventory.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-04-27
    Last Update: 2019-04-27
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

    Description:
        Gets all weapons of the selected player.

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/

// Dialog controls
private _dialog = findDisplay 758026;
private _ctrlPlayers = _dialog displayCtrl 687412;
private _ctrlMainWeapon = _dialog displayCtrl 687413;
private _ctrlHandgun = _dialog displayCtrl 687414;
private _ctrlSecondaryWeapon = _dialog displayCtrl 687415;

// Read controls
private _index = lbCurSel _ctrlPlayers;

// Get the selected player from the namespace
private _player = (CCGVAR("players", [])) select _index;

// Get the player weapons
private _mainWeapon = primaryWeapon _player;
private _handgun = handgunWeapon _player;
private _secondaryWeapon = secondaryWeapon _player;

// Variables
private _config = configNull;
private _picture = "";
private _name = "";
private _description = "";

// Fill the controls
if !(_mainWeapon isEqualTo "") then {
    _config = [_mainWeapon] call KPLIB_fnc_cratefiller_getConfigPath;
    _picture = getText (_config >> "picture");
    _name = getText (_config >> "displayName");
    _ctrlMainWeapon ctrlSetText _picture;
    _ctrlMainWeapon ctrlSetTooltip _name;
} else {
    _ctrlMainWeapon ctrlSetText "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\PrimaryWeapon_ca.paa";
};

if !(_handgun isEqualTo "") then {
    _config = [_handgun] call KPLIB_fnc_cratefiller_getConfigPath;
    _picture = getText (_config >> "picture");
    _name = getText (_config >> "displayName");
    _ctrlHandgun ctrlSetText _picture;
    _ctrlHandgun ctrlSetTooltip _name;
} else {
    _ctrlHandgun ctrlSetText "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Handgun_ca.paa";
};

if !(_secondaryWeapon isEqualTo "") then {
    _config = [_secondaryWeapon] call KPLIB_fnc_cratefiller_getConfigPath;
    _picture = getText (_config >> "picture");
    _name = getText (_config >> "displayName");
    _ctrlSecondaryWeapon ctrlSetText _picture;
    _ctrlSecondaryWeapon ctrlSetTooltip _name;
} else {
    _ctrlSecondaryWeapon ctrlSetText "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\SecondaryWeapon_ca.paa";
};

true
