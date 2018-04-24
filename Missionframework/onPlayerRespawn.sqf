/*
    KP LIBERATION RESPAWN EVENTHANDLING FILE

    File: onPlayerRespawn.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2017-10-16
    Last Update: 2018-03-28
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    This is running everytime a player respawns and/or entering the mission.
*/

waitUntil {!isNil "KPLIB_initDone"};
waitUntil {KPLIB_initDone};
waitUntil {!isNil "KPLIB_intro_done"};
waitUntil {KPLIB_intro_done};
waitUntil {!isNil "KPLIB_intro_stopped"};
waitUntil {KPLIB_intro_stopped};

// Remove all items
removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;

// Add basic items
player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "ItemWatch";
player linkItem "ItemRadio";

// Disable fatique if selected in parameters
if (KPLIB_param_fatigue == 0) then {
    player enableStamina false;
};

// Spawn redeploy dialog
[] spawn KPLIB_fnc_core_redeploy;
