revive_ui = compile preprocessFileLineNumbers "GREUH\scripts\GREUH_revive_ui.sqf";

closeDialog 0;
closeDialog 0;
closeDialog 0;

sleep 1;

while { true } do {
	waitUntil { ( player getVariable "GREUH_isUnconscious") == 1 };

	_camobj = player;
	_pos = positionCameraToWorld [0,0,-0.2];
	_destpos = [getpos player select 0, getpos player select 1, (getpos player select 2) + 150];
	_cam = "camera" camCreate _pos;
	_cam cameraEffect ["internal", "BACK"];
	_cam camSetFOV 1.0;
	showCinemaBorder false;
	if ( (date select 3) < 4 || (date select 3) >= 20 ) then { camUseNVG true; } else { camUseNVG false; };
	_cam camSetTarget _camobj;

	_dialog = createDialog "blackscreen";
	0 fadesound 0;

	[] spawn {
		sleep 3.5;
		3 fadesound 1;
		titleText  [ "" ,"BLACK IN",3];
	};

	"filmGrain" ppEffectAdjust [0.3, 2, 4, 0.5, 0.5, true];
	"filmGrain" ppEffectCommit 0;
	"filmGrain" ppEffectEnable TRUE;

	"colorCorrections" ppEffectAdjust [1, 1.6, -0.35, [1, 1, 1, 0], [1, 1, 1, 0], [0.75, 0.25, 0, 1.0]];
	"colorCorrections" ppEffectCommit 0;
	"colorCorrections" ppEffectEnable TRUE;

	_randomsound1 = ceil (random 6);
	_randomsound2 = ceil (random 3);
	_deathsound = format ["A3\sounds_f\characters\human-sfx\P0%1\Hit_Max_%2.wss",_randomsound1,_randomsound2];

	playSound3D [_deathsound, player, false, getPos player, 1, 1, 0];

	_cam camCommit 0;

	_cam camSetPos _destpos;

	_cam camCommit 900;

	waitUntil { ((player getVariable "GREUH_isUnconscious") == 0) || ((player getVariable "FAR_isUnconscious") == 1) };
	closeDialog 0;
	waitUntil {!dialog};
	if ((player getVariable "GREUH_isUnconscious") != 0) then {
		[] spawn revive_ui;
		waitUntil {dialog};
	};
	waitUntil { ( player getVariable "FAR_isUnconscious"  ) == 0 || !alive player || !dialog };
	player setVariable ["GREUH_isUnconscious", 0, true];
	closeDialog 5566;
	"colorCorrections" ppEffectEnable FALSE;
	"filmGrain" ppEffectEnable FALSE;
	_cam cameraEffect ["Terminate", "BACK"];
	camDestroy _cam;
	camUseNVG false;
};