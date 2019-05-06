/*
    KPLIB_fnc_virtual_curatorAreaLimit

    File: fn_virtual_curatorAreaLimit.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-11-25
    Last Update: 2019-04-29
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

    Description:
        Limits curator camera to certain area.

    Parameter(s):
        _curator    - Curator logic             [OBJECT, defaults to nil]
        _position   - Center position of area   [POSITION ATL, defaults to nil]
        _radius     - Area radius               [OBJECT, defaults to KPLIB_param_limitedZeusRadius]
        _ceiling    - Area ceiling              [OBJECT, defaults to KPLIB_param_limitedZeusCeiling]

    Returns:
        Curator area was limited [BOOL]
*/
params [
    ["_curator", nil, [objNull]],
    ["_position", nil, [[]], [2,3]],
    ["_radius", KPLIB_param_limitedZeusRadius, [0]],
    ["_ceiling", KPLIB_param_limitedZeusCeiling, [0]]
];

[_curator, [1, _position, _radius]] remoteExec ["addCuratorCameraArea", 2];
[_curator, (_position select 2) + _ceiling] remoteExec ["setCuratorCameraAreaCeiling", 2];

true
