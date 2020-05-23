waitUntil {!isNil "KPLIB_saveLoaded" && {KPLIB_saveLoaded}};

while {true} do {
    if ((count KPLIB_sectors_player) >= ((count KPLIB_sectors_all) * 0.9)) then {
        if (combat_readiness > 0) then {
            combat_readiness = combat_readiness - 0.25;
        };
    } else {
        if (
            (combat_readiness < ((count KPLIB_sectors_player) * 2) && combat_readiness < 35)
            || (combat_readiness < ((count KPLIB_sectors_player) * 1.25) && combat_readiness < 60)
        ) then {
            combat_readiness = combat_readiness + 0.25;
            stats_readiness_earned = stats_readiness_earned + 0.25;
        };
    };
    if (combat_readiness > 100.0 && KPLIB_param_difficulty < 2) then {combat_readiness = 100.0};
    sleep (180 + random (180));
};
