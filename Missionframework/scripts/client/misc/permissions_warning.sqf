if ( KPLIB_param_permissions ) then {

    waitUntil { !(isNil "KPLIB_permissions") };

    sleep 5;

    while { count KPLIB_permissions == 0 } do {
        hint localize "STR_PERMISSION_WARNING";
        sleep 5;
    };

    hintSilent "";

};
