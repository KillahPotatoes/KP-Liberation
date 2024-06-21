scriptName "open_build_menu";

private [ "_oldbuildtype", "_cfg", "_initindex", "_dialog", "_iscommandant", "_squadname", "_buildpages", "_build_list", "_classnamevar", "_entrytext", "_icon", "_affordable", "_affordable_crew", "_selected_item", "_linked", "_linked_unlocked", "_base_link", "_link_color", "_link_str", "_nearfob", "_actual_fob"];

if (([ getpos player , 300 , KPLIB_side_enemy ] call KPLIB_fnc_getUnitsCount ) > 4 ) exitWith { hint localize "STR_BUILD_ENEMIES_NEARBY";};

if (isNil "buildtype") then {buildtype = 1};
if (isNil "buildindex") then {buildindex = -1};
dobuild = 0;
_oldbuildtype = -1;
_cfg = configFile >> "cfgVehicles";
_initindex = buildindex;

_dialog = createDialog "liberation_build";
waitUntil { dialog };

_iscommandant = false;
if (player == [] call KPLIB_fnc_getCommander) then {
    _iscommandant = true;
};

ctrlShow [108, _iscommandant];
ctrlShow [1085, _iscommandant];
ctrlShow [121, _iscommandant];

_squadname = "";
_buildpages = [
localize "STR_BUILD1",
localize "STR_BUILD2",
localize "STR_BUILD3",
localize "STR_BUILD4",
localize "STR_BUILD5",
localize "STR_BUILD6",
localize "STR_BUILD7",
localize "STR_BUILD8"
];

_nearfob = [] call KPLIB_fnc_getNearestFob;
_actual_fob = KPLIB_fob_resources select {((_x select 0) distance _nearfob) < KPLIB_range_fob};

while {dialog && alive player && (dobuild == 0 || buildtype == 1)} do {
    _build_list = KPLIB_buildList select buildtype;

    if (_oldbuildtype != buildtype || synchro_done) then {
        synchro_done = false;
        _oldbuildtype = buildtype;
        _actual_fob = KPLIB_fob_resources select {((_x select 0) distance _nearfob) < KPLIB_range_fob};

        lbClear 110;
        {
            ctrlSetText [151, _buildpages select ( buildtype - 1)];
            if (buildtype != 8) then {
                _classnamevar = (_x select 0);
                _customName = (_x select 4);
                _entrytext = getText (_cfg >> _classnamevar >> "displayName");
                if (!isNil {_customName}) then {
                    if (_customName != "") then {
                        _entrytext = _customName;
                    };
                };
                
                if (_classnamevar in KPLIB_b_mobileRespawns) then {
                    if (KPLIB_param_mobileRespawn) then {
                        if (typeName KPLIB_b_mobileRespawn == typeName "") then {
                            if (_classnamevar == KPLIB_b_mobileRespawn) then {
                                _entrytext = localize "STR_RESPAWN_TRUCK";
                            };
                        } else {
                            {
                                if (_classnamevar == _x) exitWith {
                                    _entrytext = "MSP " + getText (configFile >> "CfgVehicles" >> _x >> "displayName");
                                };
                            } forEach KPLIB_b_mobileRespawns;
                        };
                    };
                };
                
                switch (_classnamevar) do {
                    case KPLIB_b_fobBox: {_entrytext = localize "STR_FOBBOX";};
                    case KPLIB_b_arsenal: {if (KPLIB_param_mobileArsenal) then {_entrytext = localize "STR_ARSENAL_BOX";};};
                    case KPLIB_b_fobTruck: {_entrytext = localize "STR_FOBTRUCK";};
                    case "Flag_White_F": {_entrytext = localize "STR_INDIV_FLAG";};
                    case KPLIB_b_smallStorage: {_entrytext = localize "STR_SMALL_STORAGE";};
                    case KPLIB_b_largeStorage: {_entrytext = localize "STR_LARGE_STORAGE";};
                    case KPLIB_b_logiStation: {_entrytext = localize "STR_RECYCLE_BUILDING";};
                    case KPLIB_b_airControl: {_entrytext = localize "STR_HELI_BUILDING";};
                    case KPLIB_b_slotHeli: {_entrytext = localize "STR_HELI_SLOT";};
                    case KPLIB_b_slotPlane: {_entrytext = localize "STR_PLANE_SLOT";};
                    default {};
                };

                ((findDisplay 5501) displayCtrl (110)) lnbAddRow [ _entrytext, format [ "%1" ,_x select 1], format [ "%1" ,_x select 2], format [ "%1" ,_x select 3]];

                _icon = getText ( _cfg >> (_x select 0) >> "icon");
                if(isText  (configFile >> "CfgVehicleIcons" >> _icon)) then {
                    _icon = (getText (configFile >> "CfgVehicleIcons" >> _icon));
                };
                lnbSetPicture  [110, [((lnbSize 110) select 0) - 1, 0],_icon];
            } else {
                if ( ((lnbSize  110) select 0) <= count KPLIB_b_squadNames ) then {
                    _squadname = KPLIB_b_squadNames select ((lnbSize  110) select 0);
                } else {
                    _squadname = "";
                };
                ((findDisplay 5501) displayCtrl (110)) lnbAddRow  [_squadname, format [ "%1" ,_x select 1], format [ "%1" ,_x select 2], format [ "%1" ,_x select 3]];
            };

            _affordable = true;
            if (
                ((_x select 1 > 0) && ((_x select 1) > ((_actual_fob select 0) select 1))) ||
                ((_x select 2 > 0) && ((_x select 2) > ((_actual_fob select 0) select 2))) ||
                ((_x select 3 > 0) && ((_x select 3) > ((_actual_fob select 0) select 3)))
            ) then {
                _affordable = false;
            };

            if ( _affordable ) then {
                ((findDisplay 5501) displayCtrl (110)) lnbSetColor  [[((lnbSize 110) select 0) - 1, 0], [1,1,1,1]];
                ((findDisplay 5501) displayCtrl (110)) lnbSetColor  [[((lnbSize 110) select 0) - 1, 1], [1,1,1,1]];
                ((findDisplay 5501) displayCtrl (110)) lnbSetColor  [[((lnbSize 110) select 0) - 1, 2], [1,1,1,1]];
                ((findDisplay 5501) displayCtrl (110)) lnbSetColor  [[((lnbSize 110) select 0) - 1, 3], [1,1,1,1]];
            } else {
                ((findDisplay 5501) displayCtrl (110)) lnbSetColor  [[((lnbSize 110) select 0) - 1, 0], [0.4,0.4,0.4,1]];
                ((findDisplay 5501) displayCtrl (110)) lnbSetColor  [[((lnbSize 110) select 0) - 1, 1], [0.4,0.4,0.4,1]];
                ((findDisplay 5501) displayCtrl (110)) lnbSetColor  [[((lnbSize 110) select 0) - 1, 2], [0.4,0.4,0.4,1]];
                ((findDisplay 5501) displayCtrl (110)) lnbSetColor  [[((lnbSize 110) select 0) - 1, 3], [0.4,0.4,0.4,1]];
            };
            if (buildtype != 8) then {
                _classnamevar = (_x select 0);
                if ( _classnamevar isEqualTo "Sign_Arrow_F") then {
                    ((findDisplay 5501) displayCtrl (110)) lnbSetColor  [[((lnbSize 110) select 0) - 1, 0], [1,1,0,1]];
                    ((findDisplay 5501) displayCtrl (110)) lnbSetColor  [[((lnbSize 110) select 0) - 1, 1], [1,1,0,1]];
                    ((findDisplay 5501) displayCtrl (110)) lnbSetColor  [[((lnbSize 110) select 0) - 1, 2], [1,1,0,1]];
                    ((findDisplay 5501) displayCtrl (110)) lnbSetColor  [[((lnbSize 110) select 0) - 1, 3], [1,1,0,1]];
                };
            };

        } foreach _build_list;
    };

    if(_initindex != -1) then {
        lbSetCurSel [110, _initindex];
        _initindex = -1;
    };

    _selected_item = lbCurSel 110;
    _affordable = false;
    _squad_full = false;
    if ((buildtype == 1) && (count (units group player) >= KPLIB_param_maxSquadSize)) then {
        _squad_full = true;
    };
    _linked = false;
    _linked_unlocked = true;
    _base_link = "";
    if (dobuild == 0 && _selected_item != -1 && (_selected_item < (count _build_list))) then {
        _build_item = _build_list select _selected_item;
        if (
            ((_build_item select 1 == 0 ) || ((_build_item select 1) <= ((_actual_fob select 0) select 1))) &&
            ((_build_item select 2 == 0 ) || ((_build_item select 2) <= ((_actual_fob select 0) select 2))) &&
            ((_build_item select 3 == 0 ) || ((_build_item select 3) <= ((_actual_fob select 0) select 3)))
        ) then {
            if !((_build_item select 0) isEqualType []) then {
                if ((toLowerANSI (_build_item select 0)) in KPLIB_b_air_classes && !([_build_item select 0] call KPLIB_fnc_isClassUAV)) then {
                    if (KPLIB_b_airControl_near &&
                        ((((_build_item select 0) isKindOf "Helicopter") && (KPLIB_heli_count < KPLIB_heli_slots)) ||
                        (((_build_item select 0) isKindOf "Plane") && (KPLIB_plane_count < KPLIB_plane_slots)))
                    ) then {
                        _affordable = true;
                    };
                } else {
                    if (!((toLowerANSI (_build_item select 0)) in KPLIB_airSlots) || (((toLowerANSI (_build_item select 0)) in KPLIB_airSlots) && KPLIB_b_airControl_near)) then {
                        _affordable = true;
                    };
                };
            } else {
                _affordable = true;
            };
        };

        if ( buildtype != 8 ) then {
            { if ( ( _build_item select 0 ) == ( _x select 0 ) ) exitWith { _base_link = _x select 1; _linked = true; } } foreach KPLIB_vehicle_to_military_base_links;

            if ( _linked ) then {
                if ( !(_base_link in KPLIB_sectors_player) ) then { _linked_unlocked = false };
            };
        };
    };

    _affordable_crew = _affordable;
    if ( unitcap >= ([] call KPLIB_fnc_getLocalCap)) then {
        _affordable_crew = false;
        if (buildtype == 1 || buildtype == 8) then {
            _affordable = false;
        };
    };

    ctrlEnable [ 120, _affordable && _linked_unlocked && !(_squad_full) ];
    ctrlEnable [ 121, _affordable_crew && _linked_unlocked ];

    ctrlSetText [131, format [ "%1 : %2" , localize "STR_MANPOWER", (floor KPLIB_supplies)]] ;
    ctrlSetText [132, format [ "%1 : %2" , localize "STR_AMMO", (floor KPLIB_ammo)]];
    ctrlSetText [133, format [ "%1 : %2" , localize "STR_FUEL", (floor KPLIB_fuel)]];

    ((findDisplay 5501) displayCtrl (134)) ctrlSetStructuredText formatText [
        "%1/%2 %3 - %4/%5 %6 - %7/%8 %9",
        unitcap,
        ([] call KPLIB_fnc_getLocalCap),
        image "\a3\Ui_F_Curator\Data\Displays\RscDisplayCurator\modeGroups_ca.paa",
        KPLIB_heli_count,
        KPLIB_heli_slots,
        image "\A3\air_f_beta\Heli_Transport_01\Data\UI\Map_Heli_Transport_01_base_CA.paa",
        KPLIB_plane_count,
        KPLIB_plane_slots,
        image "\A3\Air_F_EPC\Plane_CAS_01\Data\UI\Map_Plane_CAS_01_CA.paa"
        ];

    _link_color = "#0040e0";
    _link_str = localize "STR_VEHICLE_UNLOCKED";
    if (!_linked_unlocked) then { _link_color = "#e00000"; _link_str = localize "STR_VEHICLE_LOCKED"; };
    if ( _linked ) then {
        ((findDisplay 5501) displayCtrl (161)) ctrlSetStructuredText parseText ( "<t color='" + _link_color + "' align='center'>" + _link_str +  "<br/>" + ( markerText _base_link ) + "</t>" );
    } else {
        ((findDisplay 5501) displayCtrl (161)) ctrlSetStructuredText parseText "";
    };

    buildindex = _selected_item;

    if(buildtype == 1 && dobuild != 0) then {
        ctrlEnable [120, false];
        ctrlEnable [121, false];
        sleep 1;
        dobuild = 0;
    };

    sleep 0.1;
};

if (!alive player || dobuild != 0) then { closeDialog 0 };
