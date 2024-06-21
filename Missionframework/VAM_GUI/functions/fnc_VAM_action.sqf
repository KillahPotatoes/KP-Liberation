//VAM Action
disableSerialization;
VAM_condition_result = true;
VAM_cursor_condition = false;
VAM_check_locality = compileFinal "
    params ['_target', '_caller'];
    if (!(owner _target isEqualTo _caller) && !(unitIsUAV _target)) then {
        _target setOwner _caller;
    };
    if (!(owner _target isEqualTo _caller) && unitIsUAV _target) then {
        (group _target) setGroupOwner _caller;
    };
";
VAM_action = compileFinal "
    player addAction
    [
        'Modify Vehicle',
        {
            if (VAM_cursor_condition) then {
                VAM_targetvehicle = cursorObject;
                _my_id = clientOwner;
                [VAM_targetvehicle, _my_id] remoteExec ['VAM_check_locality', 2];
            } else {
                VAM_targetvehicle = vehicle player;
            };
            0 = createDialog 'VAM_GUI';
        },
        [], 0, false, true, '',
        'VAM_condition_result && (VAM_cursor_condition || (!(player isEqualTo vehicle player) && (player isEqualTo driver vehicle player)))',
        -1
    ];
";

[] spawn VAM_action;

player addEventHandler ["Respawn", {[] spawn VAM_action;}];

while {true} do {
    if (player isEqualTo vehicle player && cursorObject isKindOf "AllVehicles" && player distance cursorObject < 10 && ((crew cursorObject isEqualTo []) || (unitIsUAV cursorObject && !(isUAVConnected cursorObject)))) then {
        _vehicleclass = typeof cursorObject;
        _camo_path = "true" configClasses (configfile >> "CfgVehicles" >> _vehicleclass >> "TextureSources");
        _camo_check = true;
        if (count _camo_path < 1 && !(_vehicleclass in VAM_exceptions)) then {
            _camo_check = false;
        };
        _comp_path = configProperties [configfile >> "CfgVehicles" >> _vehicleclass >> "AnimationSources", "!('' isEqualTo getText (_x >> 'DisplayName'))"];
        _comp_check = true;
        if (count _comp_path < 1) then {
            _comp_check = false;
        };
        if (_camo_check || _comp_check) then {
            VAM_cursor_condition = true;
        } else {
            VAM_cursor_condition = false;
        };
    } else {
        VAM_cursor_condition = false;
    };
    sleep 1;
};