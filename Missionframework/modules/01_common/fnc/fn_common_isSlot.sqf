/*
    KPLIB_fnc_common_isSlot

    File: fn_common_isSlot.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-03-31
    Last Update: 2019-03-31
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: Yes

    Description:
        Checks if the player occupies given slot.

    Parameter(s):
        _slotName - Name of the slot to check without KPLIB_eden_ prefix [STRING, defaults to "commander"]

    Returns:
        Player occupies slot [BOOL]
*/

params [
    ["_slotName", "commander", [""]]
];

(str player) isEqualTo ("KPLIB_eden_" + _slotName)
