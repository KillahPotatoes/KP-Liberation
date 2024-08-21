scriptName "asymmetric_loop";

waitUntil {!isNil "KPLIB_saveLoaded"};
waitUntil {!isNil "KPLIB_civ_rep"};
waitUntil {KPLIB_saveLoaded};

if (KPLIB_asymmetric_debug > 0) then {[format ["Loop spawned on: %1", debug_source], "ASYMMETRIC"] call KPLIB_fnc_log;};

KPLIB_asymmetric_sectors = [];

while {KPLIB_endgame == 0} do {
    private _sectors_to_remove = [];

    {
        if (!(_x in KPLIB_sectors_player) || (KPLIB_civ_rep > -25)) then {
            _sectors_to_remove pushBack _x;
        };
    } forEach KPLIB_asymmetric_sectors;

    KPLIB_asymmetric_sectors = KPLIB_asymmetric_sectors - _sectors_to_remove;

    if (KPLIB_civ_rep <= -25) then {
        {
            private _sector = _x;
            private _blocked = false;
            private _units_at_sector = [markerPos _sector, KPLIB_range_sectorActivation, KPLIB_side_player] call KPLIB_fnc_getUnitsCount;

            {
                if ((_x select 0) == _sector) exitWith {
                    if ((((_x select 1) + 1800) < time) && (_units_at_sector == 0)) then {
                        asymm_blocked_sectors = asymm_blocked_sectors - [_x];
                        if (KPLIB_asymmetric_debug > 0) then {[format ["Sector %1 removed from blocked sectors", markerText (_x select 0)], "ASYMMETRIC"] call KPLIB_fnc_log;};
                    } else {
                        _blocked = true;
                        if (KPLIB_asymmetric_debug > 0) then {[format ["Sector %1 still blocked for ambush", markerText (_x select 0)], "ASYMMETRIC"] call KPLIB_fnc_log;};
                    };
                };
            } forEach asymm_blocked_sectors;

            if ((_units_at_sector > 0) && !(_sector in KPLIB_asymmetric_sectors) && !_blocked) then {
                KPLIB_asymmetric_sectors pushBack _sector;

                if ((random 100) <= KPLIB_resistance_ambush_chance) then {
                    private _hc = [] call KPLIB_fnc_getLessLoadedHC;
                    private _ieds = round (([] call KPLIB_fnc_crGetMulti) * KPLIB_param_difficulty);

                    if (isNull _hc) then {
                        [_sector, _ieds] spawn manage_asymIED;
                        [_sector] spawn asym_sector_ambush;
                    } else {
                        [_sector, _ieds] remoteExec ["manage_asymIED", _hc];
                        [_sector] remoteExec ["asym_sector_ambush",_hc];
                    };
                };
            };

            if (!(_units_at_sector > 0) && (_sector in KPLIB_asymmetric_sectors)) then {
                KPLIB_asymmetric_sectors = KPLIB_asymmetric_sectors - [_sector];
            };
        } forEach ((KPLIB_sectors_city + KPLIB_sectors_capital) select {_x in KPLIB_sectors_player});
    };
    publicVariable "KPLIB_asymmetric_sectors";
    publicVariable "asymm_blocked_sectors";
    sleep 10;
};
