 // Original code by Larrow
 // See: https://forums.bistudio.com/topic/182817-how-to-limit-weapons-in-the-arsenal-of-a-box/#entry2907944

private [ "_virtualWeapons" ];

_virtualWeapons = [];

{
    "
        if ( getNumber( _x >> 'scope' ) isEqualTo 2 ) then {
            _configName = configName _x;
            _itemType = _configName call BIS_fnc_itemType;
            if !( ( _itemType select 0 ) isEqualTo '' ) then {
				if !( ( _itemType select 1 ) isEqualTo 'VehicleWeapon' ) then {
					if ( ( _configName call BIS_fnc_baseWeapon ) isEqualTo _configName ) then {
                        _virtualWeapons pushback _configName;
                    };
                };
            };
        };
    " configClasses _x;
} forEach [
    ( configFile >> "CfgWeapons" ),
	( configFile >> "CfgMagazines" ),
	( configFile >> "CfgVehicles" ),
	( configFile >> "CfgGlasses" )
];

_virtualWeapons