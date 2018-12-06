#include "script_components.hpp"
/*
    KPLIB_fnc_build_displayPlaceObject

    File: fn_build_displayPlaceObject.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-09-09
    Last Update: 2018-11-09
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Creates local object for the build queue

    Parameter(s):
        _className      - Classname of object to place  [STRING, defaults to ""]
        _priceSupplies  - Supplies price                [NUMBER, defaults to 0]
        _priceAmmo      - Ammo price                    [NUMBER, defaults to 0]
        _priceFuel      - Fuel price                    [NUMBER, defaults to 0]

    Returns:
        Object was placed [BOOL]
*/

params [
    ["_className", "", [""]],
    ["_priceSupplies", 0, [0]],
    ["_priceAmmo", 0, [0]],
    ["_priceFuel", 0, [0]]
];

if !(_className isEqualTo "") exitWith {
    private _obj = _className createVehicleLocal KPLIB_zeroPos;
    _obj enableSimulation false;

    ([] call KPLIB_fnc_build_surfaceUnderCursor) params ["_cursorWorldPosASL", "_cursorSurfaceNormal"];
    _obj setPosASL _cursorWorldPosASL;
    _obj setVectorUp _cursorSurfaceNormal;

    LGVAR(buildQueue) pushBack _obj;

    // Clear current item upon placement
    if !LGVAR(ctrlKey) then {
        LSVAR("buildItem", []);
    };

    // Notify that item needs position validity check
    ["KPLIB_build_item_moved", _obj] call CBA_fnc_localEvent;

    true
};

false
