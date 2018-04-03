if (KP_liberation_asymmetric_debug > 0) then {private _text = format ["[KP LIBERATION] [ASYMMETRIC] Module initialising on: %1", debug_source];_text remoteExec ["diag_log",2];};

// Scripts
// Logistic convoy ambush
logistic_convoy_ambush = compileFinal preprocessFileLineNumbers "scripts\server\asymmetric\convoy\logistic_convoy_ambush.sqf";
// IED spawner for blufor sectors
manage_asymIED = compileFinal preprocessFileLineNumbers "scripts\server\asymmetric\ied\manage_asymIED.sqf";
// Spawner for guerilla ambushes in blufor sectors
asym_sector_ambush = compileFinal preprocessFileLineNumbers "scripts\server\asymmetric\random\asym_sector_ambush.sqf";
// Spawner for guerilla forces who join a fight at an opfor sector
sector_guerilla = compileFinal preprocessFileLineNumbers "scripts\server\asymmetric\random\sector_guerilla.sqf";

// Globals
// List sectors which are just liberated. Preventing direct ambush spawn.
asymm_blocked_sectors = [];
publicVariable "asymm_blocked_sectors";

// Start module loop
execVM "scripts\server\asymmetric\asymmetric_loop.sqf";

if (KP_liberation_asymmetric_debug > 0) then {private _text = format ["[KP LIBERATION] [ASYMMETRIC] Module initialised on: %1", debug_source];_text remoteExec ["diag_log",2];};
