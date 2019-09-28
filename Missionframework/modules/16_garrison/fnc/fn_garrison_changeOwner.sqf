/*
    KPLIB_fnc_garrison_changeOwner

    File: fn_garrison_changeOwner.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-10-23
    Last Update: 2019-09-28
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: Yes

    Description:
        Changes the owner of a sector garrison from blufor to opfor or vice versa.

    Parameter(s):
        _sector - Markername of the sector [STRING, defaults to ""]

    Returns:
        Function reached the end [BOOL]
*/

params [
    ["_sector", "", [""]]
];

if (_sector isEqualTo "") exitWith {false};

// Get the sector reference in the garrison array and initialize new owner variable
private _persistentGarrisonRef = [_sector] call KPLIB_fnc_garrison_getGarrison;

// Switch owner
private _newOwner = [2, 0] select ((_persistentGarrisonRef select 1) isEqualTo 2);

// Update persistent garrison
_persistentGarrisonRef set [1, _newOwner];

true
