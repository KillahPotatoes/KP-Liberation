#include "script_components.hpp"
/*
    KPLIB_fnc_build_displayPlaceObject

    File: fn_build_displayPlaceObject.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-09-09
    Last Update: 2018-10-08
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Places object into build queue

    Parameter(s):
        0: STRING - Classname of object to place
        1: NUMBER - Supply price of placed object
        2: NUMBER - Ammo price of placed object
        3: NUMBER - Fuel price of placed object

    Returns:
    NOTHING
*/
params [
    ["_className", "", [""]],
    ["_priceSupplies", nil, [0]],
    ["_priceAmmo", nil, [0]],
    ["_priceFuel", nil, [0]]
];

if !(_className isEqualTo "") then {
    private _pos = screenToWorld LGVAR(mousePos);

    private _obj = _className createVehicleLocal KPLIB_zeroPos;
    _obj setPos _pos;

    _obj enableSimulation false;

    LGVAR(buildQueue) pushBack _obj;

    if !LGVAR(ctrlKey) then {
        LSVAR("buildItem", []);
    }

};
