if (!isServer) exitWith {};

params [ "_object_recycled", "_price_s", "_price_a", "_price_f"];

if ( isNull _object_recycled ) exitWith {};
if ( !(alive _object_recycled) ) exitWith {};

deleteVehicle _object_recycled;
if ((_price_s > 0) || (_price_a > 0) || (_price_f > 0)) then {
	/* To be implemented
	resources_ammo = resources_ammo + _price;*/
};
please_recalculate = true;
stats_vehicles_recycled = stats_vehicles_recycled + 1;