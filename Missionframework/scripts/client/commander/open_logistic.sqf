private ["_dialog", "_logi_count", "_listselect", "_selectedGroup", "_detailControls", "_mapdisplay"];

_dialog = createDialog "liberation_logistic";
_logi_count = 0;
_listselect = -1;
_selectedGroup = [];
_detailControls = [75805,75806,75807];

deleteLogiGroup = 0;

disableSerialization;

waitUntil {dialog};

_mapdisplay = ((findDisplay 758002) displayCtrl 758098);

ctrlMapAnimClear _mapdisplay;

while {dialog && (alive player)} do {

	if (deleteLogiGroup == 1) then {
		deleteLogiGroup = 0;
		[_selectedGroup] remoteExec ["del_logiGroup_remote_call",2];
	};

	if (_logi_count != (count KP_liberation_logistics)) then {
		_logi_count = (count KP_liberation_logistics);
		lbClear 75802;
		{
			lbAdd [75802, (_x select 0)];
		} forEach KP_liberation_logistics;
	};

	if ((_logi_count > 0) && (lbCurSel 75802 == -1)) then {
		lbSetCurSel [75802,0];
	};

	_listselect = (lbCurSel 75802);

	if ((_listselect != -1) && (_logi_count > 0)) then {
		ctrlEnable [75804, true];
		{ctrlShow [_x, true]} forEach _detailControls;
		ctrlEnable [758080, true];
		_selectedGroup = (KP_liberation_logistics select _listselect);

		ctrlSetText [75805, (_selectedGroup select 0)];

		switch ((_selectedGroup select 7)) do {
			case 0: {ctrlSetText[75807, localize "STR_LOGISTIC_STANDBY"];};
			case 1;
			case 3: {ctrlSetText[75807, localize "STR_LOGISTIC_LOADING"];};
			case 2;
			case 4: {ctrlSetText[75807, localize "STR_LOGISTIC_TRAVEL"];};
		};
	} else {
		ctrlEnable [75804, false];
		{ctrlShow [_x, false]} forEach _detailControls;
		ctrlEnable [758080, false];
		_selectedGroup = [];
	};

	waitUntil {!dialog || !(alive player) || (lbCurSel 75802) != _listselect || _logi_count != (count KP_liberation_logistics) || deleteLogiGroup != 0};
};
