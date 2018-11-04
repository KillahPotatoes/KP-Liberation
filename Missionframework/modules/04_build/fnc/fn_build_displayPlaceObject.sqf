#include "script_components.hpp"
/*
    KPLIB_fnc_build_displayPlaceObject

    File: fn_build_displayPlaceObject.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-09-09
    Last Update: 2018-11-04
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Creates local object for the build queue

    Parameter(s):
        _className - Classname of object to place [String, defaults to ""]
        _priceSupplies - Supplies price [Number]
        _priceAmmo - Ammo price [Number]
        _priceFuel - Fuel price [Number]

    Returns:
        Object was placed [BOOL]
*/
params [
    ["_className", "", [""]],
    ["_priceSupplies", nil, [0]],
    ["_priceAmmo", nil, [0]],
    ["_priceFuel", nil, [0]]
];

if !(_className isEqualTo "") exitWith {
    private _pos = screenToWorld LGVAR(mousePos);

    private _obj = _className createVehicleLocal KPLIB_zeroPos;
    _obj setPos _pos;

    _obj enableSimulation false;

    LGVAR(buildQueue) pushBack _obj;

    // Clear current item upon placement
    if !LGVAR(ctrlKey) then {
        LSVAR("buildItem", []);
    };

    true
};

false
