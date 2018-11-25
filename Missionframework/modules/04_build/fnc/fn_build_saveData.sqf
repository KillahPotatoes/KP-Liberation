/*
    KPLIB_fnc_build_saveData

    File: fn_build_saveData.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-11-04
    Last Update: 2018-11-25
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Saves build module data.

    Parameter(s):
        NONE

    Returns:
        Data was saved [BOOL]
*/

if (KPLIB_param_debug) then {diag_log "[KP LIBERATION] [SAVE] Build module saving...";};

private _serializedData = [];
// Serialize data
{
    private _fobData = [_x, []];
    private _fobItems = (KPLIB_build_saveNamespace getVariable _x);
    // Foreach fob item, save className, pos and dirAndUp
    {
        if (alive _x) then {
            (_fobData select 1) pushBack [typeOf _x, getPosWorld _x, [vectorDir _x, vectorUp _x]];
        };
    } forEach _fobItems;

    _serializedData pushBack _fobData;

} forEach (allVariables KPLIB_build_saveNamespace);

// Set module data to save and send it to the global save data array
[
    "build",
    _serializedData
] call KPLIB_fnc_init_setSaveData;

true
