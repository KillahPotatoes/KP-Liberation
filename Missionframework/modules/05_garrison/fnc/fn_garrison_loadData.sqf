/*
    KPLIB_fnc_

    File: fn_garrison_loadData.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-10-18
    Last Update: 2018-10-20
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Loads data which is bound to the this module from the given save data or initializes needed data for a new campaign.

    Parameter(s):
    NONE

    Returns:
    BOOL
*/

if (KPLIB_param_debugSave > 0) then {diag_log "[KP LIBERATION] [SAVE] Garrison module loading...";};

private _moduleData = ["garrison"] call KPLIB_fnc_init_getSaveData;

// Check if there is a new campaign
if (_moduleData isEqualTo []) then {
    if (KPLIB_param_debugSave > 0) then {diag_log "[KP LIBERATION] [SAVE] Garrison module data empty, creating new data...";};

    // Initialize general sector garrisons
    private _tempMarker = [];
    private _side = 0;          // 0 - Enemy Military Troops; 1 - Local Militia Troops; 2 - Players
    private _soldiers = 0;      // Amount of soldiers
    private _lVehicles = [];    // Array of light vehicle classnames
    private _hVehicles = [];    // Array of heavy vehicle classnames

    private _lVehCount = 0;
    private _hVehCount = 0;

    {
        _tempMarker = toArray _x;
        _tempMarker resize 12;

        // Set initial garrison depending on sector type
        switch (toString _tempMarker) do {
            case "KPLIB_eden_b": {
                _side = 0;
                _soldiers = (ceil (random 4)) * 6;
                _lVehCount = (round (random 2)) + 2;
                _hVehCount = (round (random 3)) + 3;
            };
            case "KPLIB_eden_c";
            case "KPLIB_eden_f": {
                _side = 1;
                _soldiers = (ceil (random 3)) * 6;
                _lVehCount = (round (random 3)) + 2;
                _hVehCount = 0;
            };
            case "KPLIB_eden_m": {
                _side = 1;
                _soldiers = (ceil (random 6)) * 6;
                _lVehCount = (round (random 4)) + 4;
                _hVehCount = 0;
            };
            case "KPLIB_eden_t": {
                _side = 0;
                _soldiers = (ceil (random 2)) * 6;
                _lVehCount = 0;
                _hVehCount = 0;
            };
        };

        // Reset arrays for current garrison
        _lVehicles = [];
        _hVehicles = [];

        // Add light vehicles
        for "_i" from 1 to _lVehCount do {
            if (_side == 0) then {
                _lVehicles pushBack (selectRandom KPLIB_preset_oVehiclesLow);
            } else {
                _lVehicles pushBack (selectRandom KPLIB_preset_oMilVeh);
            };
        };

        // Add heavy vehicles
        for "_i" from 1 to _hVehCount do {
            _hVehicles pushBack (selectRandom KPLIB_preset_oVehicles);
        };

        // Add current sector to the garrison array
        KPLIB_garrison_array pushBack [_x, _side, _soldiers, _lVehicles, _hVehicles];

    } forEach (KPLIB_sectors_military + KPLIB_sectors_city + KPLIB_sectors_factory + KPLIB_sectors_metropolis + KPLIB_sectors_tower);

} else {
    // Otherwise start applying the saved data
    if (KPLIB_param_debugSave > 0) then {diag_log "[KP LIBERATION] [SAVE] Garrison module data found, applying data...";};
    KPLIB_garrison_array = _moduleData select 0;
};

true
