diag_log format ["[KP LIBERATION] [INIT] Time: %1 - Mission initialization started", diag_tickTime];

// Deactivate vanilla saving
enableSaving [false, false];

// Initialize mission
call compile preprocessFileLineNumbers "modules\00_init\initModule.sqf";

diag_log format ["[KP LIBERATION] [INIT] Time: %1 - Mission initialization finished", diag_tickTime];

KPLIB_initServerDone = true;
publicVariable "KPLIB_initServerDone";
