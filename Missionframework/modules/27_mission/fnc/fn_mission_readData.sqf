/*
    KPLIB_fnc_mission_readData

    File: fn_mission_readData.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-06-21
    Last Update: 2019-06-22
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

    Description:
        Reads the data of the given listbox.

    Parameter(s):
        _ctrl   - The given control which contains the data [CONTROL, defaults to controlNull]
        _index  - The row index of the control              [NUMBER, defaults to 0]

    Returns:
        Control data [STRING]
*/

params [
    ["_ctrl", controlNull, [controlNull]],
    ["_index", 0, [0]]
];

_ctrl lnbData [_index, 0];
