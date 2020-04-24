_reset_time = 1800;

reinforcements_set = false;

while { true } do {

    waitUntil { sleep 0.3; reinforcements_set };
    reinforcements_set = false;

    _localtime = time;

    waitUntil { sleep 0.3; ( time > ( _localtime + _reset_time ) ) || reinforcements_set };

    if ( !reinforcements_set && !([] call KPLIB_fnc_isBigtownActive) ) then { reinforcements_sector_under_attack = ""; }

};
