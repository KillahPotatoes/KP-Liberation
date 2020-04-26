/*
    File: fn_getPlayerCount.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-11-25
    Last Update: 2019-11-25
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Returns the number of connected players without counting headless clients.

    Parameter(s):
        NONE

    Returns:
        Amount of players [NUMBER]
*/

count (allPlayers - entities "HeadlessClient_F")
