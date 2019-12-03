/*
    File: fn_getUnitsCount.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-12-03
    Last Update: 2019-12-03
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        No description added yet.

    Parameter(s):
        _localVariable - Description [DATATYPE, defaults to DEFAULTVALUE]

    Returns:
        Function reached the end [BOOL]
*/
// TODO
params ["_position", "_distance", "_side"];

private _infantrycount = _side countSide ((_position nearEntities ["Man", _distance]) select {!(captive _x) && ((getpos _x) select 2 < 100)});
private _countedvehicles =  (_position nearEntities [["Car", "Tank", "Air"], _distance]) select {((getpos _x) select 2 < 750) && count (crew _x) > 0};
private _vehiclecrewcount = 0;
{_vehiclecrewcount = _vehiclecrewcount + (_side countSide (crew _x))} forEach _countedvehicles;

(_infantrycount + _vehiclecrewcount)
