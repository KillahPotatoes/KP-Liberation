/*
F_kp_getMilitaryID.sqf
Author: Wyqer
Website: www.killahpotatoes.de
Date: 2017-09-14

Description:
Converts a number to an ID string

Parameters:
_this select 0 - INT - ID number to convert

Return:
String
*/

params ["_count"];
private _level = 0;
private _return = "";

for [{_i = (count military_alphabet)}, {(_count + 1) > _i}, {_i = _i + (count military_alphabet)}] do {
	_level = _level + 1;
};

if (_level == 0) then {
	_return = military_alphabet select _count;
} else {
	_return = format ["%1 %2", [(_level - 1)] call F_getMilitaryID, [(_count - (_level * (count military_alphabet)))] call F_getMilitaryID];
};

_return
