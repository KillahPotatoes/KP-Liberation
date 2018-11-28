#include "script_components.hpp"
/*
    KPLIB_fnc_build_confirmAll

    File: fn_build_confirmAll.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-11-28
    Last Update: 2018-11-28
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        No description added yet.

    Parameter(s):
        _localVariable - Description [DATATYPE, defaults to DEFAULTVALUE]

    Returns:
        Function reached the end [BOOL]
*/


private _validItems = LGVAR(buildQueue) select {_x getVariable ["KPLIB_validPos", true]};
LSVAR("buildQueue", LGVAR(buildQueue) - _validItems);

// TODO implement build queue handling (resource check etc.)
systemChat "buildConfirm: Resource check not implemented yet!";
{
    private _dirAndUp = [vectorDir _x, vectorUp _x];
    private _pos = getPosATL _x;
    private _class = typeOf _x;

    deleteVehicle _x;

    [[[_class, _pos, 0, true], _dirAndUp], {
        params ["_createParams", "_vectorDirAndUp"];
        _createParams params ["_className", "_pos"];

        private ["_obj"];

        // TODO save only builings via Build module, units and vehicles should be moved to persistence module
        switch true do {
            case (_className isKindOf "Man"): {
                _obj = [createGroup KPLIB_preset_sidePlayers, _className] call KPLIB_fnc_common_createUnit;
                _obj setPosATL _pos;
                _obj setVectorDirAndUp _vectorDirAndUp;

                // Set watching direction
                if (_obj isEqualTo formLeader _obj) then {
                    _obj setFormDir getDir _obj;
                };

            };

            default {
                _obj = _createParams call KPLIB_fnc_common_createVehicle;
                _obj setVectorDirAndUp _vectorDirAndUp;
            };
        };


        ["KPLIB_build_item_built", [_obj, player getVariable "KPLIB_fob"]] call CBA_fnc_globalEvent;
    }] remoteExecCall ["call", 2];

} forEach _validItems;
