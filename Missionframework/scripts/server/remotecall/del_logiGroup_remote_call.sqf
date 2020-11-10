if (!isServer) exitWith {};

params ["_groupToDelete"];

private _temp = +KP_liberation_logistics;

_temp = _temp - [_groupToDelete];

{
    _x set [0, [_forEachIndex] call KPLIB_fnc_getMilitaryId];
} forEach _temp;

KP_liberation_logistics = +_temp;
