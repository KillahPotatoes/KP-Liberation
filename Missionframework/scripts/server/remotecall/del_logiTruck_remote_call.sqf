if (!isServer) exitWith {};

params ["_index"];

KP_liberation_logistics set [_index,[
	(KP_liberation_logistics select _index) select 0,
	((KP_liberation_logistics select _index) select 1) - 1,
	(KP_liberation_logistics select _index) select 2,
	(KP_liberation_logistics select _index) select 3,
	(KP_liberation_logistics select _index) select 4,
	(KP_liberation_logistics select _index) select 5,
	(KP_liberation_logistics select _index) select 6,
	(KP_liberation_logistics select _index) select 7,
	(KP_liberation_logistics select _index) select 8
]];
