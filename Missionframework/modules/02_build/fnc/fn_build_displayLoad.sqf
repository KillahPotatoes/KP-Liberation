#include "..\ui\defines.hpp"
/*
    KPLIB_fnc_build_displayLoad

    File: fn_build_displayLoad.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-09-09
    Last Update: 2018-09-09
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Handle build display load

    Parameter(s):
        0: DISPLAY - Build display

    Returns:
    NOTHING
*/
params [["_display", nil, [displayNull]]];

systemChat "onLoad";

// Add ESC Handler
_display displayAddEventHandler ["keyDown", {
    params ["_display","_dik","_shift","_ctrl","_alt"];
    if (_dik == 1) exitWith {
        // [] call KPLIB_fnc_build_stop;
        // Open debug ESC menu (for debugging)
        [] spawn {
            private _interruptDisplay = (findDisplay 46) createDisplay "RscDisplayInterrupt";
            waitUntil {_interruptDisplay isEqualTo displayNull};
            (findDisplay 46) createDisplay "KPLIB_build";
        };
        true
    };
    private _logic = KPLIB_buildLogic;
    _logic setVariable ["shiftKey", _shift];
    _logic setVariable ["ctrlKey", _ctrl];

    systemChat format["keyDown, ctrl: %1, shift: %2", [_ctrl, _shift]];
}];

_display displayAddEventHandler ["keyUp", {
    params ["_display","_dik","_shift","_ctrl","_alt"];

    private _logic = KPLIB_buildLogic;
    _logic setVariable ["shiftKey", _shift];
    _logic setVariable ["ctrlKey", _ctrl];

    systemChat format["keyUp, ctrl: %1, shift: %2", [_ctrl, _shift]];
}];

// Add Item selection handler
private _itemsList = _display displayCtrl KPLIB_IDC_BUILD_ITEM_LIST;
_itemsList ctrlAddEventHandler ["LBSelChanged", {
    params ["_control", "_selectedIndex"];

    private _logic = KPLIB_buildLogic;
    private _mode = _logic getVariable "buildMode";

    if(_selectedIndex == -1) exitWith {
        _logic setVariable ["buildItem", []];
    };

    private _buildList = KPLIB_preset_buildLists select _mode;
    private _selectedItem = _buildList select _selectedIndex;

    systemChat format["buildItem: %1", _selectedItem];
    _logic setVariable ["buildItem", _selectedItem];
}];

// Add build confirmation handler
private _confirmButton = _display displayCtrl KPLIB_IDC_BUILD_CONFIRM;
_confirmButton ctrlAddEventHandler ["buttonClick", {
    private _logic = KPLIB_buildLogic;

    // TODO implement build queue handling (resource check etc.)
    systemChat "buildConfirm: Resource check not implemented yet!";
    {
        private _dirAndUp = [vectorDir _x, vectorUp _x];
        private _pos = getPos _x;
        private _class = typeOf _x;

        private _obj = [_class, _pos, 0, true] remoteExecCall ["KPLIB_fnc_common_spawnVehicle", 2];
        _obj setVectorDirAndUp _dirAndUp;

    } forEach (_logic getVariable "buildQueue");
}];

// Add tab change handler
{
    _ctrl = _display displayCtrl _x;
    _ctrl ctrlAddEventHandler ["buttonClick", {
        _this call KPLIB_fnc_build_displayTabClick;
    }];
} forEach KPLIB_BUILD_TABS_IDCS_ARRAY;

// Hide vignette, show hud
private _vignette = _display displayCtrl 1202;
_vignette ctrlShow false;
showHUD true;

private _logic = KPLIB_buildLogic;
_logic setVariable ["display", _display];
(_logic getVariable ["buildMode", 0]) call KPLIB_fnc_build_displaySetMode;
setMousePosition (_logic getVariable "mousePos");
