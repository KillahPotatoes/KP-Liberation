waitUntil {sleep 1; !isNil "active_sectors"};

while {true} do {
    uiSleep 600;
    private _markedgroups = 0;
    {
        private _groupOwner = groupOwner _x;
        private _owner = "Server";

        if (_groupOwner != 2) then {
            _owner = name ((allPlayers select {_groupOwner == (owner _x)}) select 0);
        };

        if !(isNil "_owner") then {
            if !(isGroupDeletedWhenEmpty _x) then {
                if (local _x) then {
                    _x deleteGroupWhenEmpty true;
                } else {
                    [_x, true] remoteExec ["deleteGroupWhenEmpty", groupOwner _x];
                };
                _markedgroups = _markedgroups + 1;
            };
        };
    } forEach allGroups;
};
