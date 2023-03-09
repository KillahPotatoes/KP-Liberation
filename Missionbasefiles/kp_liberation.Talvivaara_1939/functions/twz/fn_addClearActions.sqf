/*
* Function to attach skip time and clear fog actions
* Domain: Clients
* Called by objectInits.sqf | remoteExecCall
* - check if BIS_fnc_paramDaytime allows time travel
* Example:
* [_this] remoteExecCall ["TWZ_fnc_addClearActions",0,_this]
*/
params [["_obj", objNull, [objNull]]];
if (isNull _obj || {
    !alive _obj
}) exitwith {};
_obj addAction [
    "sleep",
    {
        if !(daytime < 16 && daytime > 8) then {
            [9] remoteExecCall ["BIS_fnc_paramdaytime", 2];
            [240, 0] remoteExecCall ["setFog", 2];
			["Hyvää huomenta."] remoteExec ["hint",0];
        } else {
            ["It is too bright to sleep, but the fog seems to improve."] remoteExec ["hint",0];
			[240, 0] remoteExecCall ["setFog", 2];
        }
    },
    nil,
    1.5,
    false,
    false,
    "",
    "_target distance _this < 5"
];