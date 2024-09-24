scriptName "intel_manager";
// TODO Remove this loop by adding the actions to the units/intel objects on spawn
waitUntil {!isNil "KPLIB_permissions"};
waitUntil {!(KPLIB_permissions isEqualTo []) || !KPLIB_param_permissions};

private _near_people = [];
private _near_intel = [];
private _actionned_captive_units = [];
private _actionned_intel_items = [];

while {true} do {
    if ([5] call KPLIB_fnc_hasPermission) then {
        _near_people = (getPosATL player) nearEntities [["Man"], 5];
        _near_intel = (getPosATL player) nearEntities [KPLIB_intelObjectClasses, 5];
        {
            if ((captive _x) && !(_x in _actionned_captive_units) && !((side group _x) == KPLIB_side_player) && !(_x getVariable ["ACE_isUnconscious", false])) then {
                _x addAction ["<t color='#FFFF00'>" + localize "STR_SECONDARY_CAPTURE" + "</t>",{[_this select 0] join (group player);},"",-850,true,true,"","(vehicle player == player) && (side group _target != KPLIB_side_player) && (captive _target)"];
                _actionned_captive_units pushback _x;
            };
        } forEach _near_people;

        {
            if (!(alive _x) || ((player distance _x) > 5) || ((side group _x) == KPLIB_side_player)) then {
                removeAllActions _x;
                _actionned_captive_units = _actionned_captive_units - [_x];
            };
        } forEach _actionned_captive_units;

        {
            if !(_x in _actionned_intel_items) then {
                _x addAction ["<t color='#FFFF00'>" + localize "STR_INTEL" + "</t>",{[_this select 0] remoteExecCall ["intel_remote_call", 2];},"",-849,true,true,"","(vehicle player == player)"];
                _actionned_intel_items pushback _x;
            };
        } forEach _near_intel;

        {
            if ((player distance _x) > 5) then {
                removeAllActions _x;
                _actionned_intel_items = _actionned_intel_items - [_x];
            };
        } forEach _actionned_intel_items;
    } else {
        {
            removeAllActions _x;
            _actionned_captive_units = _actionned_captive_units - [_x];
        } forEach _actionned_captive_units;

        {
            removeAllActions _x;
            _actionned_intel_items = _actionned_intel_items - [_x];
        } forEach _actionned_intel_items;
    };
    sleep 3;
};
