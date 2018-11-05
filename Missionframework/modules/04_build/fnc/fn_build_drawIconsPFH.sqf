#include "script_components.hpp"
/*
    KPLIB_fnc_build_drawIconsPFH

    File: fn_build_drawIconsPFH.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-10-28
    Last Update: 2018-11-04
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Creates PFH used that draws icons of objects in queue

    Parameter(s):
        NONE

    Returns:
        PFH was created [BOOL]
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
        // Get icon pos, either current pos or target pos when dragging
        private _drawPosASL = _x getVariable ["KPLIB_dragPos", getPosASLVisual _x];

        drawIcon3D [
            _objectClassname call KPLIB_fnc_common_getIcon,
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

    private _currentItemClass = LGVAR(buildItem) select 0;
    // Draw icon for currently selected build item
    if !(isNil "_currentItemClass") then {

        ([] call KPLIB_fnc_build_surfaceUnderCursor) params ["_cursorWorldPosASL"];

        drawIcon3D [
            _currentItemClass call KPLIB_fnc_common_getIcon,
            [1, 1, 1, 1],
            ASLToAGL _cursorWorldPosASL,
            1,          // Width
            1,          // Height
            0,          // Angle
            "",         // Text
            1          // Shadow
        ];
    };

}] call CBA_fnc_addPerFrameHandler;

true
