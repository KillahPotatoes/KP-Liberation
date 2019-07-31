private ["_dialog", "_color_positive", "_color_neutral", "_color_negative", "_color_actual", "_sectorType", "_storage", "_crateCount", "_crateMax", "_producing", "_storagespace", "_productiontime", "_saveChanges", "_listselect", "_listcolor", "_selectedSector", "_mapdisplay", "_supplyValue", "_ammoValue", "_fuelValue"];

_dialog = createDialog "liberation_production";
saveSectorSetting = 0;
new_production = 0;
_color_positive = [0,0.9,0,1];
_color_neutral = [1,1,1,1];
_color_negative = [0.9,0,0,1];
_color_actual = _color_neutral;
_listselect = -1;
_listcolor = [1,1,1,1];
_selectedSector = [];

disableSerialization;

waitUntil {dialog};

_mapdisplay = ((findDisplay 75801) displayCtrl 758016);

lbClear 75802;
{
	lbAdd [75802, (markerText (_x select 1))];
} forEach KP_liberation_production;

ctrlMapAnimClear _mapdisplay;

while {dialog && (alive player)} do {
	if (lbCurSel 75802 == -1) then {
		lbSetCurSel [75802,0];
	};

	if (saveSectorSetting == 1) then {
		saveSectorSetting = 0;
		[(_selectedSector select 1), new_production] remoteExec ["change_prod_remote_call",2];
		waitUntil {sleep 0.5; (!(_selectedSector isEqualTo (KP_liberation_production select _listselect)))};
	};

	_listselect = -1;

	{
		_listselect = _listselect + 1;

		if ((count (_x select 3)) > 0) then {
			switch (_x select 7) do {
				case 1: {_listcolor = [0.75,0,0,1];};
				case 2: {_listcolor = [0.75,0.75,0,1];};
				case 3: {_listcolor = [1,1,1,1];};
				default {_listcolor = [0,0.75,0,1];};
			};
		} else {
			_listcolor = [0.6,0.6,0.6,0.8];
		};

		lbSetColor [75802, _listselect, _listcolor];
	} forEach KP_liberation_production;

	_listselect = (lbCurSel 75802);
	waitUntil {_listselect == (lbCurSel 75802)};
	_selectedSector = +(KP_liberation_production select _listselect);

	ctrlSetText [75803,(_selectedSector select 0)];

	if ((_selectedSector select 2) == 1) then {_sectorType = localize "STR_PRODUCTION_FACTORY";} else {_sectorType = localize "STR_PRODUCTION_CITY";};
	ctrlSetText [75804, _sectorType];

	if ((count (_selectedSector select 3)) > 0) then {
		_storage = ((nearestObjects [((_selectedSector select 3) select 0), [KP_liberation_small_storage_building], 25]) select 0);
		_crateCount = count (attachedObjects _storage);
		_crateMax = count (KP_liberation_small_storage_positions);

		if (_crateCount >= _crateMax) then {
			_color_actual = _color_negative;
		};

		_storagespace = format ["%1 / %2",_crateCount,_crateMax];
		_productiontime = format [localize "STR_PRODUCTION_MINUTES",(_selectedSector select 8)];

		switch (_selectedSector select 7) do {
			case 1: {_producing = localize "STR_AMMO";};
			case 2: {_producing = localize "STR_FUEL";};
			case 3: {_producing = localize "STR_PRODUCTION_NOTHING"; _productiontime = localize "STR_PRODUCTION_NOTIMER";};
			default {_producing = localize "STR_MANPOWER";};
		};

		ctrlSetText [75805, _producing];
		if ((_selectedSector select 7) == 3) then {
			((findDisplay 75801) displayCtrl 75805) ctrlSetTextColor _color_negative;
			((findDisplay 75801) displayCtrl 75807) ctrlSetTextColor _color_negative;
		} else {
			((findDisplay 75801) displayCtrl 75805) ctrlSetTextColor _color_neutral;
			((findDisplay 75801) displayCtrl 75807) ctrlSetTextColor _color_neutral;
		};
		ctrlSetText [75806, _storagespace];
		((findDisplay 75801) displayCtrl 75806) ctrlSetTextColor _color_actual;
		ctrlSetText [75807, _productiontime];
		_color_actual = _color_neutral;
	} else {
		_producing = localize "STR_PRODUCTION_NOTHING";
		_storagespace = localize "STR_PRODUCTION_NOSTORAGE";
		_productiontime = localize "STR_PRODUCTION_NOTIMER";
		ctrlSetText [75805, _producing];
		((findDisplay 75801) displayCtrl 75805) ctrlSetTextColor _color_negative;
		ctrlSetText [75806, _storagespace];
		((findDisplay 75801) displayCtrl 75806) ctrlSetTextColor _color_negative;
		ctrlSetText [75807, _productiontime];
		((findDisplay 75801) displayCtrl 75807) ctrlSetTextColor _color_negative;
	};

	if (_selectedSector select 4) then {_color_actual = _color_positive;} else {_color_actual = _color_negative;};
	((findDisplay 75801) displayCtrl 75808) ctrlSetTextColor _color_actual;
	if (_selectedSector select 5) then {_color_actual = _color_positive;} else {_color_actual = _color_negative;};
	((findDisplay 75801) displayCtrl 75809) ctrlSetTextColor _color_actual;
	if (_selectedSector select 6) then {_color_actual = _color_positive;} else {_color_actual = _color_negative;};
	((findDisplay 75801) displayCtrl 758010) ctrlSetTextColor _color_actual;
	_color_actual = _color_neutral;

	_supplyValue = ceil ((_selectedSector select 9) / 100);
	_ammoValue = ceil ((_selectedSector select 10) / 100);
	_fuelValue = ceil ((_selectedSector select 11) / 100);

	if (_supplyValue == 1) then {_supplyValue = format [localize "STR_PRODUCTION_CRATE", _supplyValue];} else {_supplyValue = format [localize "STR_PRODUCTION_CRATES", _supplyValue];};
	if (_ammoValue == 1) then {_ammoValue = format [localize "STR_PRODUCTION_CRATE", _ammoValue];} else {_ammoValue = format [localize "STR_PRODUCTION_CRATES", _ammoValue];};
	if (_fuelValue == 1) then {_fuelValue = format [localize "STR_PRODUCTION_CRATE", _fuelValue];} else {_fuelValue = format [localize "STR_PRODUCTION_CRATES", _fuelValue];};

	ctrlSetText [758011, (str (_selectedSector select 9)) + " (" + _supplyValue + ")"];
	ctrlSetText [758012, (str (_selectedSector select 10)) + " (" + _ammoValue + ")"];
	ctrlSetText [758013, (str (_selectedSector select 11)) + " (" + _fuelValue + ")"];

	"spawn_marker" setMarkerPosLocal (getMarkerPos (_selectedSector select 1));
	_mapdisplay ctrlMapAnimAdd [0.5, 0.2,(getMarkerPos (_selectedSector select 1))];
	ctrlMapAnimCommit _mapdisplay;

	waitUntil {!dialog || !(alive player) || (lbCurSel 75802) != _listselect || saveSectorSetting != 0};
};

"spawn_marker" setMarkerPosLocal markers_reset;
