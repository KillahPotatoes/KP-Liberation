/*
    KPLIB_fnc_res_saveData

    File: fn_res_saveData.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-12-13
    Last Update: 2018-12-16
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Fetches data which is bound to this module and send it to the global save data array.

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/

if (KPLIB_param_debug) then {diag_log "[KP LIBERATION] [SAVE] Resources module saving...";};

private _storageSave = [];

private ["_class", "_pos", "_vector", "_supplies", "_ammo", "_fuel"];
{
    // General data of the storage
    _class = typeOf _x;
    _pos = getPosWorld _x;
    _vector = [vectorDir _x, vectorUp _x];
    _supplies = 0;
    _ammo = 0;
    _fuel = 0;

    // Get the stored resource values
    {
        switch (typeOf _x) do {
            case KPLIB_preset_crateSupplyE;
            case KPLIB_preset_crateSupplyF: {_supplies = _supplies + (_x getVariable ["KPLIB_resValue", 0])};
            case KPLIB_preset_crateAmmoE;
            case KPLIB_preset_crateAmmoF: {_ammo = _ammo + (_x getVariable ["KPLIB_resValue", 0])};
            case KPLIB_preset_crateFuelE;
            case KPLIB_preset_crateFuelF: {_fuel = _fuel + (_x getVariable ["KPLIB_resValue", 0])};
        };
    } forEach (attachedObjects _x);

    // Add to the save array
    _storageSave pushBack [_class, _pos, _vector, _supplies, _ammo, _fuel];
} forEach KPLIB_res_allStorages;

// Set module data to save and send it to the global save data array
["resources",
    [
        _storageSave,
        KPLIB_res_intel
    ]
] call KPLIB_fnc_init_setSaveData;

true
