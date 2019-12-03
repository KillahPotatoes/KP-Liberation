/*
    File: fn_spawnCivilians.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-12-03
    Last Update: 2019-12-03
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        No description added yet.

    Parameter(s):
        _localVariable - Description [DATATYPE, defaults to DEFAULTVALUE]

    Returns:
        Function reached the end [BOOL]
*/
// TODO
params ["_sector"];

private _createdcivs = [];
private _sectorpos = getMarkerPos _sector;

private _idx = 0;
private _nbcivs = round ((3 + (floor (random 7))) * GRLIB_civilian_activity);
private _spread = 1;
if (_sector in sectors_bigtown) then {
    _nbcivs = _nbcivs + 10;
    _spread = 2.5;
};

_nbcivs = _nbcivs * (sqrt (GRLIB_unitcap));

while {_idx < _nbcivs} do {
    private _spawnpos = [(((_sectorpos select 0) + (75 * _spread)) - (random (150 * _spread))),(((_sectorpos select 1) + (75 * _spread)) - (random (150 * _spread))),0];
    private _grp = createGroup [GRLIB_side_civilian, true];

    private _nextciv = [selectRandom civilians, _spawnpos, _grp] call KPLIB_fnc_createManagedUnit;
    _createdcivs pushBack _nextciv;
    [_grp] call add_civ_waypoints;
    _idx = _idx + 1;
};

_createdcivs
