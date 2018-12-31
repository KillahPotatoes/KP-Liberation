/*
    KPLIB_fnc_garrison_initSector

    File: fn_garrison_initSector.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-10-24
    Last Update: 2018-12-09
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Initializes a sector garrison depending on the sector type. Returns empty array on error.

    Parameter(s):
        _sector - Sector marker name of the sector which should be initialized [STRING, defaults to ""]

    Returns:
        Sorted garrison data including side, amount of soldiers, light vehicles and heavy vehicles [ARRAY]
*/

params [
    ["_sector", "", [""]]
];

if (_sector isEqualTo "") exitWith {[]};

// Initialize general sector garrisons
private _tempMarker = toArray _sector;
private _side = 0;          // 0 - Enemy Military Troops; 1 - Local Militia Troops; 2 - Players (NOTE: It's very possible that this will change, so consider it as placeholder)
private _soldiers = 0;      // Amount of soldiers
private _lVehicles = [];    // Array of light vehicle classnames
private _hVehicles = [];    // Array of heavy vehicle classnames

private _lVehCount = 0;
private _hVehCount = 0;

// Shorten marker name to important information
_tempMarker resize 12;

// Set initial garrison depending on sector type
switch (toString _tempMarker) do {
    case "KPLIB_eden_b": {
        _side = 0;
        _soldiers = (ceil (random 3) + 3) * 6;
        _lVehCount = (round (random 2)) + 2;
        _hVehCount = (round (random 3)) + 3;
    };
    case "KPLIB_eden_c";
    case "KPLIB_eden_f": {
        _side = 1;
        _soldiers = (ceil (random 2) + 2) * 6;
        _lVehCount = (round (random 2)) + 2;
        _hVehCount = 0;
    };
    case "KPLIB_eden_m": {
        _side = 1;
        _soldiers = (ceil (random 5) + 3) * 6;
        _lVehCount = (round (random 3)) + 3;
        _hVehCount = 0;
    };
    case "KPLIB_eden_t": {
        _side = 0;
        _soldiers = (ceil (random 2) + 1) * 6;
        _lVehCount = 0;
        _hVehCount = 0;
    };
};

// Add light vehicles
for "_i" from 1 to _lVehCount do {
    if (_side isEqualTo 0) then {
        _lVehicles pushBack (selectRandom KPLIB_preset_vehLightArmedPlE);
    } else {
        _lVehicles pushBack (selectRandom (KPLIB_preset_vehLightArmedPlE + KPLIB_preset_vehHeavyApcPlE));
    };
};

// Add heavy vehicles
for "_i" from 1 to _hVehCount do {
    _hVehicles pushBack (selectRandom (KPLIB_preset_vehHeavyApcPlE + KPLIB_preset_vehHeavyPlE));
};

// Return garrison data
[_sector, _side, _soldiers, _lVehicles, _hVehicles]
