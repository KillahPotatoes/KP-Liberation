waitUntil {!isNil "save_is_loaded"};
waitUntil {save_is_loaded};

while {true} do {
    uiSleep 60;
    recalculate_sectors = true;
    sectors_timer = true;
};
