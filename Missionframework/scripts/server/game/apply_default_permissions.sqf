scriptName "apply_default_permissions";

if (!KPLIB_param_permissions) exitWith {};

waitUntil {!isNil "KPLIB_permissions"};
waitUntil {!isNil "KPLIB_saveLoaded"};
waitUntil {KPLIB_saveLoaded};

while {true} do {

    private _default_permissions = [];
    {if ((_x select 0) == "Default") exitWith {_default_permissions = (_x select 2);}} foreach KPLIB_permissions;

    if (count _default_permissions > 0) then {
        private _all_players_uids = [];
        {if ((_x select 0) != "Default") then {_all_players_uids pushback (_x select 0)}} foreach KPLIB_permissions;

        private _old_count = count KPLIB_permissions;
        {
            if !(((getPlayerUID _x) in _all_players_uids) || ((getPlayerUID _x) isEqualTo "")) then {
                KPLIB_permissions pushBack [getPlayerUID _x, name _x, _default_permissions];
            };
        } foreach (allPlayers - entities "HeadlessClient_F");

        if (_old_count != count KPLIB_permissions) then {
            publicVariable "KPLIB_permissions"
        };
    };

    sleep 10;

};
