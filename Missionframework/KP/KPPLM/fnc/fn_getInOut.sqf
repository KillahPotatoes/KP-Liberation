/*
    KPPLM_fnc_getInOut

    File: fn_getInOut.sqf
    Author: Wyqer - https://github.com/KillahPotatoes
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
    setViewDistance KPPLM_viewFoot;
    setObjectViewDistance KPPLM_viewFoot;
    1 fadeSound 1;
};

// Player in boat or land vehicle
if (vehicle player isKindOf "LandVehicle" || vehicle player isKindOf "Ship") then {
    setViewDistance KPPLM_viewVeh;
    setObjectViewDistance KPPLM_viewVeh;
    1 fadeSound KPPLM_soundVeh;
    if (difficultyOption "thirdPersonView" == 1) then {
        if (KPPLM_tpv > 1) then {player switchCamera "EXTERNAL";};
    };
};

// Player in air vehicle
if (vehicle player isKindOf "Air") then {
    setViewDistance KPPLM_viewAir;
    setObjectViewDistance KPPLM_viewAir;
    1 fadeSound KPPLM_soundVeh;
    if (difficultyOption "thirdPersonView" == 1) then {
        if (KPPLM_tpv == 1 || KPPLM_tpv == 3) then {player switchCamera "EXTERNAL";};
    };
};

true
