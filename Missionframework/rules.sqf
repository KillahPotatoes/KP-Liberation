if (!hasInterface) exitWith {};
    player createDiarySubject ["opsmode", localize LSTRING(opsmode)];
    player createDiaryRecord ["opsmode", [localize LSTRING(ops_rules), localize LSTRING(ops_rules_text)]];
    player createDiaryRecord ["opsmode", [localize LSTRING(missions), localize LSTRING(missions_text)]];
    player createDiaryRecord ["opsmode", [localize LSTRING(ops_freq), localize LSTRING(ops_freq_text)]];
    player createDiaryRecord ["opsmode", [localize LSTRING(ops_radios), localize LSTRING(ops_radios_text)]];