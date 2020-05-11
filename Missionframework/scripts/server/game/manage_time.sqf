while {true} do {
    if (KPLIB_shorter_nights && (daytime > 20 || daytime < 4)) then {
        setTimeMultiplier (KPLIB_time_factor * 4);
    } else {
        setTimeMultiplier KPLIB_time_factor;
    };
    sleep 10;
};
