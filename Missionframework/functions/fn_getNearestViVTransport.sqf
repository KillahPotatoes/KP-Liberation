/*
    File: fn_getNearestViVTransport.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-05-08
    Last Update: 2019-12-06
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Gets nearest object that can transport given object via ViV.

    Parameter(s):
        _object - Object to get a transport vehicle for     [OBJECT, defaults to objNull]
        _radius - Radius to look for a transport vehicle    [NUMBER, defaults to 15]

    Returns:
        Closest transport or objNull [OBJECT]
*/

params [
    ["_object", objNull, [objNull]],
    ["_radius", 15, [0]]
];

((nearestObjects [_object, ["AllVehicles"], _radius]) select {(_x canVehicleCargo _object) select 0}) param [0, objNull]
