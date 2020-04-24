if ( GRLIB_permissions_param ) then {

    waitUntil { !(isNil "GRLIB_permissions") };

    sleep 5;

    while { count GRLIB_permissions == 0 } do {
        hint localize "STR_PERMISSION_WARNING";
        sleep 5;
    };

    hintSilent "";

};
