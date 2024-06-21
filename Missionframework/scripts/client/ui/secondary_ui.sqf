scriptName "KPLIB_secondary_ui";

if ( isNil "KPLIB_secondary_starting" ) then { KPLIB_secondary_starting = false; };
if ( isNil "KPLIB_secondary_in_progress" ) then { KPLIB_secondary_in_progress = -1; };

_dialog = createDialog "liberation_secondary";
dostartsecondary = 0;

waitUntil { dialog };

{
    lbAdd [ 101, localize _x ];
} foreach [
    "STR_SECONDARY_MISSION0",
    "STR_SECONDARY_MISSION1",
    "STR_SECONDARY_MISSION2",
    "STR_SECONDARY_MISSION3",
    "STR_SECONDARY_MISSION4",
    "STR_SECONDARY_MISSION5"
];

private [ "_oldchoice", "_images", "_briefings", "_missioncost" ];

_images = [
    "res\secondary\fob_hunting.jpg",
    "res\secondary\convoy_hijack.jpg",
    "res\secondary\sar.jpg",
    "res\secondary\hum_aid.jpg",
    "res\secondary\bingo_fuel.jpg",
    "res\secondary\rearm_outpost.jpg"
];

_briefings = [
    "STR_SECONDARY_BRIEFING0",
    "STR_SECONDARY_BRIEFING1",
    "STR_SECONDARY_BRIEFING2",
    "STR_SECONDARY_BRIEFING3",
    "STR_SECONDARY_BRIEFING4",
    "STR_SECONDARY_BRIEFING5"
];

_oldchoice = -1;
lbSetCurSel [ 101, 0 ];

while { dialog && alive player && dostartsecondary == 0 } do {

    if ( _oldchoice != lbCurSel 101 ) then {
        _oldchoice = lbCurSel 101;
        ctrlSetText [ 106, _images select _oldchoice ];
        ((findDisplay 6842) displayCtrl (102)) ctrlSetStructuredText parseText localize (_briefings select _oldchoice);
    };

    _missioncost = KPLIB_secondary_missions_costs select _oldchoice;

    if ( ( _missioncost <= resources_intel ) && ( !KPLIB_secondary_starting ) )  then {
        ctrlEnable [ 103, true ];
        ((findDisplay 6842) displayCtrl (103)) ctrlSetTooltip "";
    } else {
        ctrlEnable [ 103, false ];
        if ( _missioncost > resources_intel ) then {
            ((findDisplay 6842) displayCtrl (103)) ctrlSetTooltip (localize "STR_SECONDARY_NOT_ENOUGH_INTEL");
        };
        if ( KPLIB_secondary_starting ) then {
            ((findDisplay 6842) displayCtrl (103)) ctrlSetTooltip (localize "STR_SECONDARY_IN_PROGRESS");
        };
    };

    if ( KPLIB_secondary_in_progress >= 0 ) then {
        lbSetCurSel [ 101, KPLIB_secondary_in_progress ];
        ctrlEnable [ 101, false ];
    } else {
        ctrlEnable [ 101, true ];
    };

    ctrlSetText [ 107, format [ localize "STR_SECONDARY_INTEL", resources_intel ] ];
    sleep 0.1;
};

if ( dostartsecondary == 1 ) then {
    private _index = lbCurSel 101;
    if !(([2000,999999,false] call KPLIB_fnc_getOpforSpawnPoint) isEqualTo "") then {
        [_index] remoteExec ["start_secondary_remote_call", 2];
    } else {
        hint "There is not enough enemy territory left for secondary missions.";
        uiSleep 2;
        hintSilent "";
    }
};

if ( dialog ) then {
    closeDialog 0;
};
