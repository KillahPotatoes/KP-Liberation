if (KP_liberation_civinfo_debug > 0) then {private _text = format ["[KP LIBERATION] [CIVINFO] Module initialising on: %1", debug_source];_text remoteExec ["diag_log",2];};

// Scripts
// Start spawn loop
[] spawn compileFinal preprocessFileLineNumbers "scripts\server\civinformant\civinfo_loop.sqf";

if (KP_liberation_civinfo_debug > 0) then {private _text = format ["[KP LIBERATION] [CIVINFO] Module initialised on: %1", debug_source];_text remoteExec ["diag_log",2];};
