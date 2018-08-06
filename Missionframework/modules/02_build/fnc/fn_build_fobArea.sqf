/*
    KPLIB_fnc_build_fobArea

    File: fn_build_fobArea.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-08-05
    Last Update: 2018-08-05
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Creates or removes sphere indicator at FOB area

    Parameter(s):
        0: STRING - Action identifier, used to detect what action should be taken, ("init"/"remove")
        1: STRING - FOB marker name

    Returns:
    NOTHING
*/

params [
    ["_mode", "init", [""]],
    ["_fob", nil, [""]]
];

private _indicatorClass = "Sign_Sphere100cm_F";

switch toLower _mode do {
    case "init": {

        // Get spheres global array
        private _spheres = missionNamespace getVariable ["KPLIB_fob_indicatorSpheres", []];
        // Remove old spheres
        if !(_spheres isEqualTo []) then { ["remove"] call KPLIB_fnc_build_fobArea };

        // Get positions
        private _indicatorsPositions = [getMarkerPos _fob] call KPLIB_fnc_common_getCirclePositions;

        // Create spheres
        {
            private _pos = _x;

            private _sphere = _indicatorClass createVehicleLocal [0, 0, 0];
            _sphere setPos [_pos select 0, _pos select 1, _pos select 2];

            _spheres pushBack _sphere;

        } forEach _indicatorsPositions;

        KPLIB_fob_indicatorSpheres = _spheres;
    };

    case "remove": {
        // Remove all spheres
        {
            deleteVehicle _x;
        } forEach (missionNamespace getVariable ["KPLIB_fob_indicatorSpheres", []]);
        KPLIB_fob_indicatorSpheres = [];
    };
};
