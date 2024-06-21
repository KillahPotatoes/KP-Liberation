scriptName "KPLIB_intro";

if ( isNil "cinematic_camera_started" ) then { cinematic_camera_started = false };
sleep 0.5;
waitUntil { time > 0 };

[] spawn cinematic_camera;

if ( KPLIB_param_introCinematic ) then {

    sleep 1;
    "TAG_libintro1" cutRsc ["intro1","PLAIN",1,true];
    sleep 5.5;
    "TAG_libintro1" cutRsc ["intro2","PLAIN",1,true];
    sleep 10;

};

showcaminfo = true;
dostartgame = 0;
howtoplay = 0;
private _dialog = createDialog "liberation_menu";
waitUntil { dialog };
waitUntil { dostartgame == 1 || howtoplay == 1 || !dialog };

closeDialog 0;
if ( howtoplay == 0 ) then {
    cinematic_camera_started = false;
};
introDone = true;
