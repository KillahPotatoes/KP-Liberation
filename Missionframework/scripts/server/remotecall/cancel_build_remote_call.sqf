if (!isServer) exitWith {};

params [ "_price" ];

if ( _price > 0 ) then {
	resources_ammo = resources_ammo + _price;
};