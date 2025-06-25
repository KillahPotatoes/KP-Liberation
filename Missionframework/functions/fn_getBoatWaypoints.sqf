/*
    File: fn_getBoatWaypoints.sqf
    Author: FatRefrigerator
    Date: 2024-11-6
    Last Update: 2024-11-6
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Gets waypoints for boats. Created this since I realized it could be used on multiple boat-related scripts, so figured it should be a function.

    Parameter(s):
        _objective - The place to search for safe boat waypoints [POS, defaults to 0,0,0]

    Returns:
        a safe boat waypoint [ARRAY]
*/

params [
    ["_objective", [0, 0, 0], [[]], [2, 3]]
];

if(_objective isEqualTo [0,0,0]) exitWith {[]};

private _posFound = false;
private _randomPos = [];
private _boatWaypoint = [];
private _waterDepth = 0;

_searchCounter = 0;
    while {!_posFound} do
    {
        _randomPos - [];
        //counter because there are cases where there will be water near an objective but none will be deep enough
        //most boats can drive in 1m of water, but i have it set to 3m since that will keep waypoints from being put super close to shore
        _searchCounter = _searchCounter + 1;
            
        if(_searchCounter isEqualTo 20) then {break};

        _randomPos = [_objective,1,300,0,2] call BIS_fnc_findSafePos;
            
        if(_randomPos distance _objective > 500) then {break};

        _randomPos pushBack 0;
        _waterDepth = ASLToATL _randomPos select 2;
 
        if (!(_waterDepth < 3)) then
        {
			_boatWaypoint = _randomPos;
            _posFound = true;
        };
    };
_boatWaypoint;