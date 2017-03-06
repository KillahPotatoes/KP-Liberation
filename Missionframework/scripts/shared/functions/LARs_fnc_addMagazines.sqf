 // Original code by Larrow
 // See: https://forums.bistudio.com/topic/182817-how-to-limit-weapons-in-the-arsenal-of-a-box/#entry2907944

private [ "_virtualMagazines" ];

_virtualMagazines = [];

{
    "
        if ( getNumber( _x >> 'scope' ) isEqualTo 2 ) then {
            _configName = configName _x;
            _itemType = _configName call BIS_fnc_itemType;
            if !( ( _itemType select 0 ) isEqualTo '' ) then {
                if ( _itemType select 0 == 'Magazine' || _itemType select 0 == 'Mine' ) then {
                    _virtualMagazines pushback _configName;
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

_virtualMagazines