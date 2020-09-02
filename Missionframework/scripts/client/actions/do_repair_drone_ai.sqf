params ["_target", "_caller", "_actionId", "_arguments"];

// Delete the old crew
{
	(vehicle _x) deleteVehicleCrew _x;
} forEach (crew _target);

// Creates a new crew, which will work again.
createVehicleCrew _target;
