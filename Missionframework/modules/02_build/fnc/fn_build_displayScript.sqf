#include "..\ui\defines.hpp"
/*
    KPLIB_fnc_build_displayScript

    File: fn_build_displayScript.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-07-01
    Last Update: 2018-08-05
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    This function handles whole build display logic

    Parameter(s):
        0: STRING - Action identifier, used to detect what action is required be handled by script
        1: ARRAY - Additional parameters of action

    Returns:
    NOTHING
*/

params [
    ["_mode", nil, [""]],
    ["_parameters", nil, [[]]]
];

switch _mode do {
    case "onLoad": {
        diag_log "onload";
        _parameters params [["_display", nil, [displayNull]]];

        private _vignette = _display displayCtrl 1202;
        _vignette ctrlShow false;

        showHUD true;

        // ESC closes whole camera
        _display displayAddEventHandler ["keyDown", {
            if (_this select 1 == 1) then {
                call KPLIB_fnc_build_camClose;
            };
        }];

        // Handle item selection
        private _itemsList = _display displayCtrl KPLIB_IDC_BUILD_ITEM_LIST;
        _itemsList ctrlAddEventHandler ["LBSelChanged", {
            params ["_control", "_selectedIndex"];

            private _display = uiNamespace getVariable "KPLIB_build_display";
            private _mode = _display getVariable "KPLIB_buildMode";

            if(_selectedIndex == -1) exitWith {
                _display setVariable ["KPLIB_buildItem", nil];
            };

            private _buildList = KPLIB_preset_buildLists select _mode;
            private _selectedItem = _buildList select _selectedIndex;

            _display setVariable ["KPLIB_buildItem", _selectedItem];
        }];

        // Handle build confirmation
        private _confirmButton = _display displayCtrl KPLIB_IDC_BUILD_CONFIRM;
        _confirmButton ctrlAddEventHandler ["buttonClick", {
            private _display = uiNamespace getVariable "KPLIB_build_display";
            private _buildItem = _display getVariable ["KPLIB_buildItem", nil];

            if(!isNil "_buildItem") then {
                [_buildItem select 0, getPosATL KPLIB_cam_arrow] call KPLIB_fnc_common_spawnVehicle;
            };
        }];

        // Add tab change handler
        {
            _ctrl = _display displayCtrl _x;
            _ctrl ctrlAddEventHandler ["buttonClick", {
                ["tabChanged", _this] call KPLIB_fnc_build_displayScript
            }];
        } forEach KPLIB_BUILD_TABS_IDCS_ARRAY;

        // Initialize with infantry tab selected
        ["tabChanged", [_display displayCtrl KPLIB_IDC_BUILD_TAB_INFANTRY]] call KPLIB_fnc_build_displayScript;

        // Create FOB range indicators
        ["init", player getVariable ["KPLIB_fob", ""]] call KPLIB_fnc_build_fobArea;
    };

    case "onUnload": {
        [] call KPLIB_fnc_build_camClose;
        // Remove fob range indicators
        ["remove"] call KPLIB_fnc_build_fobArea;
    };

    case "tabChanged": {
        _parameters params [["_selectedControl", nil, [controlNull]]];

        private _display = ctrlParent _selectedControl;

        _selectedMode = 0;
        {
            _ctrl = _display displayctrl _x;
            _ctrl ctrlsettextcolor [1,1,1,0.5];
            _color = [1,1,1,0.5];
            // Selected tab will be scaled up and highlighted
            if (_ctrl == _selectedControl) then {
                _color = [1,1,1,1];
                _selectedMode = _foreachindex;
            };
            _ctrl ctrlSetTextColor _color;
        } foreach KPLIB_BUILD_TABS_IDCS_ARRAY;

        // If clicked mode is different than current mode fire change event
        if(_display getVariable ["KPLIB_buildMode", -1] != _selectedMode) then {
            _display setVariable ["KPLIB_buildMode", _selectedMode];
            ["modeChanged", [_display, _selectedMode]] call KPLIB_fnc_build_displayScript;
        };
    };

    case "modeChanged": {
        _parameters params [
            ["_display", nil, [displayNull]],
            ["_selectedMode", 0, [0]]
        ];
        // CfgVehicles config for shorter access
        private _cfg = configFile >> "CfgVehicles";
        private _listElements = KPLIB_preset_buildLists select _selectedMode;

        private _listBox = _display displayCtrl KPLIB_IDC_BUILD_ITEM_LIST;
        _listBox lbSetCurSel -1; // Unselect current row as it sticks between clearing
        lnbClear _listBox;
        {
            // All but squad build mode
            if (_selectedMode != 7) then {
                _x params ["_className", "_priceSupp", "_priceAmmo", "_priceFuel"];
                private _name = getText (_cfg >> _className >> "displayName");

                _listBox lnbAddRow [_name, str _priceSupp, str _priceAmmo, str _priceFuel];

                _icon = getText ( _cfg >> _className >> "icon");
                if(isText (configFile >> "CfgVehicleIcons" >> _icon)) then {
                    _icon = (getText (configFile >> "CfgVehicleIcons" >> _icon));
                };
                _listBox lnbSetPicture [[((lnbSize _listBox) select 0) - 1, 0], _icon];

            } else {
                // TODO handle squad build mode
                systemChat "Not implemented yet!";
            };

        } foreach _listElements;
    };

    case "buildConfirm": {

    };

    default {
        diag_log format ["[KP LIBERATION] Inorrect mode passed to build display script: %1", _this];
    };
}
