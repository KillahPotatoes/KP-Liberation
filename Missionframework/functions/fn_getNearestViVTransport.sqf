/*
    File: fn_getNearestViVTransport.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-05-08
    Last Update: 2019-12-03
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Gets nearest object that can transport target object via ViV.

    Parameter(s):
        _object - Object to check [OBJECT, defaults to objNull]

    Returns:
        Closest transport or objNull [OBJECT]
*/
// TODO
params [["_object", objNull, [objNull]]];

private _nearbyTransports = ((nearestObjects [_object, ["AllVehicles"], 15]) select {(_x canVehicleCargo _object) select 0});

// return closest transport
_nearbyTransports param [0, objNull]
