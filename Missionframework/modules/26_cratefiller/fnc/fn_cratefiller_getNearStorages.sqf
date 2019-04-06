/*
    KPLIB_fnc_cratefiller_getNearStorages

    File: fn_cratefiller_getNearStorages.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-04-06
    Last Update: 2019-04-07
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Scans the fob for possible storages.

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/

// Dialog controls
private _dialog = findDisplay 758026;
private _ctrlStorage = _dialog displayCtrl 75802;

// Clear the lists
lbClear _ctrlStorage;

// Get near objects and check for storage capacity
private _type = objNull;
private _config = "";
private _number= 0;
private _index = 0;
private _picture = "";
private _storages = [];
private _blacklist = [
    KPLIB_preset_crateSupplyE,
    KPLIB_preset_crateSupplyF,
    KPLIB_preset_crateAmmoE,
    KPLIB_preset_crateAmmoF,
    KPLIB_preset_crateFuelE,
    KPLIB_preset_crateFuelF,
    KPLIB_logistic_building
];

private _nearFOB = [player] call KPLIB_fnc_common_getPlayerFob;
{
    _type = typeOf _x;
    if (_type isEqualTo "GroundWeaponHolder") exitWith {};
    _config = [_type] call KPLIB_fnc_cratefiller_getConfigPath;
    _number = getNumber (configfile >> _config >> _type >> "maximumLoad");
    if (_number > 0) then {
        _storages pushBack _x;
    };
} forEach (((getMarkerPos _nearFOB) nearObjects KPLIB_param_fobRange) select {!(typeOf _x in _blacklist)});

// Fill the list
{
    _type = typeOf _x;
    _config = [_type] call KPLIB_fnc_cratefiller_getConfigPath;
    _index = _ctrlStorage lbAdd format ["%1m - %2", round ((getMarkerPos _nearFOB) distance2D _x), getText (configFile >> _config >> _type >> "displayName")];
    _ctrlStorage lbSetData [_index, netId _x];
    _picture = getText (configFile >> _config >> _type >> "picture");
    if (_picture isEqualTo "pictureThing") then {
        _ctrlStorage lbSetPicture [_index, "KPGUI\res\icon_help.paa"];
    } else {
        _ctrlStorage lbSetPicture [_index, _picture];
    };
} forEach _storages;

true
