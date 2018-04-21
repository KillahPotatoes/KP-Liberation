waitUntil { !isNil "huron_typename" };

_vehicleClassnames = [huron_typename] + KP_liberation_crates;


{
	_vehicleClassnames = _vehicleClassnames + [_x select 0];
} foreach (light_vehicles + heavy_vehicles + air_vehicles + static_vehicles + support_vehicles) ;

while { true } do {

	waitUntil { sleep 0.3; count allCurators > 0 };

	_zeusunits = [];
	{
		if ((side group _x == GRLIB_side_friendly) && (_x distance startbase > 1000) && alive _x) then {
			_zeusunits pushback _x;
		};
	} foreach allUnits;

	{
		if (((typeof _x in _vehicleClassnames) || (_x getVariable ["GRLIB_captured", 0] == 1)) && ((_x distance startbase > 1000) && (isNull attachedTo _x) || (typeof _x == huron_typename)) && alive _x ) then {
			_zeusunits pushback _x;
		};
	} foreach vehicles;

	_zeusunits = _zeusunits + switchableUnits;
	_zeusunits = _zeusunits + playableUnits;
	_zeusunits = _zeusunits - (curatorEditableObjects (allCurators select 0));

	_units_to_remove = [];
	{
		if ( !(alive _x) || !(isNull attachedTo _x)) then {
			_units_to_remove pushback _x;
		};
	} foreach (curatorEditableObjects (allCurators select 0));

	{
		_zgm = _x;
		_zgm addCuratorEditableObjects [_zeusunits,true];
		_zgm removeCuratorEditableObjects [_units_to_remove,true];

		_zgm  setCuratorCoef ["edit", -1e8];
		_zgm  setCuratorCoef ["place", -1e8];
		_zgm  setCuratorCoef ["synchronize", 0];
		_zgm  setCuratorCoef ["delete", 0];
		_zgm  setCuratorCoef ["destroy", -1e8];

	} foreach allCurators;

	sleep 10;
};