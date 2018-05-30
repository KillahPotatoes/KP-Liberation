/*
    KPLIB_fnc_common_createNamespace.sqf

    File: fn_common_createNamespace.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-05-20
    Last Update: 2018-05-20
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Create namespace. Used to hold variables in more "object oriented" way.
    Get and set variables via setVariable and getVariable.

    Parameter(s):
        0: BOOL - Should created namespace be global

    Returns:
    OBJECT/LOCATION - object if global namespace, location otherwise
*/
#define KPLIB_NAMESPACE_POS [-1000,-1000,0]

params [["_global", false]];

if(_global isEqualTo true) then {
    // Create simple object as variable container. The simpler the model the better.
    createSimpleObject ["A3\weapons_f\empty.p3d", KPLIB_NAMESPACE_POS];
} else {
    // If namespace is not global use location as it is the "cheapest" object you can get.
    createLocation ["INVISIBLE", KPLIB_NAMESPACE_POS, 0, 0];
};
