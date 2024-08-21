scriptName "KPLIB_playtime";

waitUntil { !isNil "KPLIB_saveLoaded" };
waitUntil { KPLIB_saveLoaded };

while { true } do {
    sleep 1;
    stats_playtime = stats_playtime + 1;
};
