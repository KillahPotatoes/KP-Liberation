scriptName "readiness_increase";

waitUntil {!isNil "KPLIB_saveLoaded" && {KPLIB_saveLoaded}};

while {true} do {
    if ((count KPLIB_sectors_player) >= ((count KPLIB_sectors_all) * 0.9)) then {
        if (KPLIB_enemyReadiness > 0) then {
            KPLIB_enemyReadiness = KPLIB_enemyReadiness - 0.25;
        };
    } else {
        if (
            (KPLIB_enemyReadiness < ((count KPLIB_sectors_player) * 2) && KPLIB_enemyReadiness < 35)
            || (KPLIB_enemyReadiness < ((count KPLIB_sectors_player) * 1.25) && KPLIB_enemyReadiness < 60)
        ) then {
            KPLIB_enemyReadiness = KPLIB_enemyReadiness + 0.25;
            stats_readiness_earned = stats_readiness_earned + 0.25;
        };
    };
    if (KPLIB_enemyReadiness > 100.0 && KPLIB_param_difficulty < 2) then {KPLIB_enemyReadiness = 100.0};
    sleep (180 + random (180));
};
