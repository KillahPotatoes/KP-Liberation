/*
	F_getNearestViVTransport

	File: F_kp_getNearestViVTransport.sqf
	Author: veteran29 - https://github.com/veteran29
	Date: 2019-05-08
	Last Update: 2019-05-08

	Description:
		Gets nearest object that can transport target object via ViV

	Parameter(s):
		0: OBJECT - Object to check. (Default objNull)

	Returns:
		OBJECT - Closest transport or objNull
*/
params [["_object", objNull, [objNull]]];

private _nearbyTransports = ((nearestObjects [_object, ["AllVehicles"], 15]) select {(_x canVehicleCargo _object) select 0});

// return closest transport
_nearbyTransports param [0, objNull]
