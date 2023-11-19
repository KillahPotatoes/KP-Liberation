scriptName "recalculate_timer";

waitUntil { !isNil "KPLIB_saveLoaded" };
waitUntil {KPLIB_saveLoaded};

while {true} do {
    sleep 3;
    please_recalculate = true;
};
