/*
    KP LIBERATION MODULE INITIALIZATION

    File: initModule.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-06-02
    Last Update: 2018-08-04
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    This module provides the KP player menu.
    The chosen settings in this dialog will be persistent for a player on all servers which run a mission who uses this dialog.
    It provides the following functionalities to the player:
        * Group Management
        * View Distances
        * Sound Settings

    Dependencies:
    NONE
*/

// Read the module globals
call compile preprocessFileLineNumbers "modules\99_playerMenu\globals.sqf";
