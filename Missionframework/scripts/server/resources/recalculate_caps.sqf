base_infantry_cap = 50 * GRLIB_resources_multiplier;
base_fuel_cap = 20 * GRLIB_resources_multiplier;

infantry_cap = base_infantry_cap;
fuel_cap = base_fuel_cap;

{
	if ( _x in sectors_capture ) then {
		infantry_cap = infantry_cap + (10 * GRLIB_resources_multiplier);
	};
	if ( _x in sectors_factory ) then {
		fuel_cap = fuel_cap + (20 * GRLIB_resources_multiplier);
	};
} foreach blufor_sectors;