private [ "_actionned_captive_units", "_near_people",  "_near_intel", "_actionned_intel_items" ];
_actionned_captive_units = [];
_actionned_intel_items = [];

while { true } do {

	if (  [ player, 5 ] call F_fetchPermission  ) then {

		_near_people = (getPosATL player) nearEntities [["Man"], 5];
		_near_intel = (getPosATL player) nearEntities [[GRLIB_intel_laptop, GRLIB_intel_file], 5];
		{
			if ((captive _x) && !(_x in _actionned_captive_units) && !((side group _x) == GRLIB_side_friendly) && !(_x getVariable ["ACE_isUnconscious", false])) then {
				_x addAction ["<t color='#FFFF00'>" + localize "STR_SECONDARY_CAPTURE" + "</t>","scripts\client\actions\do_capture.sqf","",-850,true,true,"","(vehicle player == player) && (side group _target != GRLIB_side_friendly) && (captive _target)"];
				_actionned_captive_units pushback _x;
			};
		} foreach _near_people;

		{
			if ( !(alive _x) || ((player distance _x) > 5) || ((side group _x) == GRLIB_side_friendly) ) then {
				removeAllActions _x;
				_actionned_captive_units = _actionned_captive_units - [_x];
			};
		} foreach _actionned_captive_units;

		{
			if ( !(_x in _actionned_intel_items) ) then {
				_x addAction ["<t color='#FFFF00'>" + localize "STR_INTEL" + "</t>","scripts\client\actions\do_take_intel.sqf","",-849,true,true,"","(vehicle player == player)"];
				_actionned_intel_items pushback _x;
			};
		} foreach _near_intel;

		{
			if ((player distance _x) > 5) then {
				removeAllActions _x;
				_actionned_intel_items = _actionned_intel_items - [_x];
			};
		} foreach _actionned_intel_items;

	} else {
		{
			removeAllActions _x;
			_actionned_captive_units = _actionned_captive_units - [_x];
		} foreach _actionned_captive_units;

		{
			removeAllActions _x;
			_actionned_intel_items = _actionned_intel_items - [_x];
		} foreach _actionned_intel_items;
	};

	sleep 3;
};
