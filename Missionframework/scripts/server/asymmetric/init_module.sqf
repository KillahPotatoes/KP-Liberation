// Scripts
// Logistic convoy ambush
logistic_convoy_ambush = compileScript ["scripts\server\asymmetric\convoy\logistic_convoy_ambush.sqf", true];
// IED spawner for blufor sectors
manage_asymIED = compileScript ["scripts\server\asymmetric\ied\manage_asymIED.sqf", true];
// Spawner for guerilla ambushes in blufor sectors
asym_sector_ambush = compileScript ["scripts\server\asymmetric\random\asym_sector_ambush.sqf", true];
// Spawner for guerilla forces who join a fight at an opfor sector
sector_guerilla = compileScript ["scripts\server\asymmetric\random\sector_guerilla.sqf", true];

// Globals
// List sectors which are just liberated. Preventing direct ambush spawn.
asymm_blocked_sectors = [];
publicVariable "asymm_blocked_sectors";

// Start module loop
execVM "scripts\server\asymmetric\asymmetric_loop.sqf";
