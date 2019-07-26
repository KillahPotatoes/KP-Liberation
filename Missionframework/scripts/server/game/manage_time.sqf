while {true} do {
    if (GRLIB_shorter_nights && (daytime > 20 || daytime < 4)) then {
        setTimeMultiplier (GRLIB_time_factor * 4);
    } else {
        setTimeMultiplier GRLIB_time_factor;
    };
    sleep 10;
};
