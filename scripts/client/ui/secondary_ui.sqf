if ( isNil "GRLIB_secondary_starting" ) then { GRLIB_secondary_starting = false; };
if ( isNil "GRLIB_secondary_in_progress" ) then { GRLIB_secondary_in_progress = -1; };

_dialog = createDialog "liberation_secondary";
dostartsecondary = 0;

waitUntil { dialog };

{
	lbAdd [ 101, localize _x ];
} foreach [
	"STR_SECONDARY_MISSION0",
	"STR_SECONDARY_MISSION1",
	"STR_SECONDARY_MISSION2"
];

private [ "_oldchoice", "_images", "_briefings", "_missioncost" ];

_images = [
	"res\secondary\fob_hunting.jpg",
	"res\secondary\convoy_hijack.jpg",
	"res\secondary\sar.jpg"
];

_briefings = [
	"STR_SECONDARY_BRIEFING0",
	"STR_SECONDARY_BRIEFING1",
	"STR_SECONDARY_BRIEFING2"
];

_oldchoice = -1;
lbSetCurSel [ 101, 0 ];

while { dialog && alive player && dostartsecondary == 0 } do {

	if ( _oldchoice != lbCurSel 101 ) then {
		_oldchoice = lbCurSel 101;
		ctrlSetText [ 106, _images select _oldchoice ];
		((findDisplay 6842) displayCtrl (102)) ctrlSetStructuredText parseText localize (_briefings select _oldchoice);
	};

	_missioncost = GRLIB_secondary_missions_costs select _oldchoice;

	if ( ( _missioncost <= resources_intel ) && ( !GRLIB_secondary_starting ) )  then {
		ctrlEnable [ 103, true ];
		((findDisplay 6842) displayCtrl (103)) ctrlSetTooltip "";
	} else {
		ctrlEnable [ 103, false ];
		if ( _missioncost > resources_intel ) then {
			((findDisplay 6842) displayCtrl (103)) ctrlSetTooltip (localize "STR_SECONDARY_NOT_ENOUGH_INTEL");
		};
		if ( GRLIB_secondary_starting ) then {
			((findDisplay 6842) displayCtrl (103)) ctrlSetTooltip (localize "STR_SECONDARY_IN_PROGRESS");
		};
	};

	if ( GRLIB_secondary_in_progress >= 0 ) then {
		lbSetCurSel [ 101, GRLIB_secondary_in_progress ];
		ctrlEnable [ 101, false ];
	} else {
		ctrlEnable [ 101, true ];
	};

	ctrlSetText [ 107, format [ localize "STR_SECONDARY_INTEL", resources_intel ] ];
	sleep 0.1;
};

if ( dostartsecondary == 1 ) then {
	[lbCurSel 101] remoteExec ["start_secondary_remote_call",2];
};

if ( dialog ) then {
	closeDialog 0;
};