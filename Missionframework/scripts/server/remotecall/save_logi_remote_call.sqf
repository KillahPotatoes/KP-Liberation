if (!isServer) exitWith {};

params ["_index", "_dest_a", "_ress_a", "_dest_b", "_ress_b", "_clientID"];

private ["_time"];

logiError = 0;

hint format ["_index: %1\n_dest_a: %2\n_ress_a: %3\n_dest_b: %4\n_ress_b: %5\n_clientID: %6",_index,_dest_a,_ress_a,_dest_b,_ress_b,_clientID];

if ((_ress_a isEqualTo [0,0,0]) && (_ress_b isEqualTo [0,0,0])) then {
	logiError = 1;
};

if (_dest_a isEqualTo _dest_b) then {
	logiError = 1;
};

{
	if (
		((((_x select 2) isEqualTo _dest_a)) || (((_x select 2) isEqualTo _dest_b)))
		&& ((((_x select 3) isEqualTo _dest_a)) || (((_x select 3) isEqualTo _dest_b)))
	) exitWith {logiError = 1;}
} forEach KP_liberation_logistics;

if (logiError == 1) exitWith {(localize "STR_LOGISTIC_SAVE_ERROR") remoteExec ["hint",_clientID]; _clientID publicVariableClient "logiError";};

_time = ceil ((_dest_a distance2D _dest_b) / 400);

KP_liberation_logistics set [_index,[
	(KP_liberation_logistics select _index) select 0,
	(KP_liberation_logistics select _index) select 1,
	_dest_a,
	_dest_b,
	_ress_a,
	_ress_b,
	(KP_liberation_logistics select _index) select 6,
	1,
	_time,
	(KP_liberation_logistics select _index) select 9
]];
