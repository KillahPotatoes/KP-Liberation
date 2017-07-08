params [ "_veh" ];
private [ "_grp" ];

createVehicleCrew _veh;

if ( count crew _veh > 0 ) then {
	if ( side (group ((crew _veh) select 0)) != GRLIB_side_friendly ) then {
		{ deleteVehicle _x } foreach (crew _veh);

		_grp = createGroup GRLIB_side_friendly;
		while { count units _grp < 3 } do {
			crewman_classname createUnit [ getPos _veh, _grp, 'this addMPEventHandler ["MPKilled", {_this spawn kill_manager}] '];
		};
		((units _grp) select 0) moveInDriver _veh;
		((units _grp) select 1) moveInGunner _veh;
		((units _grp) select 2) moveInCommander _veh;

		{ if ( vehicle _x == _x ) then { deleteVehicle _x }; } foreach (units _grp);
	};

	if ((KP_Liberation_suppMod_enb > 0) && ((typeOf _veh) in KP_liberation_artySupp)) then {
		(group ((crew _veh) select 0)) setCombatMode "YELLOW";
		(group ((crew _veh) select 0)) setBehaviour "AWARE";
	} else {
		(group ((crew _veh) select 0)) setCombatMode "GREEN";
		(group ((crew _veh) select 0)) setBehaviour "SAFE";
	};
};