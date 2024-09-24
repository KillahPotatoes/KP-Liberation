scriptName "secondary_jip";

waitUntil {
    time > 20;
};

if ( isNil "KPLIB_secondary_in_progress" ) exitWith {};
if ( KPLIB_secondary_in_progress < 0 ) exitWith {};

if ( KPLIB_secondary_in_progress == 0 ) then {
    [ 2 ] call remote_call_intel;
};
