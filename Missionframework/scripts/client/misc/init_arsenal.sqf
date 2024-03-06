if (KP_liberation_arsenalUsePreset) then {
    private _crawled = [] call KPLIB_fnc_crawlAllItems;
    private _weapons = [];
    private _magazines = [];
    private _items = [];
    private _backpacks = [];
    KP_liberation_allowed_items = [];

    if (isNil "GRLIB_arsenal_weapons") then {GRLIB_arsenal_weapons = []};
    if (isNil "GRLIB_arsenal_magazines") then {GRLIB_arsenal_magazines = []};
    if (isNil "GRLIB_arsenal_items") then {GRLIB_arsenal_items = []};
    if (isNil "GRLIB_arsenal_backpacks") then {GRLIB_arsenal_backpacks = []};
    if (isNil "blacklisted_from_arsenal") then {blacklisted_from_arsenal = []};

    if ((count GRLIB_arsenal_weapons) == 0) then {
        if ((count blacklisted_from_arsenal) == 0) then {
            _weapons = _crawled select 0;
        } else {
            {if (!(_x in blacklisted_from_arsenal)) then {_weapons pushBack _x};} forEach (_crawled select 0);
        };
        [missionNamespace, _weapons] call BIS_fnc_addVirtualWeaponCargo;
        KP_liberation_allowed_items append _weapons;
    } else {
        [missionNamespace, GRLIB_arsenal_weapons] call BIS_fnc_addVirtualWeaponCargo;
        KP_liberation_allowed_items append GRLIB_arsenal_weapons;
    };

    // Support for CBA disposable launchers, https://github.com/CBATeam/CBA_A3/wiki/Disposable-Launchers
    if !(configProperties [configFile >> "CBA_DisposableLaunchers"] isEqualTo []) then {
        private _disposableLaunchers = ["CBA_FakeLauncherMagazine"];
        {
            private _loadedLauncher = cba_disposable_LoadedLaunchers getVariable _x;
            if (!isNil "_loadedLauncher") then {
                _disposableLaunchers pushBack _loadedLauncher;
            };

            private _normalLauncher = cba_disposable_NormalLaunchers getVariable _x;
            if (!isNil "_normalLauncher") then {
                _normalLauncher params ["_loadedLauncher"];
                _disposableLaunchers pushBack _loadedLauncher;
            };
        } forEach KP_liberation_allowed_items;
        KP_liberation_allowed_items append _disposableLaunchers;
    };

    {
        // Handle CBA optics, https://github.com/CBATeam/CBA_A3/wiki/Scripted-Optics
        if (missionNamespace getVariable ["CBA_optics", false]) then {
            private _pipOptic = CBA_optics_PIPOptics getVariable _x;
            if (!isNil "_pipOptic") then {
                KP_liberation_allowed_items_extension pushBackUnique _pipOptic;
            };

            private _nonPipOptic = CBA_optics_NonPIPOptics getVariable _x;
            if (!isNil "_nonPipOptic") then {
                KP_liberation_allowed_items_extension pushBackUnique _nonPipOptic;
            };
        };

        // Handle CBA (MRT) Accessories, https://github.com/CBATeam/CBA_A3/wiki/Accessory-Functions
        private _itemCfg = configFile >> "CfgWeapons" >> _x;
        if (!isNull _itemCfg) then {
            private _nextItem = getText (_itemCfg >> "MRT_SwitchItemPrevClass");
            if (_nextItem != "") then {
                KP_liberation_allowed_items_extension pushBackUnique _nextItem;
            };

            private _prevItem = getText (_itemCfg >> "MRT_SwitchItemNextClass");
            if (_prevItem != "") then {
                KP_liberation_allowed_items_extension pushBackUnique _prevItem;
            };
        };
    } forEach KP_liberation_allowed_items;

    if ((count GRLIB_arsenal_magazines) == 0) then {
        if ((count blacklisted_from_arsenal) == 0) then {
            _magazines = _crawled select 1;
        } else {
            {if (!(_x in blacklisted_from_arsenal)) then {_magazines pushBack _x};} forEach (_crawled select 1);
        };
        [missionNamespace, _magazines] call BIS_fnc_addVirtualMagazineCargo;
        KP_liberation_allowed_items append _magazines;
    } else {
        [missionNamespace, GRLIB_arsenal_magazines] call BIS_fnc_addVirtualMagazineCargo;
        KP_liberation_allowed_items append GRLIB_arsenal_magazines;
    };

    if ((count GRLIB_arsenal_items) == 0) then {
        if ((count blacklisted_from_arsenal) == 0) then {
            _items = _crawled select 2;
        } else {
            {if (!(_x in blacklisted_from_arsenal)) then {_items pushBack _x};} forEach (_crawled select 2);
        };
        [missionNamespace, _items] call BIS_fnc_addVirtualItemCargo;
        KP_liberation_allowed_items append _items;
    } else {
        [missionNamespace, GRLIB_arsenal_items] call BIS_fnc_addVirtualItemCargo;
        KP_liberation_allowed_items append GRLIB_arsenal_items;
    };

    if ((count GRLIB_arsenal_backpacks) == 0) then {
        if ((count blacklisted_from_arsenal) == 0) then {
            _backpacks = _crawled select 3;
        } else {
            {if (!(_x in blacklisted_from_arsenal)) then {_backpacks pushBack _x};} forEach (_crawled select 3);
        };
        [missionNamespace, _backpacks] call BIS_fnc_addVirtualBackpackCargo;
        KP_liberation_allowed_items append _backpacks;
    } else {
        [missionNamespace, GRLIB_arsenal_backpacks] call BIS_fnc_addVirtualBackpackCargo;
        KP_liberation_allowed_items append GRLIB_arsenal_backpacks;
    };

    {
        if ((_x find "rhs_acc") == 0) then {
            KP_liberation_allowed_items_extension append [_x + "_3d", _x + "_pip"];
        };
        if ((_x find "rhsusf_acc") == 0) then {
            KP_liberation_allowed_items_extension append [_x + "_3d", _x + "_pip"];
        };
    } forEach KP_liberation_allowed_items;

    if ((count KP_liberation_allowed_items_extension) > 0) then {
        KP_liberation_allowed_items append KP_liberation_allowed_items_extension;
    };

    if (KP_liberation_ace && KP_liberation_arsenal_type) then {
        [player, KP_liberation_allowed_items, false] call ace_arsenal_fnc_addVirtualItems;
    };

    // Lowercase all classnames
    KP_liberation_allowed_items = KP_liberation_allowed_items apply {toLower _x};
} else {
    [missionNamespace, true] call BIS_fnc_addVirtualWeaponCargo;
    [missionNamespace, true] call BIS_fnc_addVirtualMagazineCargo;
    [missionNamespace, true] call BIS_fnc_addVirtualItemCargo;
    [missionNamespace, true] call BIS_fnc_addVirtualBackpackCargo;

    if (KP_liberation_ace && KP_liberation_arsenal_type) then {
        [player, true, false] call ace_arsenal_fnc_addVirtualItems;
    };
};
