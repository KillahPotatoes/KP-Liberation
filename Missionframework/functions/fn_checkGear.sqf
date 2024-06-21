/*
    File: fn_checkGear.sqf
    Author: ThomasAngel (Original by KP Liberation Dev Team - https://github.com/KillahPotatoes)
    Steam: https://steamcommunity.com/id/Thomasangel/
    Github: https://github.com/rekterakathom
    Date: 2021-12-27
    Last Update: 2023-03-02
    Description:
        Completely rewritten version of the original checkGear by KillahPotatoes.
        Identical functionality.
        Checks the players gear for blacklisted items.
        Found items are removed from the loadout.
        Furthermore a hint with the found items is displayed to the player
        while a server log entry is created for the admin.
    Parameter(s):
        -
    Returns:
        Player checked without findings [BOOL]
*/

private _removedItems = [];
private _uniqueUnitItems = uniqueUnitItems [player];
private _allowedItems = KPLIB_arsenalAllowed;

// Loop through all units items and remove non-allowed items.
{
    private _currentElement = toLowerANSI _x;
    if !(_currentElement in _allowedItems) then {
        if (([_x] call KPLIB_fnc_isRadio)) exitWith {};
        _removedItems pushBack _x;
        switch _x do {
            case (headgear player): {removeHeadgear player};
            case (goggles player): {removeGoggles player};
            case (uniform player): {removeUniform player};
            case (vest player): {removeVest player};
            case (backpack player): {removeBackpack player};
            default {player removeItems _x}
        };
    };
} forEach _uniqueUnitItems;

// Show hint and log list, if something was found
if (_removedItems isNotEqualTo []) exitWith {
    [_removedItems] spawn {
        params ["_removedItems"];
        [format ["Found %1 at player %2", _removedItems, name player], "BLACKLIST"] remoteExecCall ["KPLIB_fnc_log", 2];
        hint format [localize "STR_BLACKLISTED_ITEM_FOUND", _removedItems joinString "\n"];
        sleep 6;
        hintSilent "";
    };
    false
};

true