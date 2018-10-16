/*
    KPLIB_fnc_core_paramDiaryList

    File: fn_core_paramDiaryList.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-05-01
    Last Update: 2018-05-01
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Creates diary entries with parameter values

    Parameter(s):
    NONE

    Returns:
    BOOL
*/

// Get all parameters
private _allParams = (KPLIB_params_persistent_array + KPLIB_params_array);

player createDiarySubject ["parameters", "Mission Parameters"];
private _text = "";

// Add diary entry for every param
{
    // Add divider
    _text = _text + "<img image='#(argb,8,8,3)color(1,1,1,0.1)' height='1' width='640' /><br /><br />";

    private _name = _x select 0;
    private _value = _x select 1;

    private _displayValue = [_name, _value] call KPLIB_fnc_core_paramToText;
    private _title = getText (missionConfigFile >> "Params" >> _name >> "title");
    _text = _text + format ["<font color='#ff8000'>%1</font><br /><font size='16'>%2</font>", _title, _displayValue];

} forEach(_allParams);

player createDiaryRecord ["parameters", ["Active", _text]];

true
