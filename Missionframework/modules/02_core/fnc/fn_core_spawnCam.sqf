/*
    KPLIB_fnc_core_spawnCam

    File: fn_core_spawnCam.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2017-11-26
    Last Update: 2018-11-29
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Show the spawning camera sequence.

    Parameter(s):
        _spawn_str - Name of the respawn point for the text display [STRING, defaults to ""]

    Returns:
        Function reached the end [BOOL]
*/

params [
    ["_spawn_str", "", [""]]
];

// Get the nearest sector from the current position for the spawn text display
private _nearestSector = [2000] call KPLIB_fnc_core_getNearestMarker;
if (_nearestSector != "") then {_nearestSector = format ["%1 %2", localize "STR_KPLIB_NEAR", markertext _nearestSector];};

// Get the current time for the spawn text display
private _zeroHour = "";
private _zeroMinute = "";
if ((date select 3) < 10) then {_zeroHour = "0"};
if ((date select 4) < 10) then {_zeroMinute = "0"};
private _datestring = format ["%3/%2/%1 %4%5:%6%7", date select 0, date select 1, date select 2, _zeroHour, date select 3, _zeroMinute, date select 4];

// Set relative positions for the camera turn
private _initPos = [0, 500, 3000];
private _startPos1 = [0, 500, 250];
private _endPos1 = [0, 450, 225];
private _startPos2 = [0, 100, 40];
private _endPos2 = [0, 80, 30];
private _startPos3 = [0, 8, 2.8];
private _endPos3 = [0, 6, 2.25];
private _lastPos = [0, 0.4, 1.75];

// Spawn camera object
camUseNVG false;
showCinemaBorder false;
private _spawnCam = "camera" camCreate _initPos;
_spawnCam cameraEffect ["internal","front"];

// Start camera turn
_spawnCam camSetTarget player;
_spawnCam camSetRelPos _initPos;
_spawnCam camcommit 0;

_spawnCam camSetRelPos _startPos1;
_spawnCam camcommit 0.5;

waitUntil {camCommitted _spawnCam};

// Display spawn text and continue camera turn
[format ["<t size='0.7' align='left'>%1<br/>%2<br/>%3</t>", _spawn_str, _datestring, _nearestSector], 1, 0.8, 8, 1] spawn BIS_fnc_dynamictext;

_spawnCam camSetRelPos _endPos1;
_spawnCam camcommit 1.75;

waitUntil { camCommitted _spawnCam };

_spawnCam camSetRelPos _startPos2;
_spawnCam camcommit 0.25;

waitUntil { camCommitted _spawnCam };

_spawnCam camSetRelPos _endPos2;
_spawnCam camcommit 1.75;

waitUntil { camCommitted _spawnCam };

_spawnCam camSetRelPos _startPos3;
_spawnCam camcommit 0.25;

waitUntil { camCommitted _spawnCam };

_spawnCam camSetRelPos _endPos3;
_spawnCam camcommit 1.75;

waitUntil { camCommitted _spawnCam };

_spawnCam camSetRelPos _lastPos;
_spawnCam camcommit 1;

waitUntil { camCommitted _spawnCam };

// Delete camera object
_spawnCam cameraEffect ["Terminate","back"];
camDestroy _spawnCam;
camUseNVG false;

true
