scriptName "[KPLIB] Enforce Whitelist";

if (!KPLIB_param_cmdrWhitelist) exitWith {};

waitUntil {alive player};
sleep 1;

if (player isEqualTo ([] call KPLIB_fnc_getCommander) && !(serverCommandAvailable "#kick")) then {
    if !((getPlayerUID player) in KPLIB_whitelist_cmdrSlot) then {
        sleep 1;
        endMission "END1";
    };
};
