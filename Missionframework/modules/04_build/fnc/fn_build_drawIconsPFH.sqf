#include "script_components.hpp"
/*
    KPLIB_fnc_build_drawIconsPFH

    File: fn_build_drawIconsPFH.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-10-28
    Last Update: 2018-11-03
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Creates PFH used that draws icons of objects in queue

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/

[{
    params ["", "_handle"];

    if (isNull KPLIB_buildLogic) exitWith {
        _handle call CBA_fnc_removePerFrameHandler;
    };

    private _cfgVehicles = configfile >> "CfgVehicles";
    private _cfgVehiclesIcon = configFile >> "CfgVehicleIcons";

    // Draw icons in 3D space
    {
        private _objectClassname = typeOf _x;

        private _color = _x call KPLIB_fnc_build_objectColor;


        private _icon = getText (_cfgVehicles >> _objectClassname >> "icon");
        private _iconPath = [getText (_cfgVehiclesIcon >> _icon), _icon] select ((toLower _icon) find "\" > -1);

        // Get icon pos, either current pos or target pos when dragging
        private _drawPosASL = _x getVariable ["KPLIB_dragPos", getPosASLVisual _x];

        drawIcon3D [
            _icon,
            _color,
            ASLtoAGL _drawPosASL,
            1,          // Width
            1,          // Height
            0,          // Angle
            "",         // Text
            1,          // Shadow
            0,          // Text size
            "TahomaB",  // Font
            "",         // Text align
            true        // Draw side arrows
        ];
    } forEach LGVAR(buildQueue);

    private _currentItem = LGVAR(buildItem) select 0;

    if !(isNil "_currentItem") then {
        private _icon = getText (_cfgVehicles >> _currentItem >> "icon");
        private _iconPath = [getText (_cfgVehiclesIcon >> _icon), _icon] select ((toLower _icon) find "\" > -1);

        private _cursorWorldPosAGL = screenToWorld LGVAR(mousePos);

        drawIcon3D [
            _iconPath,
            [1, 1, 1, 1],
            _cursorWorldPosAGL,
            1,          // Width
            1,          // Height
            0,          // Angle
            "",         // Text
            1,          // Shadow
            0           // Text size
        ];
    };

}] call CBA_fnc_addPerFrameHandler;

true
