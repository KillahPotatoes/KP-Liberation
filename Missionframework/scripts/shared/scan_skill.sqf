set_skill = compile preprocessfilelinenumbers "scripts\shared\set_skill.sqf";

while {true} do {
	{[_x] call set_skill} forEach (allUnits select {local _x && !isplayer _x});
	sleep 15;
};
