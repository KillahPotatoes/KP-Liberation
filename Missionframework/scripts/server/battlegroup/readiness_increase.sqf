waitUntil {!isNil "save_is_loaded" && {save_is_loaded}};

while {true} do {
    if ((count blufor_sectors) >= ((count sectors_allSectors) * 0.9)) then {
        if (combat_readiness > 0) then {
            combat_readiness = combat_readiness - 0.25;
        };
    } else {
        if (
            (combat_readiness < ((count blufor_sectors) * 2) && combat_readiness < 35)
            || (combat_readiness < ((count blufor_sectors) * 1.25) && combat_readiness < 60)
        ) then {
            combat_readiness = combat_readiness + 0.25;
            stats_readiness_earned = stats_readiness_earned + 0.25;
        };
    };
    if (combat_readiness > 100.0 && GRLIB_difficulty_modifier < 2) then {combat_readiness = 100.0};
    sleep (180 + random (180));
};
