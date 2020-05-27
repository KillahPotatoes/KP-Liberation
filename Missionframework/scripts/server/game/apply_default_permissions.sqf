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
            if (!((name _x) in ["HC1", "HC2", "HC3"])) then {
                if (!((getPlayerUID _x) in _all_players_uids)) then {
                    KPLIB_permissions pushback [(getPlayerUID _x), (name _x), _default_permissions];
                };
            };
        } foreach allPlayers;

        if (_old_count != count KPLIB_permissions) then {
            publicVariable "KPLIB_permissions"
        };
    };

    sleep 10;

};
