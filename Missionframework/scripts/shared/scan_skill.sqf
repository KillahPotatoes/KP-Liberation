set_skill = compile preprocessfilelinenumbers "scripts\shared\set_skill.sqf";

while {true} do {
	{[_x] call set_skill} forEach ([allUnits, {local _x && !isplayer _x}] call BIS_fnc_conditionalSelect);
	sleep 15;
};
