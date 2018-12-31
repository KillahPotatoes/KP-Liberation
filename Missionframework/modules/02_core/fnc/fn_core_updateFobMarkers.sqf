/*
    KPLIB_fnc_core_updateFobMarkers

    File: fn_core_updateFobMarkers.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-05-13
    Last Update: 2018-12-08
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Updates labels of FOB markers

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/

// Update label of every FOB marker
{
    _x setMarkerText format ["FOB %1", KPLIB_preset_alphabetF select (_forEachIndex)];
} forEach KPLIB_sectors_fobs;

true
