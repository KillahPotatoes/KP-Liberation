/*
    File: fn_getGroupType.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-11-25
    Last Update: 2019-11-25
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        No description added yet.

    Parameter(s):
        _localVariable - Description [DATATYPE, defaults to DEFAULTVALUE]

    Returns:
        Function reached the end [BOOL]
*/
// TODO
params [ "_grp" ];
private [ "_grouptype", "_vehicletype" ];

_grouptype = 'infantry';
_vehicletype = '';
{
    if ( vehicle _x != _x && _vehicletype == '' ) then {
        if ( ((gunner vehicle _x) == _x) || ((driver  vehicle _x) == _x) || ((commander vehicle _x) == _x) ) then {
            _vehicletype = typeof vehicle _x;
        };
    };
} foreach units _grp;

if ((_grouptype == 'infantry') && (_vehicletype != '')) then {

    {
        if  ( _vehicletype == (_x select 0)) then {
            _grouptype = 'heavy';
        };
    } foreach heavy_vehicles;

    if ( _grouptype == 'infantry' ) then {
        {
            if  ( _vehicletype == (_x select 0)) then {
                _grouptype = 'air';
            };
        } foreach air_vehicles;
    };

    if ( _grouptype == 'infantry' ) then {
        {
            if  ( _vehicletype == (_x select 0)) then {
                _grouptype = 'light';
            };
        } foreach light_vehicles;
    };


    if ( _grouptype == 'infantry' ) then {
        {
            if  ( _vehicletype == (_x select 0)) then {
                _grouptype = 'support';
            };
        } foreach support_vehicles;
    };

    if ( _grouptype == 'infantry' ) then {
        {
            if  ( _vehicletype == (_x select 0)) then {
                _grouptype = 'static';
            };
        } foreach static_vehicles;
    };

    // Check if vehicle config says it's an UAV, if it is always set its _grouptype to 'uav'
    if ( (_vehicletype call F_isClassUAV) ) then {
        _grouptype = 'uav';
    };

};

_grouptype
