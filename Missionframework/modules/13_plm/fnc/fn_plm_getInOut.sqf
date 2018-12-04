/*
    KPLIB_fnc_plm_getInOut

    File: fn_plm_getInOut.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-08-05
    Last Update: 2018-11-10
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Sets the view distance and the sound volume of the player depending on the current vehicle.
        Also changes the camera view, if functionality is enabled by the player.

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/

// Player on foot
if (isNull objectParent player) then {
    setViewDistance KPLIB_plm_viewFoot;
    setObjectViewDistance KPLIB_plm_viewFoot;
    1 fadeSound 1;
};

// Player in boat or land vehicle
if (vehicle player isKindOf "LandVehicle" || vehicle player isKindOf "Ship") then {
    setViewDistance KPLIB_plm_viewVeh;
    setObjectViewDistance KPLIB_plm_viewVeh;
    1 fadeSound KPLIB_plm_soundVeh;
    if (difficultyOption "thirdPersonView" == 1) then {
        if (KPLIB_plm_tpv > 1) then {player switchCamera "EXTERNAL";};
    };
};

// Player in air vehicle
if (vehicle player isKindOf "Air") then {
    setViewDistance KPLIB_plm_viewAir;
    setObjectViewDistance KPLIB_plm_viewAir;
    1 fadeSound KPLIB_plm_soundVeh;
    if (difficultyOption "thirdPersonView" == 1) then {
        if (KPLIB_plm_tpv == 1 || KPLIB_plm_tpv == 3) then {player switchCamera "EXTERNAL";};
    };
};

true
