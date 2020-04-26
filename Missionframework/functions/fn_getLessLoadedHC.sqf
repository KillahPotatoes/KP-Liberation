/*
    File: fn_getLessLoadedHC.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-12-03
    Last Update: 2019-12-05
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Returns the HC with the current less load.

    Parameter(s):
        NONE

    Returns:
        Less loaded HC [OBJECT]
*/

private _hcArray = [];
private _hc = objNull;

{
    _hc = _x;
    _hcArray pushBack [count (allUnits select {(owner _x) isEqualTo (owner _hc)}), _hc];
} forEach (entities "HeadlessClient_F");

if !(_hcArray isEqualTo []) then {
    _hcArray sort true;
    (_hcArray select 0) select 1
} else {
    objNull
};
