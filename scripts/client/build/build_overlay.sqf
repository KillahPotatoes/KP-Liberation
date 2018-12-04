GRLIB_conflicting_objects = [];
GRLIB_buildoverlay_icon = "\A3\ui_f\data\map\markers\handdrawn\objective_CA.paa";
GRLIB_buildoverlay_color = [ 1, 0, 0, 1 ];
GRLIB_buildoverlay_cfg = configFile >> "cfgVehicles";

["build_overlay", "onEachFrame", {

	if ( build_confirmed == 1 ) then {
		if ( count GRLIB_conflicting_objects > 0 ) then {
			{
				if ( alive _x ) then {
					drawIcon3D [ GRLIB_buildoverlay_icon, GRLIB_buildoverlay_color, [ (getpos _x) select 0, (getpos _x) select 1, 1.5], 
					1, 1, 0, format [ "%1", getText (GRLIB_buildoverlay_cfg >> typeof _x >> "displayName") ], 2, 0.04, "puristaMedium"];
				};
			} foreach GRLIB_conflicting_objects;
		};
	};
}] call BIS_fnc_addStackedEventHandler;