/*
    KPLIB_fnc_core_cinematic

    File: fn_core_cinematic.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2017-12-31
    Last Update: 2018-11-09
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        The intro cinematic procedure.

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/

// Intro cinematic started
KPLIB_intro_running = true;

// Transition and position storage variables
private _lastTransition = -1;
private _lastTargetPos = [-1,-1,-1];

// Activate cinema borders
showCinemaBorder true;

// Create camera
private _cam = "camera" camCreate KPLIB_zeroPos;

// Create invisible pointer for use as camera target
private _pointer = "Sign_Arrow_Blue_F" createVehicleLocal KPLIB_zeroPos;
_pointer hideObject true;
_cam camSetTarget _pointer;
_cam cameraEffect ["internal","back"];
_cam camcommit 0;

// Set variable for first camera round
private _firstRound = true;

// Show the intro cinematic until it's aborted
while {KPLIB_intro_running} do {

    // Wait until the last camera round is finished or the intro is aborted
    waitUntil {!KPLIB_intro_running || camCommitted _cam};

    // If the intro is still running, commit next camera round
    if (KPLIB_intro_running) then {

        // Deactivate NVG effect for the camera
        camUseNVG false;

        // Create an array for possible camera targets
        private _targetPositions = [];

        // If it's the first round use the startbase, otherwise fill the targets array
        if (_firstRound) then {
            _targetPositions pushBack (getpos KPLIB_eden_startbase);
        } else {
            // Add 2 FOBs as possible camera targets
            if ((count KPLIB_sectors_fobs) > 0) then {
                for "_i" from 1 to 2 step 1 do {
                    _targetPositions pushBack (getMarkerPos (selectRandom KPLIB_sectors_fobs));
                };
            };

            // If active, add up to 5 active sectors. Otherwise add 5 random sectors.
            if ((count KPLIB_sectors_active) > 0) then {
                for "_i" from 1 to 5 step 1 do {
                    _targetPositions pushBack (getMarkerPos (selectRandom KPLIB_sectors_active));
                };
            } else {
                for "_i" from 1 to 5 step 1 do {
                    _targetPositions pushBack (getMarkerPos (selectRandom KPLIB_sectors_all));
                };
            };

            // Add up to 3 players as cam targets who are not at the spawn area, if available
            private _targetPlayers = (allPlayers - entities "HeadlessClient_F") select {(alive _x) && ((_x distance KPLIB_eden_respawnPos) > 100)};
            if ((count _targetPlayers) > 0) then {
                for "_i" from 1 to 3 step 1 do {
                    _targetPositions pushBack (getPos (selectRandom _targetPlayers));
                };
            };
        };

        // Pick a random position from the available target positions excluding the last one used
        private _actualTargetPos = selectRandom (_targetPositions - [_lastTargetPos]);
        _lastTargetPos = _actualTargetPos;

        // Target variable for the camera
        private _camtarget = KPLIB_eden_startbase;

        // If it's not the first camera round, select a new target by moving the pointer
        if (!_firstRound) then {
            _pointer setpos [_actualTargetPos select 0, _actualTargetPos select 1, (_actualTargetPos select 2) + 7];
            _camtarget = _pointer;

            // If there are alive players near the selected sector we should focus the camera on one of them
            private _nearPlayers = (allPlayers - entities "HeadlessClient_F") select {(alive _x) && ((_x distance _actualTargetPos) < 250)};
            if ((count _nearPlayers) > 0) then {
                _camtarget = selectRandom _nearPlayers;
            };
        };

        // Assign camera target
        _cam camSetTarget _camtarget;

        // Parameters for the camera round
        private _startPos = [((getPos _camtarget) select 0) - 60, ((getPos _camtarget) select 1) + 350, 5];
        private _endPos = [((getPos _camtarget) select 0) - 60, ((getPos _camtarget) select 1) - 230, 5];
        private _startFov = 0.5;
        private _endFov = 0.5;

        // Some diversity for the camera rounds
        if (!_firstRound) then {
            _startFov = 0.8;
            _endFov = 0.8;

            private _nextTransition = selectRandom ([0, 1, 2, 3, 4, 5, 6, 7 ,8 ,9 ,10, 11 ,12 ,13 ,14, 15] - [_lastTransition]);
            _lastTransition = _nextTransition;

            switch (_nextTransition) do {
                case 0: {
                    _startPos = [((getpos _camtarget) select 0) - 30, ((getpos _camtarget) select 1) - 50, 15];
                    _endPos = [((getpos _camtarget) select 0) - 30, ((getpos _camtarget) select 1) + 50, 15];
                    _endFov = 0.8;
                };

                case 1: {
                    _startPos = [((getpos _camtarget) select 0) + 5, ((getpos _camtarget) select 1) - 100, 1];
                    _endPos = [((getpos _camtarget) select 0) + 5, ((getpos _camtarget) select 1) + 100, 40];
                    _endFov = 0.55;
                };

                case 2: {
                    _startPos = [((getpos _camtarget) select 0) + 50, ((getpos _camtarget) select 1) - 50, 100];
                    _endPos = [((getpos _camtarget) select 0) + 50, ((getpos _camtarget) select 1) + 50, 100];
                    _startFov = 0.5;
                    _endFov = 0.3;
                };

                case 3: {
                    _startPos = [((getpos _camtarget) select 0) + 50, ((getpos _camtarget) select 1) - 80, 2];
                    _endPos = [((getpos _camtarget) select 0) + 50, ((getpos _camtarget) select 1) + 80, 20];
                };

                case 4: {
                    _startPos = [((getpos _camtarget) select 0) - 400, ((getpos _camtarget) select 1) + 400, 50];
                    _endPos = [((getpos _camtarget) select 0) + 400, ((getpos _camtarget) select 1) + 400, 50];
                    _startFov = 0.25;
                    _endFov = 0.25;
                };

                case 5: {
                    _startPos = [((getpos _camtarget) select 0) + 300, ((getpos _camtarget) select 1) - 100, 15];
                    _endPos = [((getpos _camtarget) select 0) -300, ((getpos _camtarget) select 1) - 120, 15];
                };

                case 6: {
                    _startPos = [((getpos _camtarget) select 0) + 100, ((getpos _camtarget) select 1) - 100, 1];
                    _endPos = [((getpos _camtarget) select 0) + 100, ((getpos _camtarget) select 1) - 100, 50];
                };

                case 7: {
                    _startPos = [((getpos _camtarget) select 0) + 50, ((getpos _camtarget) select 1) - 50, 150];
                    _endPos = [((getpos _camtarget) select 0) + 20, ((getpos _camtarget) select 1) - 20, 5];
                    _startFov = 0.6;
                    _endFov = 0.9;
                };

                case 8: {
                    _startPos = [((getpos _camtarget) select 0) - 300, ((getpos _camtarget) select 1) - 80, 20];
                    _endPos = [((getpos _camtarget) select 0) + 300, ((getpos _camtarget) select 1) + 120, 20];
                    _startFov = 0.55;
                    _endFov = 0.55;
                };

                case 9: {
                    _startPos = [((getpos _camtarget) select 0) - 80, ((getpos _camtarget) select 1) - 300, 30];
                    _endPos = [((getpos _camtarget) select 0) + 120, ((getpos _camtarget) select 1) + 300, 30];
                    _startFov = 0.65;
                    _endFov = 0.65;
                };

                case 10: {
                    _startPos = [((getpos _camtarget) select 0) - 5, ((getpos _camtarget) select 1) + 30, 5];
                    _endPos = [((getpos _camtarget) select 0) - 25, ((getpos _camtarget) select 1) -30, 150];
                };

                case 11 : {
                    _cam cameraEffect ["Terminate", "BACK"];
                    camDestroy _cam;
                    _cam = "camera" camCreate [0,0,0];
                    _cam cameraEffect ["internal","back"];
                    _cam camcommit 0;
                    _startPos = [((getpos _camtarget) select 0) + 2, ((getpos _camtarget) select 1) -200, 25];
                    _endPos = [((getpos _camtarget) select 0) + 2, ((getpos _camtarget) select 1) +200, 25];
                    _cam setDir 0;
                    [_cam, -30, 0] call BIS_fnc_setPitchBank; // Maybe replace with setVectorDirAndUp ?
                };

                case 12 : {
                    _cam cameraEffect ["Terminate", "BACK"];
                    camDestroy _cam;
                    _cam = "camera" camCreate [0,0,0];
                    _cam cameraEffect ["internal","back"];
                    _cam camcommit 0;
                    _startPos = [((getpos _camtarget) select 0) + 302 , ((getpos _camtarget) select 1) + 300, 50];
                    _endPos = [((getpos _camtarget) select 0) - 198, ((getpos _camtarget) select 1) - 200, 50];
                    _cam setDir 225;
                    [_cam, -25, 0] call BIS_fnc_setPitchBank; // Maybe replace with setVectorDirAndUp ?
                };

                case 13 : {
                    _cam cameraEffect ["Terminate", "BACK"];
                    camDestroy _cam;
                    _cam = "camera" camCreate [0,0,0];
                    _cam cameraEffect ["internal","back"];
                    _cam camcommit 0;
                    _startPos = [((getpos _camtarget) select 0) - 80 , ((getpos _camtarget) select 1) + 150, 20];
                    _endPos = [((getpos _camtarget) select 0) - 80, ((getpos _camtarget) select 1) - 150, 20];
                    _cam setDir 90;
                    [_cam, -15, 0] call BIS_fnc_setPitchBank; // Maybe replace with setVectorDirAndUp ?
                };

                case 14 : {
                    _cam cameraEffect ["Terminate", "BACK"];
                    camDestroy _cam;
                    _cam = "camera" camCreate [0,0,0];
                    _cam cameraEffect ["internal","back"];
                    _cam camcommit 0;
                    _startPos = [((getpos _camtarget) select 0) - 50 , ((getpos _camtarget) select 1) + 2, 30];
                    _endPos = [((getpos _camtarget) select 0) + 150, ((getpos _camtarget) select 1) - 2, 30];
                    _cam setDir 270;
                    [_cam, -20, 0] call BIS_fnc_setPitchBank; // Maybe replace with setVectorDirAndUp ?
                    _startFov = 0.55;
                    _endFov = 0.55;
                };

                case 15 : {
                    _cam cameraEffect ["Terminate", "BACK"];
                    camDestroy _cam;
                    _cam = "camera" camCreate [0,0,0];
                    _cam cameraEffect ["internal","back"];
                    _cam camcommit 0;
                    _startPos = [((getpos _camtarget) select 0) - 150 , ((getpos _camtarget) select 1) + 5, 250];
                    _endPos = [((getpos _camtarget) select 0) + 150, ((getpos _camtarget) select 1) + 5, 250];
                    _cam setDir 0;
                    [_cam, -88, 0] call BIS_fnc_setPitchBank; // Maybe replace with setVectorDirAndUp ?
                    _startFov = 0.3;
                    _endFov = 0.3;
                };
            };
        };

        // Raise the start and end position if the target is above the water
        if (surfaceIsWater _actualTargetPos) then {
            _startPos = [_startPos select 0, _startPos select 1, (_startPos select 2) + 25];
            _endPos = [_endPos select 0, _endPos select 1, (_endPos select 2) + 25];
        };

        // Raise the start and end position until there is no terrain intersection between both positions
        while {terrainIntersect [_startPos, _endpos]} do {
            _startPos = [_startPos select 0, _startPos select 1, (_startPos select 2) + 30];
            _endPos = [_endPos select 0, _endPos select 1, (_endPos select 2) + 30];
        };

        // Do the camera round
        _cam camSetPos _startPos;
        _cam camSetFov _startFov;
        _cam camCommit 0;
        _cam camSetPos _endPos;
        _cam camSetFov _endFov;

        // Diversion for the commit time for the camera
        if (_firstRound) then {
            _cam camCommit 18;
        } else {
            if (KPLIB_intro_tutorial == 0) then {
                _cam camCommit 10;
            } else {
                _cam camCommit 20;
            };
        };

        // It's not the first round anymore
        _firstRound = false;

        // If the player didn't open the tutorial, show some information from the camera target
        if (KPLIB_intro_tutorial == 0) then {

            // Get the playername, if we have a player as target
            private _unitName = "";
            if (isPlayer _camtarget) then {_unitname = name _camtarget;};

            // Get the name of the sector we're looking at
            private _sectorName = "";
            if (_actualTargetPos distance KPLIB_eden_startbase < 300) then {
                _sectorName = localize "STR_INTRO_BEGIN";
            } else {
                _sectorName = [300, _actualTargetPos] call KPLIB_fnc_core_getNearestSector;
                if (_sectorName != "") then {
                    _sectorName = markertext _sectorName;
                } else {
                    // If it's not a player, not a sector and not the starting base, it has to be a FOB
                    _nearFobs = KPLIB_sectors_fobs select {getMarkerPos _x distance _actualTargetPos < 300};
                    if (count _nearFobs > 0) then {
                        _sectorName = format ["FOB %1", KPLIB_preset_alphabet select (KPLIB_sectors_fobs find (_nearFobs select 0))];
                    };
                };
            };

            [format ["<t size='0.7' align='left'>%1<br/>%2</t>", _unitName, _sectorName],1,0.8,6,1] spawn BIS_fnc_dynamictext;
        };
    };
};

// End the intro
_cam cameraEffect ["Terminate", "BACK"];
camDestroy _cam;
camUseNVG false;
deleteVehicle _pointer;

true
