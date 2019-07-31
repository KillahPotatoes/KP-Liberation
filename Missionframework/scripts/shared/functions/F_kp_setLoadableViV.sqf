/*
	F_setLoadableViV

	File: F_kp_setLoadableViV.sqf
	Author: veteran29 - https://github.com/veteran29
	Date: 2019-05-08
	Last Update: 2019-05-08

	Description:
		Adds ViV load/unload actions to object

	Parameter(s):
		0: OBJECT - Object to add actions to. (Default objNull)

	Returns:
		BOOL - Actions were added
*/
params [["_object", objNull, [objNull]]];

private _loadFnc = {
	params ["_target"];

	(_target call F_getNearestViVTransport) setVehicleCargo _target;
};

// Add "Load" action
_object addAction [
	"<t color='#FFFF00'>" + localize "STR_ACTION_LOAD_VIV" + "</t>",
	_loadFnc,
	nil,
	-991,
	false,
	true,
	"",
	"(isNull objectParent player) && {!isNull (_target call F_getNearestViVTransport)}",
	10
];

// Add "No transports nearby action"
_object addAction [
	"<t color='#FF0000'>" + localize "STR_ACTION_NOTRANSPORT_VIV" + "</t>",
	{},
	nil,
	-991,
	false,
	true,
	"",
	"(isNull objectParent player) && {isNull (_target call F_getNearestViVTransport)} && {isNull isVehicleCargo _target}",
	10
];

private _unloadFnc = {
	params ["_target"];

	objNull setVehicleCargo _target;
};

// Add "Unload" action
_object addAction [
	"<t color='#FFFF00'>" + localize "STR_ACTION_UNLOAD_VIV" + "</t>",
	_unloadFnc,
	nil,
	-991,
	false,
	true,
	"",
	"(isNull objectParent player) && {!isNull isVehicleCargo _target}",
	10
];

true
