//	@file Version: 1.0
//	@file Name: reemoveRuins.sqf
//	@file Author: wiking.at - AJ


#define PICK_DISTANCE 15

// Check if mutex lock is active.
if (mutexScriptInProgress) exitWith
{
	player globalChat "You are already performing another action.";
};

if (vehicle player != player) exitWith
{
	titleText ["You can't remove ruins while in a vehicle", "PLAIN DOWN", 0.5];
};

mutexScriptInProgress = true;

private ["_ruinsObjects", "_ruinsObj", "_ruins"];

_ruinsObjects = nearestObjects [player, ["Ruins", "CraterLong", "CraterLong_small", "rhs_Flag_chdkz"], PICK_DISTANCE];

if (count _ruinsObjects > 0) then
{
	_ruinsObj = _ruinsObjects select 0;
};

if (isNil "_ruinsObj" || {player distance _ruinsObj > PICK_DISTANCE}) exitWith
{
	titleText ["You are too far to remove the ruins.", "PLAIN DOWN", 0.5];
	mutexScriptInProgress = false;
};

player playMove ([player, "AmovMstpDnon_AinvMstpDnon", "putdown"] call getFullMove);
sleep 0.5;

if (!isNull _ruinsObj) then
{
	deleteVehicle _ruinsObj;
	
	/*
	if (_ruins < 0) then { _ruins = 0 };
	//no money for ruins
	//	player setVariable ["cmoney", (player getVariable ["cmoney", 0]) + _ruins, true];

	if (_ruins > 0) then
	{
		titleText [format ["You have picked up $%1", _ruins], "PLAIN DOWN", 0.5];
	}
	else
	{
		titleText ["The money was counterfeit!", "PLAIN DOWN", 0.5];
	};
	*/
};

sleep 0.5;
mutexScriptInProgress = false;
