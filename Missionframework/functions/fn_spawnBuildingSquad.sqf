/*
    File: fn_spawnBuildingSquad.sqf
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
params ["_infsquad", "_building_ai_max", "_buildingpositions", "_sectorpos", ["_sector", ""]];

private _everythingspawned = [];

private _infsquad_classnames = [];
if (_infsquad == "militia") then {
    _infsquad_classnames = militia_squad;
} else {
    _infsquad_classnames = ([] call KPLIB_fnc_getSquadComp);
};

if (_building_ai_max > floor ((count _buildingpositions) * GRLIB_defended_buildingpos_part)) then {_building_ai_max = floor ((count _buildingpositions) * GRLIB_defended_buildingpos_part)};
private _squadtospawn = [];
while {(count _squadtospawn) < _building_ai_max} do {_squadtospawn pushback (selectRandom _infsquad_classnames);};

private _position_indexes = [];
private _position_count = count _buildingpositions;
while {count _position_indexes < count _squadtospawn} do {
    private _nextposit = floor (random _position_count);
    if !(_nextposit in _position_indexes) then {
        _position_indexes pushback _nextposit;
    };
};

private _grp = createGroup [GRLIB_side_enemy, true];
private _idxposit = 0;
{
    private _nextunit = [_x, _sectorpos, _grp] call KPLIB_fnc_createManagedUnit;

    _nextunit setdir (random 360);
    _nextunit setpos (_buildingpositions select (_position_indexes select _idxposit));
    [_nextunit, _sector] spawn building_defence_ai;

    _idxposit = _idxposit + 1;

    if (count units _grp > 10) then {
        _everythingspawned = _everythingspawned + (units _grp);
        _grp = createGroup [GRLIB_side_enemy, true];
    };
} forEach _squadtospawn;

if (!(isNull _grp)) then {
    _everythingspawned = _everythingspawned + (units _grp);
};

_everythingspawned
