private ["_dialog", "_fontSize", "_color_positive", "_color_neutral", "_color_negative", "_color_actual", "_sectorType", "_storage", "_crateCount", "_crateMax", "_producing", "_storagespace", "_productiontime", "_saveChanges", "_listselect", "_selectedSector", "_mapdisplay", "_supplyValue", "_ammoValue", "_fuelValue"];

_dialog = createDialog "liberation_production";
_fontSize = 0.02 * safezoneH;
saveSectorSetting = 0;
new_production = 0;
_color_positive = [0,0.9,0,1];
_color_neutral = [1,1,1,1];
_color_negative = [0.9,0,0,1];
_color_actual = _color_neutral;
_listselect = -1;
_selectedSector = -1;

disableSerialization;

waitUntil {dialog};

_mapdisplay = ((findDisplay 758001) displayCtrl 7580026);

lbClear 7580012;
{
	lbAdd [7580012, (_x select 0)];
} forEach KP_liberation_production;

ctrlMapAnimClear _mapdisplay;

while {dialog && (alive player)} do {
	if ( lbCurSel 7580012 == -1 ) then {
		lbSetCurSel [7580012,0];
	};

	if (saveSectorSetting == 1) then {
		saveSectorSetting = 0;
		[(_selectedSector select 1), new_production] remoteExec ["change_prod_remote_call",2];
		sleep 0.5;
	};

	_listselect = (lbCurSel 7580012);
	_selectedSector = (KP_liberation_production select _listselect);

	((findDisplay 758001) displayCtrl 7580013) ctrlSetText (_selectedSector select 0);

	if ((_selectedSector select 2) == 1) then {_sectorType = localize "STR_PRODUCTION_FACTORY";} else {_sectorType = localize "STR_PRODUCTION_CITY";};
	((findDisplay 758001) displayCtrl 7580014) ctrlSetText _sectorType;

	if ((count (_selectedSector select 3)) > 0) then {
		_storage = ((nearestObjects [((_selectedSector select 3) select 0), [KP_liberation_small_storage_building], 25]) select 0);
		_crateCount = count (attachedObjects _storage);
		_crateMax = count (KP_liberation_small_storage_positions);

		if (_crateCount >= _crateMax) then {
			_color_actual = _color_negative;
		};

		switch (_selectedSector select 7) do {
			case 1: {_producing = localize "STR_AMMO";};
			case 2: {_producing = localize "STR_FUEL";};
			default {_producing = localize "STR_MANPOWER";};
		};

		_storagespace = format ["%1 / %2",_crateCount,_crateMax];
		_productiontime = format [localize "STR_PRODUCTION_MINUTES",(_selectedSector select 8)];

		((findDisplay 758001) displayCtrl 7580015) ctrlSetText _producing;
		((findDisplay 758001) displayCtrl 7580015) ctrlSetTextColor _color_neutral;
		((findDisplay 758001) displayCtrl 7580016) ctrlSetText _storagespace;
		((findDisplay 758001) displayCtrl 7580016) ctrlSetTextColor _color_actual;
		((findDisplay 758001) displayCtrl 7580017) ctrlSetText _productiontime;
		((findDisplay 758001) displayCtrl 7580017) ctrlSetTextColor _color_neutral;
		_color_actual = _color_neutral;
	} else {
		_producing = localize "STR_PRODUCTION_NOTHING";
		_storagespace = localize "STR_PRODUCTION_NOSTORAGE";
		_productiontime = localize "STR_PRODUCTION_NOTIMER";
		((findDisplay 758001) displayCtrl 7580015) ctrlSetText _producing;
		((findDisplay 758001) displayCtrl 7580015) ctrlSetTextColor _color_negative;
		((findDisplay 758001) displayCtrl 7580016) ctrlSetText _storagespace;
		((findDisplay 758001) displayCtrl 7580016) ctrlSetTextColor _color_negative;
		((findDisplay 758001) displayCtrl 7580017) ctrlSetText _productiontime;
		((findDisplay 758001) displayCtrl 7580017) ctrlSetTextColor _color_negative;
	};

	switch (_selectedSector select 2) do {
		case 1: {
			((findDisplay 758001) displayCtrl 7580018) ctrlSetTextColor _color_positive;
			((findDisplay 758001) displayCtrl 7580019) ctrlSetTextColor _color_positive;
			((findDisplay 758001) displayCtrl 7580020) ctrlSetTextColor _color_positive;
		};
		default {
			if (_selectedSector select 4) then {_color_actual = _color_positive;} else {_color_actual = _color_negative;};
			((findDisplay 758001) displayCtrl 7580018) ctrlSetTextColor _color_actual;
			if (_selectedSector select 5) then {_color_actual = _color_positive;} else {_color_actual = _color_negative;};
			((findDisplay 758001) displayCtrl 7580019) ctrlSetTextColor _color_actual;
			if (_selectedSector select 6) then {_color_actual = _color_positive;} else {_color_actual = _color_negative;};
			((findDisplay 758001) displayCtrl 7580020) ctrlSetTextColor _color_actual;
			_color_actual = _color_neutral;
		};
	};

	_supplyValue = ceil ((_selectedSector select 9) / 100);
	_ammoValue = ceil ((_selectedSector select 10) / 100);
	_fuelValue = ceil ((_selectedSector select 11) / 100);

	if (_supplyValue == 1) then {_supplyValue = format [localize "STR_PRODUCTION_CRATE", _supplyValue];} else {_supplyValue = format [localize "STR_PRODUCTION_CRATES", _supplyValue];};
	if (_ammoValue == 1) then {_ammoValue = format [localize "STR_PRODUCTION_CRATE", _ammoValue];} else {_ammoValue = format [localize "STR_PRODUCTION_CRATES", _ammoValue];};
	if (_fuelValue == 1) then {_fuelValue = format [localize "STR_PRODUCTION_CRATE", _fuelValue];} else {_fuelValue = format [localize "STR_PRODUCTION_CRATES", _fuelValue];};

	((findDisplay 758001) displayCtrl 7580021) ctrlSetText _supplyValue;
	((findDisplay 758001) displayCtrl 7580022) ctrlSetText _ammoValue;
	((findDisplay 758001) displayCtrl 7580023) ctrlSetText _fuelValue;

	"spawn_marker" setMarkerPosLocal (getMarkerPos (_selectedSector select 1));
	_mapdisplay ctrlMapAnimAdd [0.5, 0.2,(getMarkerPos (_selectedSector select 1))];
	ctrlMapAnimCommit _mapdisplay;

	waitUntil {!dialog || !(alive player) || (lbCurSel 7580012) != _listselect || saveSectorSetting != 0};
};

"spawn_marker" setMarkerPosLocal markers_reset;
