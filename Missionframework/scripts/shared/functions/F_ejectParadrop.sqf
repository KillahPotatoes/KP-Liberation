/*
    Filename: Simple ParaDrop Script v0.99d eject.sqf
    Author: Beerkan

    Description:
    A Simple Paradrop Script which will eject ALL assigned units (except crew) from a vehicle
    add a parachute and when landed will respawn their original backpacks.

    Parameter(s):
    0: VEHICLE  - vehicle that will be doing the paradrop (object)
    1: ALTITUDE - (optional) the altitude where the group & Cargo Item (if used) will open their parachute (number)
    2: CARGOITEM - (optional) the item or ammocrate you wish to paradrop with the paras. CARGOITEM will also have Virtual Arsenal. (object)

    Working Example without Cargo
    0 = [UH80, 150] execVM "eject.sqf"

    Working Example with Cargo "B_supplyCrate_F"
    0 = [UH80,150,"B_supplyCrate_F"] execVM "eject.sqf"
*/

if (!isServer) exitWith {};
private ["_paras","_vehicle","_item"];
_vehicle = _this select 0;
_paras = [];
_crew = crew _vehicle;

//Get everyone except the crew.
{
    _isCrew = assignedVehicleRole _x;
        if(count _isCrew > 0) then
    {
        if((_isCrew select 0) == "Cargo") then
        {
        _paras pushback _x
        };
    };
} foreach _crew;

_chuteheight = if ( count _this > 1 ) then { _this select 1 } else { 120 };// Height to auto-open chute, ie 120 if not defined.
_item = if ( count _this > 2 ) then {_this select 2} else {nil};// Cargo to drop, or nothing if not selected.
_vehicle allowDamage false;
_dir = direction _vehicle;

ParaLandSafe =
{
    private ["_unit"];
    _unit = _this select 0;
    _chuteheight = _this select 1;
    (vehicle _unit) allowDamage false;
    [_unit,_chuteheight] spawn AddParachute;//Set AutoOpen Chute if unit is a player
    waitUntil { isTouchingGround _unit || (position _unit select 2) < 1 };
    _unit action ["eject", vehicle _unit];
    sleep 1;
    _unit setUnitLoadout (_unit getVariable ["Saved_Loadout",[]]);// Reload Saved Loadout
    _unit allowdamage true;// Now you can take damage.
};

AddParachute =
{
    private ["_paraUnit"];
    _paraUnit = _this select 0;
    _chuteheight = _this select 1;
    waitUntil {(position _paraUnit select 2) <= _chuteheight};
    _paraUnit addBackPack "B_parachute";// Add parachute
    If (vehicle _paraUnit IsEqualto _paraUnit ) then {_paraUnit action ["openParachute", _paraUnit]};//Check if players chute is open, if not open it.
};

{
    _x setVariable ["Saved_Loadout",getUnitLoadout _x];// Save Loadout
    removeBackpack _x;
    _x disableCollisionWith _vehicle;// Sometimes units take damage when being ejected.
    _x allowdamage false;// Good Old Arma, they still can take damage on Vehcile exit.
    unassignvehicle _x;
    moveout _x;
    _x setDir (_dir + 90);// Exit the chopper at right angles.
    _x setvelocity [0,0,-5];// Add a bit of gravity to move unit away from _vehicle
    sleep 0.3;//space the Para's out a bit so they're not all bunched up.
} forEach _paras;

{
    [_x,_chuteheight] spawn ParaLandSafe;
} forEach _paras;

if (!isNil ("_item")) then
{
_CargoDrop = _item createVehicle getpos _vehicle;
_CargoDrop allowDamage false;
_CargoDrop disableCollisionWith _vehicle;
_CargoDrop setPos [(position _vehicle select 0) - (sin (getdir _vehicle)* 15), (position _vehicle select 1) - (cos (getdir _vehicle) * 15), (position _vehicle select 2)];
clearMagazineCargoGlobal _CargoDrop;clearWeaponCargoGlobal _CargoDrop;clearItemCargoGlobal _CargoDrop;clearbackpackCargoGlobal _CargoDrop;
waitUntil {(position _item select 2) <= _chuteheight};
[objnull, _CargoDrop] call BIS_fnc_curatorobjectedited;
_CargoDrop addaction ["<t color = '#00FF00'>Open Virtual Arsenal</t>",{["Open",true] call BIS_fnc_arsenal;}];
};

_vehicle allowDamage true;