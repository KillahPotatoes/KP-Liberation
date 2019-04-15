#include "script_component.hpp"
/*
    KPLIB_fnc_cratefiller_search

    File: fn_cratefiller_search.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-04-15
    Last Update: 2019-04-15
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

    Description:
        Search for a weapon with the name entered in the search bar.

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/

// Dialog controls
private _dialog = findDisplay 758026;
private _ctrlWeapon = _dialog displayCtrl 68742;
private _ctrlSearch = _dialog displayCtrl 68743;

// Clear the listBox
lbClear _ctrlWeapon;

// Get the editBox Data
private _search = toLower (ctrlText _ctrlSearch);

// Get the available weapons
private _weapons = CGVAR("weapons", []);

// Variables
private _foundWeapons = [];
private _index = 0;
private _config = "";

// Cross search the weapons array
{
    if !(((toLower (_x select 0)) find _search) isEqualTo -1) then {
        _foundWeapons pushBack _x;
    };
} forEach _weapons;

// Apply the found weapons to the dialog
{
    _index = _ctrlWeapon lbAdd (_x select 0);
    _ctrlWeapon lbSetData [_index , _x select 1];
    _config = [_x select 1] call KPLIB_fnc_cratefiller_getConfigPath;
    _ctrlWeapon lbSetPicture [_index, getText (_config >> "picture")];
} forEach _foundWeapons;

true
