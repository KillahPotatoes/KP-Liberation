_veryLightFog = [
	[1, 1, 0],      //Fooooog on the waaaater:
	[0.1,0.1,30]    //light amount of fog on coast
];
_lightFog = [
	[0.1,0.1,30]	 //light amount of fog on coast
];
_mediumFog = [
	[0.5,0.1,13],	//low coast fog
	[0.2,0.1,30],	//medium foggy coast
	[0.3,0.1,30]	//medium foggy coast
];
_heavyFog = [
	[0.4, 0.1, 30],	//heavy fog on coast
	[0.4, 0.1, 30]	//heavy fog on coast
];

_fogSettings = [_veryLightFog,_lightFog,_mediumFog,_heavyFog];
//chance in % for fog category selection
_fogChance = [20,35,35,10];
//min and max time until fog changes again
_minTime = 2100; //35 minutes
_maxTime = 4200; //70 minutes
_fogChangeTime = 0;
_fogAttr = [0,0,0];
while {true} do {
	if (time >= _fogChangeTime) then {
		_fogCat = _fogSettings selectRandomWeighted _fogChance;
		_fogAttr = selectRandom _fogCat;
		_fogChangeTime = time + (floor random (_maxTime - _minTime)) + _minTime;
	};
	15 setFog _fogAttr;
	sleep 121;	//reset fog to prevent vanilla dynamic fog to have an effect
};