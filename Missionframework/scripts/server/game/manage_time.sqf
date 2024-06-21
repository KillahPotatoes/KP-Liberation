scriptName "manage_time";

while {true} do {
    if (KPLIB_param_shorterNights && (daytime > 20 || daytime < 4)) then {
        setTimeMultiplier (KPLIB_param_timeMulti * 2.75);
    } else {
        setTimeMultiplier KPLIB_param_timeMulti;
    };
    sleep 10;
};
