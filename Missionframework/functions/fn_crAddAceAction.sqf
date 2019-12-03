/*
    File: fn_crAddAceAction.sqf
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
params ["_civ"];

if (KP_liberation_civrep_debug > 0) then {private _text = format ["[KP LIBERATION] [CIVREP] ace_action called on: %1", debug_source];_text remoteExec ["diag_log",2];};

_civ addAction [
	"<t color='#FF0000'>" + localize "STR_CR_ACE_ACTION" + "</t>",
	{
		private _target = _this select 0;
		private _caller = _this select 1;

		if ("ACE_fieldDressing" in (vestItems player + uniformItems player + backpackItems player + assignedItems player)) then {
			_caller removeItem "ACE_fieldDressing";
			_target setDamage 0;
		} else {
			hint localize "STR_CR_ACE_ACTION_FAIL";
			sleep 3;
			hint "";
		};
	},
	nil,
	1.5,
	true,
	true,
	"",
	"(damage _target) >= 0.5",
	3
];
