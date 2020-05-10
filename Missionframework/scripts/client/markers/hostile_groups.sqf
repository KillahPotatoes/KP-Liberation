private ["_kp_markers_array","_kp_markers_start","_kp_markers_change","_kp_markers_pos","_kp_markers_posx","_kp_markers_posy","_kp_markers_name","_kp_markers_color"];

waitUntil {sleep 0.1; !isNil "save_is_loaded" && {save_is_loaded}};

_kp_markers_array = [];
_kp_markers_start = 0.2;
_kp_markers_change = 0.05;

while {true} do {
    {deleteMarkerLocal _x;} forEach _kp_markers_array;
    _kp_markers_array = [];
    {
        if ((side _x == GRLIB_side_enemy) && (({!captive _x} count (units _x) ) > 0) && ([(getpos leader _x), GRLIB_side_friendly, GRLIB_radiotower_size] call KPLIB_fnc_getNearestTower != "")) then {
            _kp_markers_pos = getPosATL leader _x;
            _kp_markers_posx = floor (_kp_markers_pos select 0);
            _kp_markers_posx = _kp_markers_posx - (_kp_markers_posx mod 500);
            _kp_markers_posy = floor (_kp_markers_pos select 1);
            _kp_markers_posy = _kp_markers_posy - (_kp_markers_posy mod 500);

            // Chernarus Grid Fix
            if (worldName == "Chernarus") then {
                _kp_markers_posy = _kp_markers_posy - 140;
                if ((_kp_markers_posy + 500) < (_kp_markers_pos select 1)) then {
                    _kp_markers_posy = _kp_markers_posy + 500;
                };
            };

            // Sahrani Grid Fix
            if (worldName == "Sara") then {
                _kp_markers_posy = _kp_markers_posy - 20;
                if ((_kp_markers_posy + 500) < (_kp_markers_pos select 1)) then {
                    _kp_markers_posy = _kp_markers_posy + 500;
                };
            };

            _kp_markers_name = format["kp_marker_grid_%1_%2", _kp_markers_posx, _kp_markers_posy];
            _kp_markers_color = format["Color%1", side _x];

            if ((markerShape _kp_markers_name) isEqualTo "RECTANGLE") then {
                _kp_markers_name setMarkerAlphaLocal ((markerAlpha _kp_markers_name) +  _kp_markers_change);
            } else {
                createMarkerLocal[_kp_markers_name, [_kp_markers_posx + 250, _kp_markers_posy + 250, 0]];
                _kp_markers_name setMarkerShapeLocal "RECTANGLE";
                _kp_markers_name setMarkerSizeLocal [250,250];
                _kp_markers_name setMarkerColorLocal _kp_markers_color;
                _kp_markers_name setMarkerAlphaLocal (_kp_markers_start +  _kp_markers_change);
                _kp_markers_array pushBack _kp_markers_name;
            };
        };
    } forEach allGroups;
    uiSleep (60 + (random 60));
};
