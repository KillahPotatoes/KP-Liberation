/*
F_kp_createCrate.sqf
Author: Wyqer
Website: www.killahpotatoes.de
Date: 2017-10-11

Description:
Spawns a resource crate of given type and with given amount at given position.

Parameters:
_this select 0 - STRING - type of resource
_this select 1 - INTEGER - resource amount
_this select 2 - POSITION - Position where to spawn the crate

Return:
Object - resource crate
*/

params [["_resource", KP_liberation_supply_crate],["_amount", 100],["_pos", getPos player]];

if !(_resource in KP_liberation_crates) exitWith {
	private _text = format ["[KP LIBERATION] [ERROR] F_kp_createCrate.sqf -> invalid _resource: %1", _resource];
	_text remoteExec ["diag_log",2];
};

private _crate = _resource createVehicle _pos;
_crate setMass 500;
_crate setVariable ["KP_liberation_crate_value", _amount, true];
clearWeaponCargoGlobal _crate;
clearMagazineCargoGlobal _crate;
clearBackpackCargoGlobal _crate;
clearItemCargoGlobal _crate;

if(KP_liberation_ace) then {[_crate, true, [0, 1.5, 0], 0] remoteExec ["ace_dragging_fnc_setCarryable"];};

_crate
