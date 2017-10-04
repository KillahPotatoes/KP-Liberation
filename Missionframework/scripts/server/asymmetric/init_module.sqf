if (KP_liberation_asymmetric_debug > 0) then {private _text = format ["[KP LIBERATION] [ASYMMETRIC] Module initialising on: %1", debug_source];_text remoteExec ["diag_log",2];};

// Scripts
// Start module loop
[] spawn compileFinal preprocessFileLineNumbers "scripts\server\asymmetric\asymmetric_loop.sqf";

if (KP_liberation_asymmetric_debug > 0) then {private _text = format ["[KP LIBERATION] [ASYMMETRIC] Module initialised on: %1", debug_source];_text remoteExec ["diag_log",2];};
