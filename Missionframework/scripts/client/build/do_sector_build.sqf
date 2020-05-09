private ["_vector", "_idactcancel", "_idactplace", "_idactvector", "_ghost_spot", "_truedir", "_dist", "_truepos", "_sectorpos", "_building"];

if (((_this select 3) select 0) == KP_liberation_small_storage_building) then {

    _truepos = [];

    build_confirmed = 1;
    build_invalid = 0;
    KP_vector = true;

    _sectorpos = markerPos ([100] call KPLIB_fnc_getNearestSector);

    _idactcancel = player addAction ["<t color='#B0FF00'>" + localize "STR_CANCEL" + "</t> <img size='2' image='res\ui_cancel.paa'/>",{build_confirmed = 3;},"",-725,false,true,"","build_confirmed == 1"];
    _idactplace = player addAction ["<t color='#B0FF00'>" + localize "STR_PLACEMENT" + "</t> <img size='2' image='res\ui_confirm.paa'/>",{build_confirmed = 2;},"",-775,false,true,"","build_invalid == 0 && build_confirmed == 1"];
    _idactvector = player addAction ["<t color='#B0FF00'>" + localize "STR_VECACTION" + "</t>",{KP_vector = !KP_vector;},"",-800,false,false,"","build_confirmed == 1"];

    _ghost_spot = (markerPos "ghost_spot") findEmptyPosition [0,100];

    _building = ((_this select 3) select 0) createVehicleLocal _ghost_spot;
    _building allowdamage false;
    _building setVehicleLock "LOCKED";
    _building enableSimulationGlobal false;

    _dist = 0.6 * (sizeOf ((_this select 3) select 0));
    if (_dist < 3.5) then { _dist = 3.5 };
    _dist = _dist + 0.5;

    for [{_i=0}, {_i<5}, {_i=_i+1}] do {
        _building setObjectTextureGlobal [_i, '#(rgb,8,8,3)color(0,1,0,0.8)'];
    };

    while {build_confirmed == 1 && alive player} do {
        _truedir = 90 - (getdir player);
        _truepos = [((getpos player) select 0) + (_dist * (cos _truedir)), ((getpos player) select 1) + (_dist * (sin _truedir)),0];

        if ((surfaceIsWater _truepos) || (surfaceIsWater getpos player) || ((_truepos distance _sectorpos) > 100)) then {
            _building setpos _ghost_spot;
            build_invalid = 1;

            if(((surfaceIsWater _truepos) || (surfaceIsWater getpos player))) then {
                GRLIB_ui_notif = localize "STR_BUILD_ERROR_WATER";
            };

            if((_truepos distance _sectorpos) > 100) then {
                GRLIB_ui_notif = format [localize "STR_BUILD_ERROR_DISTANCE",100];
            };
        } else {
            _building setdir (getDir player);
            _building setpos _truepos;

            if (KP_vector) then {
                _building setVectorUp [0,0,1];
            } else {
                _building setVectorUp surfaceNormal position _building;
            };

            if (build_invalid == 1) then {
                GRLIB_ui_notif = "";
            };

            build_invalid = 0;
        };

        sleep 0.05;
    };

    GRLIB_ui_notif = "";

    if (!alive player || build_confirmed == 3) then {
        deleteVehicle _building;
    };

    if (build_confirmed == 2) then {
        _vehpos = getpos _building;
        _vehdir = getdir _building;
        deleteVehicle _building;
        sleep 0.1;
        _building = ((_this select 3) select 0) createVehicle _truepos;
        _building allowDamage false;
        _building setdir _vehdir;
        _building setpos _truepos;

        if (KP_vector) then {
            _building setVectorUp [0,0,1];
        } else {
            _building setVectorUp surfaceNormal position _building;
        };

        _building setVariable ["KP_liberation_storage_type", 1, true];

        sleep 0.3;
        _building allowDamage true;
        _building setDamage 0;
    };

    player removeAction _idactcancel;
    player removeAction _idactplace;
    player removeAction _idactvector;

    recalculate_sectors = true;
    publicVariable "recalculate_sectors";

    build_confirmed = 0;
} else {
    [player getVariable ["KPLIB_nearProd", []], ((_this select 3) select 0), clientOwner] remoteExec ["build_fac_remote_call",2];
};
