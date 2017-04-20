 // LARs_fnc_addAllVirtualCargo.sqf
 // Original code by Larrow - https://forums.bistudio.com/profile/770615-larrow/
 // See: https://forums.bistudio.com/forums/topic/182817-how-to-limit-weapons-in-the-arsenal-of-a-box/?do=findComment&comment=2907944

private ["_virtualCargo", "_virtualWeapons", "_virtualMagazines", "_virtualItems", "_virtualBackpacks"];

_virtualCargo = [];
_virtualWeapons = [];
_virtualMagazines = [];
_virtualItems = [];
_virtualBackpacks = [];

_fnc_linkedItems = {
    "
        if ( isText( _x >> 'Item' ) ) then {
            _virtualItems pushback _configName;
        };
    "configClasses _this;
};


{
    "
        if ( getNumber( _x >> 'scope' ) isEqualTo 2 ) then {
            _configName = configName _x;
            _itemType = _configName call BIS_fnc_itemType;
            if !( ( _itemType select 0 ) isEqualTo '' ) then {
                switch ( _itemType select 0 ) do {
                    case 'Item' : {
                        _virtualItems pushback _configName;
                    };
                    case 'Weapon' : {
                        if !( ( _itemType select 1 ) isEqualTo 'VehicleWeapon' ) then {
                            if ( ( _configName call BIS_fnc_baseWeapon ) isEqualTo _configName ) then {
                                _virtualWeapons pushback _configName;
                            }else{
                                ( _x >> 'LinkedItems' ) call _fnc_linkedItems;
                            };
                        };
                    };
                    case 'Magazine' : {
                        _virtualMagazines pushback _configName;
                    };
                    case 'Mine' : {
                        _virtualMagazines pushback _configName;
                    };
                    case 'Equipment' : {
                        if ( ( _itemType select 1 ) isEqualTo 'Backpack' ) then {
                            _virtualBackpacks pushback _configName;
                        }else{
                            _virtualItems pushback _configName;
                        };
                    };
                };
            };
        };
    "configClasses _x;
}forEach [
    ( configFile >> "CfgWeapons" ),
    ( configFile >> "CfgMagazines" ),
    ( configFile >> "CfgVehicles" ),
    ( configFile >> "CfgGlasses" )
];

_virtualCargo = [_virtualWeapons, _virtualMagazines, _virtualItems, _virtualBackpacks];

_virtualCargo
