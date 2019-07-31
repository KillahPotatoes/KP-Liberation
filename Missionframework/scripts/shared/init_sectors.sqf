sectors_airspawn = [];
sectors_allSectors = [];
sectors_bigtown = [];
sectors_capture = [];
sectors_factory = [];
sectors_military = [];
sectors_opfor = [];
sectors_tower = [];

{
    switch (true) do {
        case (_x find "bigtown" == 0): {sectors_bigtown pushBack _x; sectors_allSectors pushBack _x;};
        case (_x find "capture" == 0): {sectors_capture pushBack _x; sectors_allSectors pushBack _x;};
        case (_x find "factory" == 0): {sectors_factory pushBack _x; sectors_allSectors pushBack _x;};
        case (_x find "military" == 0): {sectors_military pushBack _x; sectors_allSectors pushBack _x;};
        case (_x find "opfor_airspawn" == 0): {sectors_airspawn pushBack _x;};
        case (_x find "opfor_point" == 0): {sectors_opfor pushBack _x;};
        case (_x find "tower" == 0): {sectors_tower pushBack _x; if (isServer) then {_x setMarkerText format ["%1 %2",markerText _x, mapGridPosition (markerPos _x)];}; sectors_allSectors pushBack _x;};
    };
} forEach allMapMarkers;
