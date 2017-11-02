//	@file Name: forceEject.sqf
//	@file Author: AgentRev

if (!alive player) exitWith {};

private ["_veh", "_push", "_vecDir"];

_veh = vehicle player;
if (_veh == player) exitWith {};

moveOut player;

if (_veh isKindOf "Plane") then
{
	player setDir getDir _veh;
	_push = (vectorUp _veh) vectorMultiply 40; // Simulate rocket seat ejection
}
else
{
	if ((getPos _veh) select 2 > 4) then
	{
		_vecDir = (getPosASL player) vectorDiff (getPosASL _veh);
		_push = _vecDir vectorMultiply (5 / vectorMagnitude _vecDir); // Push 5m/s away from vehicle
	};
};

if (!isNil "_push") then
{
	player setVelocity ((velocity player) vectorAdd _push);
};
