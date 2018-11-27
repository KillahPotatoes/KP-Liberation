/*
    KPLIB_fnc_virtual_initCuratorOnPlayer

    File: fn_virtual_initCuratorOnPlayer.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-11-27
    Last Update: 2018-11-27
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        No description added yet.

    Parameter(s):
        _localVariable - Description [DATATYPE, defaults to DEFAULTVALUE]

    Returns:
        Curator handling was initialized [BOOL]
*/
params [
    ["_modeSetting", "", [""]]
];

private _mode = missionNamespace getVariable [_modeSetting, 0];

// Add curator on first respawn
[player, "respawn", {
    ["KPLIB_player_giveZeus", [player, _thisArgs]] call CBA_fnc_serverEvent;

    player removeEventHandler ["respawn", _thisID];
}, _mode] call CBA_fnc_addBISEventHandler;

// Listen for CBA event to allow changing of zeus settings when mission is running
["CBA_SettingChanged", {
    params ["_setting", "_value"];

    switch _setting do {
        // Zeus mode
        case _this: {
            ["KPLIB_player_giveZeus", [player, _value]] call CBA_fnc_serverEvent;
        };

        // Enable/disable 3D fob location icons
        case "KPLIB_param_zeusFobIcons": {
            if (_value) then {
                (getAssignedCuratorLogic player) call KPLIB_fnc_virtual_curatorUpdateFobIcons;
            } else {
                (getAssignedCuratorLogic player) call KPLIB_fnc_virtual_curatorRemoveFobIcons;
            };
        };
    };
}, _modeSetting] call CBA_fnc_addEventHandler;

true
