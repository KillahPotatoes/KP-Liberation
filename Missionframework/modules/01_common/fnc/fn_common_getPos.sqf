/*
    KPLIB_fnc_common_getPos

    File: fn_common_getPos.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-09-12
    Last Update: 2018-11-09
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Returns position of given marker, object or array.
        In case array is given it is returned directly. For objects pos ATL is returned.

    Parameter(s):
        _item - String/object/array to return position [STRING/OBJECT/ARRAY, defaults to nil]

    Returns:
        POSITION [POSITION]
*/

params [
    ["_item", nil, ["", objNull, [], 0], 3]
];

// Get position depending of type of respawn item
switch (typeName _item) do {
    case "STRING": {
        getMarkerPos _item;
    };

    case "OBJECT": {
        getPosATL _item;
    };

    // If someone forgots to wrap position array into an array.
    case "SCALAR": {
        +_this;
    };

    case "ARRAY": {
       +_item;
    };
};
