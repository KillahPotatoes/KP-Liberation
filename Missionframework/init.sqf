enableSaving [ false, false ];

if (isDedicated) then {debug_source = "Server";} else {debug_source = name player;};

[] call compileFinal preprocessFileLineNumbers "scripts\shared\liberation_functions.sqf";
[] call compileFinal preprocessFileLineNumbers "scripts\shared\init_sectors.sqf";
[] call compileFinal preprocessFileLineNumbers "scripts\shared\fetch_params.sqf";
[] call compileFinal preprocessFileLineNumbers "kp_liberation_config.sqf";

switch (KP_liberation_preset) do {
	case 0: {[] call compileFinal preprocessFileLineNumbers "presets\custom.sqf";};
	case 1: {[] call compileFinal preprocessFileLineNumbers "presets\apex_tanoa.sqf";};
	case 2: {[] call compileFinal preprocessFileLineNumbers "presets\rhs.sqf";};
	case 3: {[] call compileFinal preprocessFileLineNumbers "presets\rhs_bw.sqf";};
	case 4: {[] call compileFinal preprocessFileLineNumbers "presets\rhs_takistan.sqf";};
	case 5: {[] call compileFinal preprocessFileLineNumbers "presets\3cbBAF.sqf";};
	default {[] call compileFinal preprocessFileLineNumbers "presets\custom.sqf";};
};

[] call compileFinal preprocessFileLineNumbers "scripts\shared\classnames.sqf";

[] execVM "GREUH\scripts\GREUH_activate.sqf";

[] call compileFinal preprocessFileLineNumbers "scripts\shared\init_shared.sqf";

if (isServer) then {
	[] call compileFinal preprocessFileLineNumbers "scripts\server\init_server.sqf";
};

if (!isDedicated && !hasInterface && isMultiplayer) then {
	[] spawn compileFinal preprocessFileLineNumbers "scripts\server\offloading\hc_manager.sqf";
};

if (!isDedicated && hasInterface) then {
	waitUntil { alive player };
	[] call compileFinal preprocessFileLineNumbers "scripts\client\init_client.sqf";
} else {
	setViewDistance 1600;
};

if (KP_liberation_debug) then {private _text = format ["[KP LIBERATION] [DEBUG] init.sqf done for: %1", debug_source];_text remoteExec ["diag_log",2];};
