//	@file Name: openParachute.sqf
//	@file Author: AgentRev

if (!alive player) exitWith {};
if (vehicle player != player) exitWith {};

private ["_wait", "_pos", "_para"];

// some aircrafts blow up on contact with parachutes, so we have to make sure none's close
waitUntil {sleep 0.1; {player distance _x < 10 max (sizeOf typeOf _x)} count (player nearEntities ["Helicopter_Base_F", 20]) == 0};

if (!alive player) exitWith {};

_wait = false;
_pos = getPosATL player;

if (_pos select 2 < 10) then
{
	_para = createVehicle ["NonSteerable_Parachute_F", _pos, [], 0, "FLY"];
	_para setPosATL _pos;
	_para setDir 0;
}
else
{
	_wait = true;
	_para = createVehicle ["Steerable_Parachute_F", _pos, [], 0, "CAN_COLLIDE"];
	_para setDir getDir player;
};

_para disableCollisionWith player;
player moveInDriver _para;
_para setVelocity [0,0,0];

[_para, _wait] spawn
{
	_para = _this select 0;
	_wait = _this select 1;

	if (_wait) then
	{
		sleep 4.25; // parachute deployment time
	}
	else
	{
		sleep 0.5;
	};

	waitUntil {sleep 0.1; isTouchingGround _para || !alive _para};

	if (!isNull _para) then
	{
		_para setVelocity [0,0,0];
		sleep 0.5;
		if (vehicle player == _para) then { moveOut player };
		sleep 1.5;
		deleteVehicle _para;
	};
};
