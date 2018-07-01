/*
    KP LIBERATION MODULE INITIALIZATION

    File: initModule.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-07-01
    Last Update: 2018-07-01
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    This module provides building functionalities

    Dependencies:
        * 01_core
*/

call compile preprocessFileLineNumbers "modules\02_build\globals.sqf";

call KPLIB_fnc_build_setupPlayerActions;
