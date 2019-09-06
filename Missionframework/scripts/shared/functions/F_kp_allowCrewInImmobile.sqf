/*
    F_allowKrewInImmobile

    File: F_kp_allowCrewInImmobile.sqf
    Author: veteran29 - https://github.com/veteran29
    Date: 2019-09-05
    Last Update: 2019-09-05

    Description:
        Allows crew in immobile vehicle depending on AllowEnemiesInImmobile parameters.

    Parameter(s):
        0: OBJECT - Vehicle which should allow immobile crew. (Default objNull)

    Returns:
    BOOL
*/
params [
    ["_vehicle", objNull, [objNull]]
];

// KP_liberation_allowEnemiesInImmobile (0-50-100)
_vehicle allowCrewInImmobile (random 100 < KP_liberation_allowEnemiesInImmobile);

true
