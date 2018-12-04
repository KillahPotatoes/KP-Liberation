private [ "_dialog", "_membercount", "_memberselection", "_unitname", "_selectedmember", "_cfgVehicles", "_cfgWeapons", "_primary_mags", "_secondary_mags", "_vehstring", "_nearfob", "_fobdistance", "_nearsquad", "_tempgmp", "_destpos", "_destdir", "_resupplied","_firstloop", "_squad_camera", "_targetobject", "_isvehicle" ];

GRLIB_squadaction = -1;
GRLIB_squadconfirm = -1;
_membercount = -1;
_resupplied = false;
_memberselection = -1;
_selectedmember = objNull;
_dialog = createDialog "liberation_squad";
_cfgVehicles = configFile >> "cfgVehicles";
_cfgWeapons = configFile >> "cfgWeapons";
_firstloop = true;
_isvehicle = false;

waitUntil { dialog };


_targetobject = "Sign_Sphere100cm_F" createVehicleLocal [ 0, 0, 0 ];
hideObject _targetobject;

_squad_camera = "camera" camCreate (getpos player);
_squad_camera cameraEffect ["internal","back", "rtt"];
_squad_camera camSetTarget  _targetobject;
_squad_camera camcommit 0;
"rtt" setPiPEffect [0];

while { dialog && alive player } do {

	if (  { alive _x } count (units group player) != _membercount ) then {

		_membercount = { alive _x } count (units group player);

		lbClear 101;
		{
			if ( alive _x ) then {
				_unitname =  format ["%1. ", [ _x ] call F_getUnitPositionId];
				if(isPlayer _x) then {
					if ( count (squadParams _x ) != 0) then {
						_unitname = "[" + ((squadParams _x select 0) select 0) + "] ";
					};
				};
				_unitname = _unitname + ( name _x );
				lbAdd [ 101, _unitname ];
			};
		} foreach (units group player);

		if ( _firstloop ) then {
			lbSetCurSel [ 101, 0 ];
			_firstloop = false;
		};
	};

	_selectedmember = objNull;
	if ( lbCurSel 101 != -1 && (count (units group player ) > lbCurSel 101 ) ) then {
		_selectedmember = (units group player) select (lbCurSel 101);
	};

	if ( !(isNull _selectedmember) ) then {
			"spawn_marker" setMarkerPosLocal (getpos _selectedmember);
			ctrlMapAnimClear ((findDisplay 5155) displayCtrl 100);
			((findDisplay 5155) displayCtrl 100) ctrlMapAnimAdd [0, 0.3, getpos _selectedmember];
			ctrlMapAnimCommit ((findDisplay 5155) displayCtrl 100);
	};

	if ( !(isNull _selectedmember) ) then {
		if ( _memberselection != lbCurSel 101 || _resupplied || ( ( vehicle _selectedmember == _selectedmember && _isvehicle ) || ( vehicle _selectedmember != _selectedmember && !_isvehicle ) ) ) then {
			_memberselection = lbCurSel 101;
			_resupplied = false;

			if (vehicle _selectedmember == _selectedmember) then {
				_targetobject attachTo [ _selectedmember, [0, 10, 0.05], "neck" ];
				_squad_camera attachTo [ _selectedmember, [0, 0.25, 0.05], "neck" ];
				_isvehicle = false;
			} else {
				_targetobject attachTo [ vehicle _selectedmember, [0, 20, 2]];
				_squad_camera attachTo [ vehicle _selectedmember, [0, 0, 2]];
				_isvehicle = true;
			};
			_squad_camera camcommit 0;

			_unitname = format ["%1. ", [ _selectedmember ] call F_getUnitPositionId];
			if(isPlayer _selectedmember) then {
				if ( count (squadParams _selectedmember ) != 0) then {
					_unitname = "[" + ((squadParams _selectedmember select 0) select 0) + "] ";
				};
			};
			_unitname = _unitname + ( name _selectedmember );
			ctrlSetText [ 201, _unitname];

			ctrlSetText [ 202, getText (_cfgVehicles >> (typeof _selectedmember) >> "displayName") ];
			ctrlSetText [ 203, format ["%1 %2%3", localize 'STR_HEALTH', round (100 - ((damage _selectedmember) * 100)), '%' ] ];

			((findDisplay 5155) displayCtrl 203) ctrlSetTextColor [1,1,1,1];
			if ( damage _selectedmember > 0.4 ) then { ((findDisplay 5155) displayCtrl 203) ctrlSetTextColor [1,1,0,1]; };
			if ( damage _selectedmember > 0.6 ) then { ((findDisplay 5155) displayCtrl 203) ctrlSetTextColor [1,0.5,0,1]; };
			if ( damage _selectedmember > 0.8 ) then { ((findDisplay 5155) displayCtrl 203) ctrlSetTextColor [1,0,0,1]; };

			ctrlSetText [ 204, format ["%1 %2m", localize 'STR_DISTANCE', round (player distance _selectedmember) ] ];

			if ( primaryWeapon _selectedmember != "") then {
				ctrlSetText [ 205, format ["%1: %2", localize 'STR_PRIMARY_WEAPON', getText (_cfgWeapons >> (primaryWeapon _selectedmember) >> "displayName") ] ];

				_primary_mags = 0;
				if ( count primaryWeaponMagazine _selectedmember > 0 ) then {
					_primary_mags = 1;
					{ if ( ( _x select 0 ) == ( ( primaryWeaponMagazine _selectedmember ) select 0 ) ) then { _primary_mags = _primary_mags + 1; } } foreach (magazinesAmmo _selectedmember);
				};

				ctrlSetText [ 206, format ["%1: %2", localize 'STR_AMMO', _primary_mags ] ];
			} else {
				ctrlSetText [ 205, format ["%1: %2", localize 'STR_PRIMARY_WEAPON', localize 'STR_NONE' ] ];
				ctrlSetText [ 206, format ["%1: %2", localize 'STR_AMMO', 0 ] ];
			};

			if ( secondaryWeapon _selectedmember != "") then {
				ctrlSetText [ 207, format ["%1: %2", localize 'STR_SECONDARY_WEAPON', getText (_cfgWeapons >> (secondaryWeapon _selectedmember) >> "displayName") ] ];

				_secondary_mags = 0;
				if ( count secondaryWeaponMagazine _selectedmember > 0 ) then {
					_secondary_mags = 1;
					{ if ( ( _x select 0 ) == ( ( secondaryWeaponMagazine _selectedmember ) select 0 ) ) then { _secondary_mags = _secondary_mags + 1; } } foreach (magazinesAmmo _selectedmember);
				};

				ctrlSetText [ 208, format ["%1: %2", localize 'STR_AMMO', _secondary_mags ] ];
			} else {
				ctrlSetText [ 207, format ["%1: %2", localize 'STR_SECONDARY_WEAPON', localize 'STR_NONE' ] ];
				ctrlSetText [ 208, format ["%1: %2", localize 'STR_AMMO', 0 ] ];
			};

			if ( vehicle _selectedmember == _selectedmember ) then {
				ctrlSetText [ 209, "" ];
			} else {
				_vehstring = localize 'STR_PASSENGER';
				if (driver vehicle _selectedmember == _selectedmember ) then { _vehstring = localize 'STR_DRIVER'; };
				if (gunner vehicle _selectedmember == _selectedmember ) then { _vehstring = localize 'STR_GUNNER'; };
				if (commander vehicle _selectedmember == _selectedmember ) then { _vehstring = localize 'STR_COMMANDER'; };
				_vehstring = _vehstring + format [ " (%1)", getText (_cfgVehicles >> (typeof vehicle _selectedmember) >> "displayName") ];
				ctrlSetText [ 209, _vehstring ];
			};
		};
	} else {
		{ ctrlSetText [ _x, "" ] } foreach [ 201, 202, 203, 204, 205, 206, 207, 208, 209 ];
		GRLIB_squadconfirm = -1;
		GRLIB_squadaction = -1;
	};

	if ( GRLIB_squadaction == -1 ) then {
		ctrlEnable [ 213, false ];
		ctrlEnable [ 214, false ];
		if ( !(isPlayer _selectedmember) && (vehicle _selectedmember == _selectedmember) ) then {
			ctrlEnable [ 210, true ];
			if ( leader group player == player ) then {
				ctrlEnable [ 211, true ];
			};
			ctrlEnable [ 212, true ];
		} else {
			ctrlEnable [ 210, false ];
			ctrlEnable [ 211, false ];
			ctrlEnable [ 212, false ];
		};
	} else {
		ctrlEnable [ 210, false ];
		ctrlEnable [ 211, false ];
		ctrlEnable [ 212, false ];
		ctrlEnable [ 213, true ];
		ctrlEnable [ 214, true ];
	};

	if( GRLIB_squadconfirm == 0 ) then {
		GRLIB_squadconfirm = -1;
		GRLIB_squadaction = -1;
	};

	if ( GRLIB_squadconfirm == 1 ) then {
		GRLIB_squadconfirm = -1;

		if ( GRLIB_squadaction == 1 ) then {

			_nearfob = [ getpos _selectedmember ] call F_getNearestFob;
			_fobdistance = 9999;
			if ( count _nearfob == 3 ) then {
				_fobdistance = _selectedmember distance _nearfob;
			};

			_nearsquad = ( (getpos _selectedmember) nearEntities [ ai_resupply_sources , 30 ] );

			if ( _fobdistance < 100 || count _nearsquad > 0 ) then {

				_tempgmp = createGroup [GRLIB_side_friendly, true];
				(typeof _selectedmember) createUnit [ markers_reset, _tempgmp,''];
				[ (units _tempgmp) select 0, _selectedmember ] call F_swapInventory;
				deleteVehicle ((units _tempgmp) select 0);
				_selectedmember setDamage 0;

				hint localize 'STR_RESUPPLY_OK';
				_resupplied = true;
			} else {
				hint localize 'STR_RESUPPLY_KO';
			};
		};

		if (GRLIB_squadaction == 2) then {
			deleteVehicle _selectedmember;
			_resupplied = true;
			hint localize 'STR_REMOVE_OK';
		};

		if (GRLIB_squadaction == 3) then {

			closeDialog 0;

			if ( primaryWeapon player == "" && secondaryWeapon player == "" ) then {
				[ _selectedmember, player ] call F_swapInventory;
			};

			_destpos = getposATL _selectedmember;
			_destdir = getdir _selectedmember;

			if ( damage _selectedmember > 0.4 ) then {
				if ( damage _selectedmember < 0.7 ) then {
					player setDamage (damage _selectedmember);
				} else {
					player setDamage 0.7;
				};
			};

			deleteVehicle _selectedmember;
			sleep 0.01;

			player setPosATL _destpos;
			player setDir _destdir;

			sleep 0.01;

			[ localize 'STR_SQUAD_DEPLOY' ] spawn spawn_camera;

		};

		GRLIB_squadaction = -1;

	};

	sleep 0.1;
};

"spawn_marker" setMarkerPosLocal markers_reset;
_squad_camera cameraEffect ["terminate","back"];
camDestroy _squad_camera;
deleteVehicle _targetobject;