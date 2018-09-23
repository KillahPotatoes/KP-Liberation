/*
    KPLIB_fnc_respawn_camFlyBy

    File: fn_respawn_camFlyBy.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-09-20
    Last Update: 2018-09-23
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Creates camera that will start at given position and focus on target

    Parameter(s):
        0: POSITION - Fly by start position (ATL)
        1: POSITION - Fly by end position (ATL)
        2: OBJECT/ARRAY - Focus object or position
        3: CAMERA - OPTIONAL - Camera object to use, if not provided new camera will be created

    Returns:
    CAMERA
*/
params [
    ["_start", nil, [[]], 3],
    ["_end", nil, [[]], 3],
    ["_focus", nil, [objNull, []], 3],
    ["_camera", nil, [objNull]]
];

if (isNil "_camera") then {
    _camera = "CAMERA" camCreate _start;
} else {
    _camera camSetPos _start;
};

_camera camSetTarget _focus;

_camera camCommit 0;

_camera cameraEffect ["INTERNAL", "BACK"];
showCinemaBorder false;

_camera camSetPos _end;
_camera camCommit 80;



_camera
