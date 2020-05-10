waitUntil { !isNil "save_is_loaded" };
waitUntil { save_is_loaded };

while { true } do {
    sleep 1;
    stats_playtime = stats_playtime + 1;
};
