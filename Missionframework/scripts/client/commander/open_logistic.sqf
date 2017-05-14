private ["_dialog", "_logi_count", "_listselect", "_selectedGroup", "_detailControls", "_nearfob", "_logi_destinations", "_mapdisplay"];

_dialog = createDialog "liberation_logistic";
_logi_count = 0;
_listselect = -1;
_selectedGroup = [];
_detailControls = [
	75805,75806,75807,75808,75809,758010,758011,758012,758013,758014,758015,758016,758017,758018,
	758019,758020,758021,758022,758023,758024,758025,758026,758027,758028,758029,758030,758031,
	758032,758080,758081
];
_nearfob = [] call F_getNearestFob;
_logi_destinations = [];

{
	_logi_destinations pushBack [(format ["FOB %1", military_alphabet select _forEachIndex]), _x];
} forEach GRLIB_all_fobs;

{
	_logi_destinations pushBack [(markerText _x),(markerPos _x)];
} forEach (blufor_sectors - sectors_bigtown - sectors_military - sectors_tower);

_logi_destinations sort true;

addLogiGroup = 0;
deleteLogiGroup = 0;
buyLogiTruck = 0;
sellLogiTruck = 0;
saveConvoySettings = 0;
convoyStandby = 0;
logiError = 0;

disableSerialization;

waitUntil {dialog};

_mapdisplay = ((findDisplay 758002) displayCtrl 758098);

ctrlMapAnimClear _mapdisplay;

while {dialog && (alive player)} do {

	ctrlEnable [75804, false];
	ctrlEnable [758021, false];
	ctrlEnable [758022, false];
	ctrlEnable [758024, false];
	ctrlEnable [758025, false];
	ctrlEnable [758026, false];
	ctrlEnable [758027, false];
	ctrlEnable [758029, false];
	ctrlEnable [758030, false];
	ctrlEnable [758031, false];
	ctrlEnable [758032, false];
	ctrlEnable [758080, false];
	ctrlEnable [758081, false];

	if (addLogiGroup == 1) then {
		addLogiGroup = 0;
		[_selectedGroup] remoteExec ["add_logiGroup_remote_call",2];
		waitUntil {sleep 0.5; _logi_count != (count KP_liberation_logistics)};
	};

	if (deleteLogiGroup == 1) then {
		deleteLogiGroup = 0;
		[_selectedGroup] remoteExec ["del_logiGroup_remote_call",2];
		waitUntil {sleep 0.5; _logi_count != (count KP_liberation_logistics)};
	};

	if (buyLogiTruck == 1) then {
		buyLogiTruck = 0;
		[_listselect, _nearfob, clientOwner] remoteExec ["add_logiTruck_remote_call",2];
		waitUntil {sleep 0.5; (!(_selectedGroup isEqualTo (KP_liberation_logistics select _listselect))) || (logiError == 1)};
	};

	if (sellLogiTruck == 1) then {
		sellLogiTruck = 0;
		[_listselect, _nearfob, clientOwner] remoteExec ["del_logiTruck_remote_call",2];
		waitUntil {sleep 0.5; (!(_selectedGroup isEqualTo (KP_liberation_logistics select _listselect))) || (logiError == 1)};
	};

	if (saveConvoySettings == 1) then {
		saveConvoySettings = 0;
		[_listselect, clientOwner] remoteExec ["save_logi_remote_call",2];
		waitUntil {sleep 0.5; (!(_selectedGroup isEqualTo (KP_liberation_logistics select _listselect))) || (logiError == 1)};
	};

	if (convoyStandby == 1) then {
		convoyStandby = 0;
		[_listselect, clientOwner] remoteExec ["abort_logi_remote_call",2];
		waitUntil {sleep 0.5; (!(_selectedGroup isEqualTo (KP_liberation_logistics select _listselect))) || (logiError == 1)};
	};

	logiError = 0;

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
		{ctrlShow [_x, true]} forEach _detailControls;
		ctrlEnable [758021, true];
		_selectedGroup = (KP_liberation_logistics select _listselect);

		if ((_selectedGroup select 1) <= 0) then {
			ctrlEnable [75804, true];
		} else {
			ctrlEnable [758022, true];
			if ((_selectedGroup select 7) == 0) then {
				ctrlEnable [758024, true];
				ctrlEnable [758025, true];
				ctrlEnable [758026, true];
				ctrlEnable [758027, true];
				ctrlEnable [758029, true];
				ctrlEnable [758030, true];
				ctrlEnable [758031, true];
				ctrlEnable [758032, true];
				ctrlEnable [758080, true];
			};
		};

		ctrlSetText [75805, (_selectedGroup select 0)];

		switch ((_selectedGroup select 7)) do {
			case 0: {ctrlSetText[758011, "-"]; ctrlSetText[75807, localize "STR_LOGISTIC_STANDBY"];};
			case 1: {ctrlSetText[758011, "B"]; ctrlSetText[75807, localize "STR_LOGISTIC_LOADING"]; ctrlEnable [758081, true];};
			case 2: {ctrlSetText[758011, "B"]; ctrlSetText[75807, localize "STR_LOGISTIC_TRAVEL"]; ctrlEnable [758081, true];};
			case 3: {ctrlSetText[758011, "A"]; ctrlSetText[75807, localize "STR_LOGISTIC_LOADING"]; ctrlEnable [758081, true];};
			case 4: {ctrlSetText[758011, "A"]; ctrlSetText[75807, localize "STR_LOGISTIC_TRAVEL"]; ctrlEnable [758081, true];};
			case 5: {ctrlSetText[758011, "-"]; ctrlSetText[75807, localize "STR_LOGISTIC_ABORT"];};
		};

		((findDisplay 75802) displayCtrl 75809) ctrlSetTextColor [1,1,1,1];
		if ((_selectedGroup select 8) != -1) then {
			ctrlSetText[75809,(format [localize "STR_PRODUCTION_MINUTES",(_selectedGroup select 8)])]
		} else {
			if ((_selectedGroup select 7) == 0) then {
				ctrlSetText[75809, "-"]
			} else {
				((findDisplay 75802) displayCtrl 75809) ctrlSetTextColor [0.9,0,0,1];
				ctrlSetText[75809, localize "STR_LOGISTIC_NORESSOURCES"]
			};
			
		};

		ctrlSetText [758014, (str (_selectedGroup select 1))];
		ctrlSetText [758016, (str ((_selectedGroup select 6) select 0))];
		ctrlSetText [758018, (str ((_selectedGroup select 6) select 1))];
		ctrlSetText [758020, (str ((_selectedGroup select 6) select 2))];

		lbClear 758024;
		lbClear 758029;
		{
				lbAdd [758024, (_x select 0)];
				lbAdd [758029, (_x select 0)];
		} forEach _logi_destinations;

		if (!((_selectedGroup select 2) isEqualTo [0,0,0])) then {
			{
				// Why the hell does "if ((_selectedGroup select 2) isEqualTo (_x select 1)) ..." return false? -.-
				if (((_selectedGroup select 2) distance2D (_x select 1) < 10)) exitWith {lbSetCurSel [758024, _forEachIndex];};
			} forEach _logi_destinations;
		};

		if (!((_selectedGroup select 3) isEqualTo [0,0,0])) then {
			{
				if (((_selectedGroup select 3) distance2D (_x select 1) < 10)) exitWith {lbSetCurSel [758029, _forEachIndex];};
			} forEach _logi_destinations;
		};

		ctrlSetText [758025, (str ((_selectedGroup select 4) select 0))];
		ctrlSetText [758026, (str ((_selectedGroup select 4) select 1))];
		ctrlSetText [758027, (str ((_selectedGroup select 4) select 2))];

		ctrlSetText [758030, (str ((_selectedGroup select 5) select 0))];
		ctrlSetText [758031, (str ((_selectedGroup select 5) select 1))];
		ctrlSetText [758032, (str ((_selectedGroup select 5) select 2))];

	} else {
		{ctrlShow [_x, false]} forEach _detailControls;
		_selectedGroup = [];
	};

	waitUntil {
		!dialog
		|| !(alive player)
		|| (lbCurSel 75802) != _listselect
		|| addLogiGroup != 0
		|| deleteLogiGroup != 0
		|| buyLogiTruck != 0
		|| sellLogiTruck != 0
		|| saveConvoySettings != 0
		|| convoyStandby != 0
	};
};
