 // Original code by Larrow
 // See: https://forums.bistudio.com/topic/182817-how-to-limit-weapons-in-the-arsenal-of-a-box/#entry2907944

private [ "_virtualBackpacks" ];

_virtualBackpacks = [];

{
    "
        if ( getNumber( _x >> 'scope' ) isEqualTo 2 ) then {
            _configName = configName _x;
            _itemType = _configName call BIS_fnc_itemType;
            if !( ( _itemType select 0 ) isEqualTo '' ) then {
                if ( _itemType select 0 == 'Equipment' ) then {
                    if ( ( _itemType select 1 ) isEqualTo 'Backpack' ) then {
                        _virtualBackpacks pushback _configName;
                    };
                };
            };
        };
    " configClasses _x;
} forEach [
    ( configFile >> "CfgVehicles" )
];

_virtualBackpacks