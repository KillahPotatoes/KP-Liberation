private _idact_build = -1;
private _idact_arsenal = -1;
private _idact_buildfob = -1;
private _idact_redeploy = -1;
private _idact_tutorial = -1;
private _idact_squad = -1;
private _idact_commander = -1;
private _idact_production = -1;
private _idact_logistic = -1;
private _idact_repackage = -1;
private _idact_halo = -1;
private _idact_secondary = -1;
private _idact_zeus = -1;
private _idact_resources = -1;
private _idact_sectorstorage = -1;
private _idact_supplyfacility = -1;
private _idact_ammofacility = -1;
private _idact_fuelfacility = -1;
private _idact_clearance = -1;
private _distfob = (GRLIB_fob_range * 0.8);
private _distbuildfob = 10;
private _distspawn = 10;
private _distredeploy = 20;

GRLIB_removefobboxes = false;
KP_liberation_resources_global = false;
FOB_build_in_progress = false;

waitUntil {!isNil "build_confirmed"};
waitUntil {!isNil "one_synchro_done"};
waitUntil {!isNil "one_eco_done"};
waitUntil {one_synchro_done};
waitUntil {one_eco_done};

private _directAccess = (getPlayerUID player) in KP_liberation_commander_actions || {player == ([] call KPLIB_fnc_getCommander)} || {serverCommandAvailable "#kick"};

while {true} do {

    _nearfobbox = ((getpos player) nearEntities [[FOB_box_typename, FOB_truck_typename], _distbuildfob]);

    if (KP_liberation_mobilerespawn) then {
        KP_liberation_nearspawn = ((getpos player) nearEntities [[Respawn_truck_typename, huron_typename], _distspawn]);
    } else {
        KP_liberation_nearspawn = [];
    };

    if (GRLIB_removefobboxes) then {
        GRLIB_removefobboxes = false;
        if (count _nearfobbox > 0) then {
            deletevehicle (_nearfobbox select 0);
        };
    };

    if ( player getVariable ["KPLIB_nearStart", false] && alive player && vehicle player == player ) then {
        if (_idact_tutorial == -1) then {
            _idact_tutorial = player addAction ["<t color='#80FF80'>" + localize "STR_TUTO_ACTION" + "</t>","howtoplay = 1","",-740,false,true,"",""];
        };
    } else {
        if (_idact_tutorial != -1) then {
            player removeAction _idact_tutorial;
            _idact_tutorial = -1;
        };
    };

    if (((player getVariable ["KPLIB_fobDist", 99999]) < _distredeploy || player getVariable ["KPLIB_nearStart", false]) && alive player && vehicle player == player && GRLIB_halo_param > 0) then {
        if (_idact_halo == -1) then {
            _idact_halo = player addAction ["<t color='#80FF80'>" + localize "STR_HALO_ACTION" + "</t> <img size='2' image='res\ui_redeploy.paa'/>","scripts\client\spawn\do_halo.sqf","",-749,false,true,"","build_confirmed == 0"];
        };
    } else {
        if (_idact_halo != -1) then {
            player removeAction _idact_halo;
            _idact_halo = -1;
        };
    };

    if (((player getVariable ["KPLIB_fobDist", 99999]) < _distredeploy || count KP_liberation_nearspawn != 0 || player getVariable ["KPLIB_nearStart", false]) && alive player && vehicle player == player) then {
        if (_idact_redeploy == -1) then {
            _idact_redeploy = player addAction ["<t color='#80FF80'>" + localize "STR_DEPLOY_ACTION" + "</t> <img size='2' image='res\ui_redeploy.paa'/>","scripts\client\actions\redeploy.sqf","",-750,false,true,"","build_confirmed == 0"];
        };
    } else {
        if (_idact_redeploy != -1) then {
            player removeAction _idact_redeploy;
            _idact_redeploy = -1;
        };
    };

    if ((leader group player == player) && (count units group player > 1) && alive player && vehicle player == player) then {
        if (_idact_squad == -1) then {
            _idact_squad = player addAction ["<t color='#80FF80'>" + localize "STR_SQUAD_MANAGEMENT_ACTION" + "</t> <img size='2' image='\a3\Ui_F_Curator\Data\Displays\RscDisplayCurator\modeGroups_ca.paa'/>","scripts\client\ui\squad_management.sqf","",-760,false,true,"","build_confirmed == 0"];
        };
    } else {
        if (_idact_squad != -1) then {
            player removeAction _idact_squad;
            _idact_squad = -1;
        };
    };

    if (((player getVariable ["KPLIB_fobDist", 99999]) < _distredeploy || (player getVariable ["KPLIB_nearArsenal", false]) || count KP_liberation_nearspawn != 0 || player getVariable ["KPLIB_nearStart", false]) && alive player && vehicle player == player) then {
        if (_idact_arsenal == -1) then {
            _idact_arsenal = player addAction ["<t color='#FFFF00'>" + localize "STR_ARSENAL_ACTION" + "</t> <img size='2' image='res\ui_arsenal.paa'/>","scripts\client\actions\open_arsenal.sqf","",-980,true,true,"","build_confirmed == 0"];
        };
    } else {
        if (_idact_arsenal != -1) then {
            player removeAction _idact_arsenal;
            _idact_arsenal = -1;
        };
    };

    if ((player getVariable ["KPLIB_fobDist", 99999]) < _distfob && alive player && vehicle player == player && (([3] call KPLIB_fnc_hasPermission) || _directAccess)) then {
        if (_idact_build == -1) then {
            _idact_build = player addAction ["<t color='#FFFF00'>" + localize "STR_BUILD_ACTION" + "</t> <img size='2' image='res\ui_build.paa'/>","scripts\client\build\open_build_menu.sqf","",-985,false,true,"","build_confirmed == 0"];
        };
    } else {
        if (_idact_build != -1) then {
            player removeAction _idact_build;
            _idact_build = -1;
        };
    };

    if ((count _nearfobbox != 0) && (alive player) && (vehicle player == player) && !(surfaceIsWater getpos player) && ((player getVariable ["KPLIB_startbaseDist", 99999]) > 1000) && (([3] call KPLIB_fnc_hasPermission) || _directAccess) && !FOB_build_in_progress) then {
        if (_idact_buildfob == -1) then {
            _idact_buildfob = player addAction ["<t color='#FFFF00'>" + localize "STR_FOB_ACTION" + "</t> <img size='2' image='res\ui_deployfob.paa'/>","scripts\client\build\do_build_fob.sqf","",-990,false,true,"","build_confirmed == 0"];
        };
    } else {
        if (_idact_buildfob != -1) then {
            player removeAction _idact_buildfob;
            _idact_buildfob = -1;
        };
    };

    if ((player getVariable ["KPLIB_fobDist", 99999]) < _distredeploy && alive player && vehicle player == player && _directAccess) then {
        if (_idact_repackage == -1) then {
            _idact_repackage = player addAction ["<t color='#FFFF00'>" + localize "STR_FOB_REPACKAGE" + "</t> <img size='2' image='res\ui_deployfob.paa'/>","scripts\client\actions\do_repackage_fob.sqf","",-991,false,true,"","build_confirmed == 0"];
        };
    } else {
        if (_idact_repackage != -1) then {
            player removeAction _idact_repackage;
            _idact_repackage = -1;
        };
    };

    if ((count GRLIB_all_fobs > 0) && (GRLIB_endgame == 0) && ((player getVariable ["KPLIB_fobDist", 99999]) < _distredeploy || player getVariable ["KPLIB_nearStart", false]) && alive player && vehicle player == player && (([5] call KPLIB_fnc_hasPermission) || _directAccess)) then {
        if (_idact_secondary == -1) then {
            _idact_secondary = player addAction ["<t color='#FFFF00'>" + localize "STR_SECONDARY_OBJECTIVES" + "</t>","scripts\client\ui\secondary_ui.sqf","",-992,false,true,"","build_confirmed == 0"];
        };
    } else {
        if (_idact_secondary != -1) then {
            player removeAction _idact_secondary;
            _idact_secondary = -1;
        };
    };

    if ((count (player getVariable ["KPLIB_sectorProd", []])) == 12) then {
        if (alive player && vehicle player == player && ([3] call KPLIB_fnc_hasPermission || _directAccess) && ((count ((player getVariable ["KPLIB_sectorProd", []]) select 3)) == 0)) then {
            if (_idact_sectorstorage == -1) then {
                _idact_sectorstorage = player addAction ["<t color='#FFFF00'>" + localize "STR_SECSTORAGEBUILD_ACTION" + "</t>","scripts\client\build\do_sector_build.sqf",[KP_liberation_small_storage_building, (player getVariable ["KPLIB_sectorProd", []])],-993,false,true,"","build_confirmed == 0"];
            };
        } else {
            if (_idact_sectorstorage != -1) then {
                player removeAction _idact_sectorstorage;
                _idact_sectorstorage = -1;
            };
        };
        if (alive player && vehicle player == player && ([3] call KPLIB_fnc_hasPermission || _directAccess) && ((count ((player getVariable ["KPLIB_sectorProd", []]) select 3)) == 3) && !((player getVariable ["KPLIB_sectorProd", []]) select 4)) then {
            if (_idact_supplyfacility == -1) then {
                _idact_supplyfacility = player addAction ["<t color='#FFFF00'>" + localize "STR_SECSUPPLYBUILD_ACTION" + "</t>","scripts\client\build\do_sector_build.sqf",["supply", (player getVariable ["KPLIB_sectorProd", []])],-994,false,true,"","build_confirmed == 0"];
            };
        } else {
            if (_idact_supplyfacility != -1) then {
                player removeAction _idact_supplyfacility;
                _idact_supplyfacility = -1;
            };
        };
        if (alive player && vehicle player == player && ([3] call KPLIB_fnc_hasPermission || _directAccess) && ((count ((player getVariable ["KPLIB_sectorProd", []]) select 3)) == 3) && !((player getVariable ["KPLIB_sectorProd", []]) select 5)) then {
            if (_idact_ammofacility == -1) then {
                _idact_ammofacility = player addAction ["<t color='#FFFF00'>" + localize "STR_SECAMMOBUILD_ACTION" + "</t>","scripts\client\build\do_sector_build.sqf",["ammo", (player getVariable ["KPLIB_sectorProd", []])],-995,false,true,"","build_confirmed == 0"];
            };
        } else {
            if (_idact_ammofacility != -1) then {
                player removeAction _idact_ammofacility;
                _idact_ammofacility = -1;
            };
        };
        if (alive player && vehicle player == player && ([3] call KPLIB_fnc_hasPermission || _directAccess) && ((count ((player getVariable ["KPLIB_sectorProd", []]) select 3)) == 3) && !((player getVariable ["KPLIB_sectorProd", []]) select 6)) then {
            if (_idact_fuelfacility == -1) then {
                _idact_fuelfacility = player addAction ["<t color='#FFFF00'>" + localize "STR_SECFUELBUILD_ACTION" + "</t>","scripts\client\build\do_sector_build.sqf",["fuel", (player getVariable ["KPLIB_sectorProd", []])],-996,false,true,"","build_confirmed == 0"];
            };
        } else {
            if (_idact_fuelfacility != -1) then {
                player removeAction _idact_fuelfacility;
                _idact_fuelfacility = -1;
            };
        };
    } else {
        if (_idact_sectorstorage != -1) then {
            player removeAction _idact_sectorstorage;
            _idact_sectorstorage = -1;
        };
        if (_idact_supplyfacility != -1) then {
            player removeAction _idact_supplyfacility;
            _idact_supplyfacility = -1;
        };
        if (_idact_ammofacility != -1) then {
            player removeAction _idact_ammofacility;
            _idact_ammofacility = -1;
        };
        if (_idact_fuelfacility != -1) then {
            player removeAction _idact_fuelfacility;
            _idact_fuelfacility = -1;
        };
    };

    if ((player getVariable ["KPLIB_fobDist", 99999]) < _distfob && alive player && vehicle player == player) then {
        if (_idact_resources == -1) then {
            _idact_resources = player addAction ["<t color='#FFFF00'>" + localize "STR_RESOURCE_GLOBAL_ACTION" + "</t>",{KP_liberation_resources_global = !KP_liberation_resources_global},"",-997,false,true,"","build_confirmed == 0"];
        };
    } else {
        if (_idact_resources != -1) then {
            player removeAction _idact_resources;
            _idact_resources = -1;
        };
    };

    if ((((player getVariable ["KPLIB_fobDist", 99999]) < _distfob) || ((count (player getVariable ["KPLIB_sectorProd", []])) == 12)) && _directAccess && alive player && vehicle player == player && ((count KP_liberation_production) > 0)) then {
        if (_idact_production == -1) then {
            _idact_production = player addAction ["<t color='#FF8000'>" + localize "STR_PRODUCTION_ACTION" + "</t>","scripts\client\commander\open_production.sqf","",-998,false,true,"","build_confirmed == 0"];
        };
    } else {
        if (_idact_production != -1) then {
            player removeAction _idact_production;
            _idact_production = -1;
        };
    };

    if (KP_liberation_ailogistics) then {
        if (((player getVariable ["KPLIB_fobDist", 99999]) < _distfob) && _directAccess && alive player && vehicle player == player && (((count GRLIB_all_fobs) + (count KP_liberation_production)) > 1)) then {
            if (_idact_logistic == -1) then {
                _idact_logistic = player addAction ["<t color='#FF8000'>" + localize "STR_LOGISTIC_ACTION" + "</t>","scripts\client\commander\open_logistic.sqf","",-999,false,true,"","build_confirmed == 0"];
            };
        } else {
            if (_idact_logistic != -1) then {
                player removeAction _idact_logistic;
                _idact_logistic = -1;
            };
        };
    };

    if (_directAccess && alive player && vehicle player == player && GRLIB_permissions_param) then {
        if (_idact_commander == -1) then {
            _idact_commander = player addAction ["<t color='#FF8000'>" + localize "STR_COMMANDER_ACTION" + "</t> <img size='2' image='\a3\Ui_F_Curator\Data\Displays\RscDisplayCurator\modeGroups_ca.paa'/>","scripts\client\commander\open_permissions.sqf","",-1001,false,true,"","build_confirmed == 0"];
        };
    } else {
        if (_idact_commander != -1) then {
            player removeAction _idact_commander;
            _idact_commander = -1;
        };
    };

    if (!isNil("commandant")) then {
        if ((player == commandant) && (isNull(getAssignedCuratorLogic commandant))) then {
            if ( _idact_zeus == -1 ) then {
                _idact_zeus = player addAction ["<t color='#FF0000'>" + localize "STR_REASSIGN_ZEUS" + "</t>",{[] remoteExec ["zeus_remote_call",2];},"",-1002,false,true,"","build_confirmed == 0"];
            };
        } else {
            player removeAction _idact_zeus;
            _idact_zeus = -1;
        };
    };

    if ((player getVariable ["KPLIB_fobDist", 99999]) < _distfob && alive player && vehicle player == player && _directAccess) then {
        if (_idact_clearance == -1) then {
            _idact_clearance = player addAction [
                "<t color='#FFFF00'>" + localize "STR_CLEARANCE_ACTION" + "</t>",
                {[_this select 3 select 0, _this select 3 select 1, true] call KPLIB_fnc_createClearanceConfirm;},
                [_nearFob, GRLIB_fob_range * 0.9], -1003, false, true, "", "build_confirmed == 0"
            ];
        };
    } else {
        if (_idact_clearance != -1) then {
            player removeAction _idact_clearance;
            _idact_clearance = -1;
        };
    };

    uiSleep 1;
};
