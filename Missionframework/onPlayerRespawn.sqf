/*
    KP LIBERATION RESPAWN EVENTHANDLING FILE

    File: onPlayerRespawn.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2017-10-16
    Last Update: 2018-11-12
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        This is running everytime a player respawns and/or entering the mission.
*/

waitUntil {!isNil "KPLIB_intro_running"};
waitUntil {!KPLIB_intro_running};

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

// Disable stamina if selected in settings
if !(KPLIB_param_stamina) then {
    player enableStamina false;
};

/*
    --- TODO ---
    All the actions are still available on the corpse of a player, when they die.
    In one of the upcoming tasks we need to adjust the conditions (e.g. _target == player) or plan some kind of action manager.
*/

// Add player menu action
player addAction ["<t color='#FF8000'>" + localize "STR_ACTION_PLAYER_MENU" + "</t>", {[] call KPLIB_fnc_plm_openDialog;}, nil, -803, false, true, "", 'player == _originalTarget'];

// Add admin menu action, if player is logged in Admin
if (serverCommandAvailable "#kick") then {
    player addAction ["<t color='#FF8000'>" + localize "STR_ACTION_ADMIN_MENU" + "</t>", {[] call KPLIB_fnc_adm_openDialog;}, nil, -804, false, true, "", 'player == _originalTarget'];
};
