scriptName "recalculate_timer_sector";

waitUntil {!isNil "KPLIB_saveLoaded"};
waitUntil {KPLIB_saveLoaded};

while {true} do {
    uiSleep 60;
    recalculate_sectors = true;
    sectors_timer = true;
};
