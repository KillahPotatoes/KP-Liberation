#include "script_components.hpp"
/*
    KPLIB_fnc_build_drawIconsPFH

    File: fn_build_drawIconsPFH.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-10-28
    Last Update: 2018-10-28
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

        // Get item target drag pos
        private _dragPos = _x getVariable ["KPLIB_dragPos", nil];
        // Icon will be drawed at target pos if it is not nil
        private _drawPosASL = [_dragPos, getPosASLVisual _x] select (isNil "_dragPos");

        drawIcon3D [
            _icon,
            _color,
            ASLtoAGL _drawPosASL,
            1.5,        // Width
            1.5,        // Height
            0,          // Angle
            "",         // Text
            1,          // Shadow
            0,          // Text size
            "TahomaB",  // Font
            "",         // Text align
            true        // Draw side arrows
        ];
    } forEach LGVAR(buildQueue);

}] call CBA_fnc_addPerFrameHandler;

true
