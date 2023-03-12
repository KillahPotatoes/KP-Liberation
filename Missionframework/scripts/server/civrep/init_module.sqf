// Functions
// Get buildings count for sector
F_cr_getBuildings = compileScript ["scripts\server\civrep\fnc\f_kp_cr_getBuildings.sqf", true];
// Change CR value
F_cr_changeCR = compileScript ["scripts\server\civrep\fnc\f_kp_cr_changeCR.sqf", true];
// Reputation gain for liberating a sector
F_cr_liberatedSector = compileScript ["scripts\server\civrep\fnc\f_kp_cr_liberatedSector.sqf", true];
// Play random wounded animation on unit
F_cr_woundedAnim = compileScript ["scripts\server\civrep\fnc\f_kp_cr_woundedAnim.sqf", true];

// Scripts
// Spawn wounded civilians in a sector
civrep_wounded_civs = compileScript ["scripts\server\civrep\wounded\civrep_wounded_civs.sqf", true];
// Count initial buildings on each city and bigtown
execVM "scripts\server\civrep\init_buildings.sqf";
