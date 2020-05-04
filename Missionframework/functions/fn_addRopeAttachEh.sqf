/*
    File: fn_addRopeAttachEh.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2020-04-09
    Last Update: 2020-04-10
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Adds a ropeAttach EH if given vehicle is able to slingload objects.
        The EH will make sure that the slingloaded cargo is local to the
        helicopter pilot to avoid a rope breaking due to desyncs.

    Parameter(s):
        _obj - Object to apply the EH to [OBJECT, defaults to objNull]

    Returns:
        Function reached the end [BOOL]
*/

params [
    ["_obj", objNull, [objNull]]
];

if (isNull _obj) exitWith {["Null object given"] call BIS_fnc_error; false};

if (getNumber (configfile >> "CfgVehicles" >> (typeOf _obj) >> "slingLoadMaxCargoMass") > 0) then {
    _obj addEventHandler ["RopeAttach", {
        params ["_heli", "_rope", "_cargo"];
        if !((owner _heli) isEqualTo (owner _cargo)) then {
            _cargo setOwner (owner _heli);
        };
    }];
};

true
