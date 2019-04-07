/*
    KPLIB_fnc_common_cameraCircleTarget

    File: fn_common_cameraCircleTarget.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-03-18
    Last Update: 2019-03-31
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: Yes

    Description:
        Let a camera circle around a given target with given params.

    Parameter(s):
        _camera     - Camera object             [OBJECT, defaults to objNull]
        _target     - Target object             [OBJECT, defaults to objNull]
        _steps      - Steps to do               [NUMBER, defaults to 0]
        _duration   - Duration of a full circle [NUMBER, defaults to 0]
        _step       - Step count                [NUMBER, defaults to 0]
        _commitTime - Commit time               [NUMBER, defaults to 0]

    Returns:
        Function reached the end [BOOL]
*/

params [
    ["_camera", objNull, [objNull]],
    ["_target", objNull, [objNull]],
    ["_steps", 36, [0]],
    ["_duration", 30, [0]],
    ["_step", 0, [0]],
    ["_commitTime", 0, [0]]
];

if (isNull _camera || {!camCommitted _camera}) exitWith {};

if (_step isEqualTo 0) then {
    _commitTime = _duration / _steps;
};

_camera camSetPos ((_target getRelPos [15, _step * 10]) vectorAdd [0, 0, 5]);
_camera camCommit _commitTime;

_step = _step + 1;
[
    {camCommitted (_this select 0)},
    {[_this select 0, _this select 1, _this select 2, _this select 3, _this select 4, _this select 5] call KPLIB_fnc_common_cameraCircleTarget},
    [_camera, _target, _steps, _duration, _step, _commitTime]
] call CBA_fnc_waitUntilAndExecute;

true
