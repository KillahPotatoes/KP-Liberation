/*
    KPLIB_fnc_core_paramToText

    File: fn_core_paramToText.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-05-01
    Last Update: 2018-05-01
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Converts value of param to "texts" string

    Parameter(s):
        0: STRING - Parameter name
        1: NUMBER - Parameter value

    Returns:
    STRING
*/
params ["_name", "_value"];

private _paramClass = missionConfigFile >> "Params" >> _name;

// Get "texts" element at position of "value" in "values"
private _text = (
    getArray (_paramClass >> "texts") param [
        getArray(_paramClass >> "values") find _value
    ]
);

if(isNil "_text") then {
    _text = _value;
};

_text
