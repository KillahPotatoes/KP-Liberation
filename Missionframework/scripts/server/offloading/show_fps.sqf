scriptName "show_fps";

private _sourcestr = "Server";
private _position = 0;

if (!isServer) then {
    if (!isNil "HC1" && {!isNull HC1 && {local HC1}}) then {
        _sourcestr = "HC1";
        _position = 1;
    };

    if (!isNil "HC2" && {!isNull HC2 && {local HC2}}) then {
        _sourcestr = "HC2";
        _position = 2;
    };

    if (!isNil "HC3" && {!isNull HC3 && {local HC3}}) then {
        _sourcestr = "HC3";
        _position = 3;
    };
};

private _myfpsmarker = createMarkerLocal [format ["fpsmarker%1", _sourcestr], [0, -500 - (500 * _position)]];
_myfpsmarker setMarkerTypeLocal "mil_start";
_myfpsmarker setMarkerSizeLocal [0.7, 0.7];

while {true} do {

    private _myfps = diag_fps;
    private _localgroups = {local _x} count allGroups;
    private _localunits = {local _x} count allUnits;

    switch (true) do {
        case (_myfps < 10): {_myfpsmarker setMarkerColorLocal "ColorRED"};
        case (_myfps < 20 && _myfps > 10): {_myfpsmarker setMarkerColorLocal "ColorORANGE"};
        case (_myfps < 30 && _myfps > 20): {_myfpsmarker setMarkerColorLocal "ColorYELLOW"};
        default {_myfpsmarker setMarkerColorLocal "ColorGREEN"};
    };

    _myfpsmarker setMarkerText format ["%1: %2 fps, %3 local groups, %4 local units", _sourcestr, (round (_myfps * 100.0)) / 100.0, _localgroups, _localunits];

    sleep 15;
};
