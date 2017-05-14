if (!isServer) exitWith {};

params ["_groupToDelete"];

private ["_temp", "_i"];

_temp = KP_liberation_logistics;

_temp = _temp - [_groupToDelete];

_i = 0;
{
	_x set [0, (military_alphabet select _i)];
	_i = _i + 1;
} forEach _temp;

KP_liberation_logistics = _temp;
