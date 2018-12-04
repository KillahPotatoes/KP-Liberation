uiSleep 3;

{
	_nextower = "Land_Communication_F" createVehicle (markerpos _x);
	_nextower setpos (markerpos _x);
	_nextower setVectorUp [0,0,1];
	_nextower addEventHandler ["HandleDamage", { 0 }];
} foreach sectors_tower;