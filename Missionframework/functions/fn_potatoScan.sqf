/*
    File: fn_potatoScan.sqf
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
private [ "_potatoes", "_potato" ];

_potatoes = vehicles select {typeof _x == huron_typename && alive _x};
_potato = objNull;
if ( count _potatoes != 0 ) then { _potato = _potatoes select 0 };

_potato
