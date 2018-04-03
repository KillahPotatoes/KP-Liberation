private [ "_maxdist", "_truepos", "_built_object_remote", "_pos", "_grp", "_classname", "_idx", "_unitrank", "_posfob", "_ghost_spot", "_vehicle", "_dist", "_actualdir", "_near_objects", "_near_objects_25", "_debug_colisions" ];

build_confirmed = 0;
_maxdist = GRLIB_fob_range;
_truepos = [];
_debug_colisions = false;
KP_vector = true;

GRLIB_preview_spheres = [];
while { count GRLIB_preview_spheres < 36 } do {
	GRLIB_preview_spheres pushback ( "Sign_Sphere100cm_F" createVehicleLocal [ 0, 0, 0 ] );
};

{ _x setObjectTexture [0, "#(rgb,8,8,3)color(0,1,0,1)"]; } foreach GRLIB_preview_spheres;

if (isNil "manned") then { manned = false };
if (isNil "gridmode" ) then { gridmode = 0 };
if (isNil "repeatbuild" ) then { repeatbuild = false };
if (isNil "build_rotation" ) then { build_rotation = 0 };
if (isNil "build_elevation" ) then { build_elevation = 0 }; 

waitUntil { sleep 0.2; !isNil "dobuild" };

while { true } do {
	waitUntil { sleep 0.2; dobuild != 0 };

	build_confirmed = 1;
	build_invalid = 0;
	_classname = "";
	if ( buildtype == 99 ) then {
		GRLIB_removefobboxes = true;
		_classname = FOB_typename;
	} else {
		_classname = ((build_lists select buildtype) select buildindex) select 0;
		_price_s = ((build_lists select buildtype) select buildindex) select 1;
		_price_a = ((build_lists select buildtype) select buildindex) select 2;
		_price_f = ((build_lists select buildtype) select buildindex) select 3;

		_nearfob = [] call F_getNearestFob;
		_storage_areas = [_nearfob nearobjects (GRLIB_fob_range * 2), {(_x getVariable ["KP_liberation_storage_type",-1]) == 0}] call BIS_fnc_conditionalSelect;

		[_price_s, _price_a, _price_f, _classname, buildtype, _storage_areas] remoteExec ["build_remote_call",2];
	};

	if(buildtype == 1) then {
		_pos = [(getpos player select 0) + 1,(getpos player select 1) + 1, 0];
		_grp = group player;
		if ( manned ) then {
			_grp = createGroup GRLIB_side_friendly;
		};
		_classname createUnit [_pos, _grp,"this addMPEventHandler [""MPKilled"", {_this spawn kill_manager}]", 0.5, "private"];
		build_confirmed = 0;
	} else {
		if ( buildtype == 8 ) then {
			_pos = [(getpos player select 0) + 1,(getpos player select 1) + 1, 0];
			_grp = createGroup GRLIB_side_friendly;
			_grp setGroupId [format ["%1 %2",squads_names select buildindex, groupId _grp]];
			_idx = 0;
			{
				_unitrank = "private";
				if(_idx == 0) then { _unitrank = "sergeant"; };
				if(_idx == 1) then { _unitrank = "corporal"; };
				if (_classname isEqualTo blufor_squad_para) then {
					_x createUnit [_pos, _grp,"this addMPEventHandler [""MPKilled"", {_this spawn kill_manager}]; removeBackpackGlobal this; this addBackpackGlobal ""B_parachute""", 0.5, _unitrank];
				} else {
					_x createUnit [_pos, _grp,"this addMPEventHandler [""MPKilled"", {_this spawn kill_manager}];", 0.5, _unitrank];
				};
				_idx = _idx + 1;

			} foreach _classname;
			_grp setBehaviour "SAFE";
			build_confirmed = 0;
		} else {
			_posfob = getpos player;
			if (buildtype != 99) then {
				_posfob = [] call F_getNearestFob;
			};

			_idactcancel = -1;
			_idactsnap = -1;
			_idactplacebis = -1;
			_idactvector = -1;
			if (buildtype != 99 ) then {
				_idactcancel = player addAction ["<t color='#B0FF00'>" + localize "STR_CANCEL" + "</t> <img size='2' image='res\ui_cancel.paa'/>","scripts\client\build\build_cancel.sqf","",-725,false,true,"","build_confirmed == 1"];
			};
			if (buildtype == 6 ) then {
				_idactplacebis = player addAction ["<t color='#B0FF00'>" + localize "STR_PLACEMENT_BIS" + "</t> <img size='2' image='res\ui_confirm.paa'/>","scripts\client\build\build_place_bis.sqf","",-785,false,false,"","build_invalid == 0 && build_confirmed == 1"];
			};
			if (buildtype == 6 || buildtype == 99  || _classname in KP_liberation_storage_buildings || _classname == KP_liberation_recycle_building || _classname == KP_liberation_air_vehicle_building) then {
				_idactsnap = player addAction ["<t color='#B0FF00'>" + localize "STR_GRID" + "</t>","scripts\client\build\do_grid.sqf","",-735,false,false,"","build_confirmed == 1"];
				_idactvector = player addAction ["<t color='#B0FF00'>" + localize "STR_VECACTION" + "</t>",{KP_vector = !KP_vector;},"",-800,false,false,"","build_confirmed == 1"];
			};

			_idactrotate = player addAction ["<t color='#B0FF00'>" + localize "STR_ROTATION" + "</t> <img size='2' image='res\ui_rotation.paa'/>","scripts\client\build\build_rotate.sqf","",-750,false,false,"","build_confirmed == 1"];
			_idactraise = player addAction ["<t color='#B0FF00'>" + localize "STR_RAISE" + "</t>","scripts\client\build\build_raise.sqf","",-765,false,false,"","build_confirmed == 1"];
			_idactlower = player addAction ["<t color='#B0FF00'>" + localize "STR_LOWER" + "</t>","scripts\client\build\build_lower.sqf","",-766,false,false,"","build_confirmed == 1"];
			_idactplace = player addAction ["<t color='#B0FF00'>" + localize "STR_PLACEMENT" + "</t> <img size='2' image='res\ui_confirm.paa'/>","scripts\client\build\build_place.sqf","",-775,false,true,"","build_invalid == 0 && build_confirmed == 1"];

			_ghost_spot = (getmarkerpos "ghost_spot") findEmptyPosition [0,100];

			_vehicle = _classname createVehicleLocal _ghost_spot;
			_vehicle allowdamage false;
			_vehicle setVehicleLock "LOCKED";
			_vehicle enableSimulationGlobal false;
			_vehicle setVariable ["KP_liberation_preplaced", true, true];

			_dist = 0.6 * (sizeOf _classname);
			if (_dist < 3.5) then { _dist = 3.5 };
			_dist = _dist + 1;

			for [{_i=0}, {_i<5}, {_i=_i+1}] do {
				_vehicle setObjectTextureGlobal [_i, '#(rgb,8,8,3)color(0,1,0,0.8)'];
			};

			{ _x setObjectTexture [0, "#(rgb,8,8,3)color(0,1,0,1)"]; } foreach GRLIB_preview_spheres;

			while { build_confirmed == 1 && alive player } do {
				_truedir = 90 - (getdir player);
				if ((typeOf _vehicle) in KP_liberation_static_classnames) then {
					_truepos = [((getposATL player) select 0) + (_dist * (cos _truedir)), ((getposATL player) select 1) + (_dist * (sin _truedir)),((getposATL player) select 2)];
				} else {
					_truepos = [((getpos player) select 0) + (_dist * (cos _truedir)), ((getpos player) select 1) + (_dist * (sin _truedir)),0];
				};
				_actualdir = ((getdir player) + build_rotation);
				if ( _classname == "Land_Cargo_Patrol_V1_F" || _classname == "Land_PortableLight_single_F" ) then { _actualdir = _actualdir + 180 };
				if ( _classname == FOB_typename ) then { _actualdir = _actualdir + 270 };

				while { _actualdir > 360 } do { _actualdir = _actualdir - 360 };
				while { _actualdir < 0 } do { _actualdir = _actualdir + 360 };
				if ( ((buildtype == 6) || (buildtype == 99)) && ((gridmode % 2) == 1) ) then {
					if ( _actualdir >= 22.5 && _actualdir <= 67.5 ) then { _actualdir = 45 };
					if ( _actualdir >= 67.5 && _actualdir <= 112.5 ) then { _actualdir = 90 };
					if ( _actualdir >= 112.5 && _actualdir <= 157.5 ) then { _actualdir = 135 };
					if ( _actualdir >= 157.5 && _actualdir <= 202.5 ) then { _actualdir = 180 };
					if ( _actualdir >= 202.5 && _actualdir <= 247.5 ) then { _actualdir = 225 };
					if ( _actualdir >= 247.5 && _actualdir <= 292.5 ) then { _actualdir = 270 };
					if ( _actualdir >= 292.5 && _actualdir <= 337.5 ) then { _actualdir = 315 };
					if ( _actualdir <= 22.5 || _actualdir >= 337.5 ) then { _actualdir = 0 };
				};

				_sphere_idx = 0;
				{
					_x setpos ( [ _truepos, _dist, _sphere_idx * 10 ] call BIS_fnc_relPos );
					_sphere_idx = _sphere_idx + 1;
				} foreach GRLIB_preview_spheres;

				_vehicle setdir _actualdir;
				
				_truepos = [_truepos select 0, _truepos select 1, (_truepos select 2) +  build_elevation];

				_near_objects = (_truepos nearobjects ["AllVehicles", _dist]) ;
				_near_objects = _near_objects + (_truepos nearobjects [FOB_box_typename, _dist]);
				_near_objects = _near_objects + (_truepos nearobjects [Arsenal_typename, _dist]);

				_near_objects_25 = (_truepos nearobjects ["AllVehicles", 50]) ;
				_near_objects_25 = _near_objects_25 + (_truepos nearobjects [FOB_box_typename, 50]);
				_near_objects_25 = _near_objects_25 + (_truepos nearobjects [Arsenal_typename, 50]);

				if(	buildtype != 6 ) then {
					_near_objects = _near_objects + (_truepos nearobjects ["Static", _dist]);
					_near_objects_25 = _near_objects_25 + (_truepos nearobjects ["Static", 50]);
				};

				private _remove_objects = [];
				{
					private _typeOfX = typeOf _x;
					if ((_x isKindOf "Animal") || (_typeOfX in GRLIB_ignore_colisions_when_building) || (_typeOfX isKindOf "CAManBase") || (isPlayer _x) || (_x == _vehicle) || ((typeOf _vehicle) in KP_liberation_static_classnames)) then {
						_remove_objects pushback _x;
					};
				} foreach _near_objects;

				private _remove_objects_25 = [];
				{
					private _typeOfX = typeOf _x;
					if ((_x isKindOf "Animal") || (_typeOfX in GRLIB_ignore_colisions_when_building) || (_typeOfX isKindOf "CAManBase") || (isPlayer _x) || (_x == _vehicle) || ((typeOf _vehicle) in KP_liberation_static_classnames)) then {
						_remove_objects_25 pushback _x;
					};
				} foreach _near_objects_25;

				_near_objects = _near_objects - _remove_objects;
				_near_objects_25 = _near_objects_25 - _remove_objects_25;

				if ( count _near_objects == 0 ) then {
					{
						_dist22 = 0.6 * (sizeOf (typeof _x));
						if ( _dist22 < 1 ) then { _dist22 = 1 };
						if (_truepos distance _x < _dist22) then {
							_near_objects pushback _x;
						};
					} foreach _near_objects_25;
				};

				if ( count _near_objects != 0 ) then {
					GRLIB_conflicting_objects = _near_objects;
				} else {
					GRLIB_conflicting_objects = [];
				};

				if (count _near_objects == 0 && ((_truepos distance _posfob) < _maxdist) && (  ((!surfaceIsWater _truepos) && (!surfaceIsWater getpos player)) || (_classname in boats_names) ) ) then {

					if ( ((buildtype == 6) || (buildtype == 99)) && ((gridmode % 2) == 1) ) then {
						_vehicle setpos [round (_truepos select 0),round (_truepos select 1), _truepos select 2];
					} else {
						if ((typeOf _vehicle) in KP_liberation_static_classnames) then {
							_vehicle setPosATL _truepos;
						} else {
							_vehicle setpos _truepos;
						};
					};
					if (buildtype == 6 || buildtype == 99 || _classname in KP_liberation_storage_buildings || _classname == KP_liberation_recycle_building || _classname == KP_liberation_air_vehicle_building) then {
						if (KP_vector) then {
							_vehicle setVectorUp [0,0,1];
						} else {
							_vehicle setVectorUp surfaceNormal position _vehicle;
						};
					} else {
						_vehicle setVectorUp surfaceNormal position _vehicle;
					};
					if(build_invalid == 1) then {
						GRLIB_ui_notif = "";
						{ _x setObjectTexture [0, "#(rgb,8,8,3)color(0,1,0,1)"]; } foreach GRLIB_preview_spheres;
					};
					build_invalid = 0;

				} else {
					if ( build_invalid == 0 ) then {
						{ _x setObjectTexture [0, "#(rgb,8,8,3)color(1,0,0,1)"]; } foreach GRLIB_preview_spheres;
					};
					_vehicle setpos _ghost_spot;
					build_invalid = 1;
					if(count _near_objects > 0) then {
						GRLIB_ui_notif = format [localize "STR_PLACEMENT_IMPOSSIBLE",count _near_objects, round _dist];

						if (_debug_colisions) then {
							private [ "_objs_classnames" ];
							_objs_classnames = [];
							{ _objs_classnames pushback (typeof _x) } foreach _near_objects;
							hint format [ "Colisions : %1", _objs_classnames ];
						};
					};
					if( ((surfaceIsWater _truepos) || (surfaceIsWater getpos player)) && !(_classname in boats_names)) then {
						GRLIB_ui_notif = localize "STR_BUILD_ERROR_WATER";
					};
					if((_truepos distance _posfob) > _maxdist) then {
						GRLIB_ui_notif = format [localize "STR_BUILD_ERROR_DISTANCE",_maxdist];
					};

				};
				sleep 0.05;
			};

			GRLIB_ui_notif = "";

			{ _x setpos [ 0,0,0 ] } foreach GRLIB_preview_spheres;

			if ( !alive player || build_confirmed == 3 ) then {
				private ["_price_s", "_price_a", "_price_f", "_nearfob", "_storage_areas"];
				_price_s = ((build_lists select buildtype) select buildindex) select 1;
				_price_a = ((build_lists select buildtype) select buildindex) select 2;
				_price_f = ((build_lists select buildtype) select buildindex) select 3;

				_nearfob = [] call F_getNearestFob;
				_storage_areas = [_nearfob nearobjects (GRLIB_fob_range * 2), {(_x getVariable ["KP_liberation_storage_type",-1]) == 0}] call BIS_fnc_conditionalSelect;

				_supplyCrates = ceil (_price_s / 100);
				_ammoCrates = ceil (_price_a / 100);
				_fuelCrates = ceil (_price_f / 100);
				_crateSum = _supplyCrates + _ammoCrates + _fuelCrates;

				_spaceSum = 0;

				{
					if (typeOf _x == KP_liberation_large_storage_building) then {
						_spaceSum = _spaceSum + (count KP_liberation_large_storage_positions) - (count (attachedObjects _x));
					};
					if (typeOf _x == KP_liberation_small_storage_building) then {
						_spaceSum = _spaceSum + (count KP_liberation_small_storage_positions) - (count (attachedObjects _x));
					};
				} forEach _storage_areas;

				deleteVehicle _vehicle;

				if (_spaceSum < _crateSum) then {
					hint localize "STR_CANCEL_ERROR";
				} else {
					[_price_s, _price_a, _price_f, _storage_areas] remoteExec ["cancel_build_remote_call",2];
				};
			};

			if ( build_confirmed == 2 ) then {
				_vehpos = getpos _vehicle;
				_vehdir = getdir _vehicle;
				deleteVehicle _vehicle;
				sleep 0.1;
				_vehicle = _classname createVehicle _truepos;
				_vehicle allowDamage false;
				_vehicle setdir _vehdir;
				if ((typeOf _vehicle) in KP_liberation_static_classnames) then {
					_vehicle setPosATL _truepos;
				} else {
					_vehicle setpos _truepos;
				};

				if (!(_classname in KP_liberation_ace_crates) && KP_liberation_clear_cargo) then {
					clearWeaponCargoGlobal _vehicle;
					clearMagazineCargoGlobal _vehicle;
					clearItemCargoGlobal _vehicle;
					clearBackpackCargoGlobal _vehicle;
				};
				if (buildtype == 6 || buildtype == 99 || _classname in KP_liberation_storage_buildings || _classname == KP_liberation_recycle_building || _classname == KP_liberation_air_vehicle_building) then {
					if (KP_vector) then {
						_vehicle setVectorUp [0,0,1];
					} else {
						_vehicle setVectorUp surfaceNormal position _vehicle;
					};
				} else {
					_vehicle setVectorUp surfaceNormal position _vehicle;
				};

				// Arty Supp deactivated for now
				/*if ((KP_liberation_suppMod_enb > 0) && (_classname in KP_liberation_artySupp)) then {
					[_vehicle] remoteExec ["arty_monitor", 2];
				};*/

				if ( (unitIsUAV _vehicle) || manned ) then {
					[ _vehicle ] call F_forceBluforCrew;
				};

				switch (_classname) do {
					case FOB_box_typename: {_vehicle call F_setFobMass;};
					case "Land_Medevac_house_V1_F";
					case "Land_Medevac_HQ_V1_F": {_vehicle setVariable ["ace_medical_isMedicalFacility", true, true];};
					case KP_liberation_recycle_building: {_vehicle setVariable ["ace_isRepairFacility", 1, true];};
					case "Flag_White_F": {_vehicle setFlagTexture "res\kpflag.jpg";};
					case KP_liberation_small_storage_building;
					case KP_liberation_large_storage_building: {_vehicle setVariable ["KP_liberation_storage_type", 0, true];};
					default {};
				};

				if (_classname in KP_liberation_medical_vehicles) then {
					_vehicle setVariable ["ace_medical_medicClass", 1, true];
				};

				if (_classname == "Land_HelipadSquare_F" || _classname == "Land_HelipadCircle_F" || _classname == "Land_HelipadRescue_F") then {
					{
						[_x,[[_vehicle],true]] remoteExec ["addCuratorEditableObjects",2];
					} forEach allCurators;
				};

				sleep 0.3;
				_vehicle allowDamage true;
				_vehicle setDamage 0;

				if(buildtype == 99) then {
					_vehicle addEventHandler ["HandleDamage", { 0 }];
				};

				if(buildtype != 6) then {
					_vehicle addMPEventHandler ["MPKilled", {_this spawn kill_manager}];
					{ _x addMPEventHandler ["MPKilled", {_this spawn kill_manager}]; } foreach (crew _vehicle);

				};
			};

			if ( _idactcancel != -1 ) then {
				player removeAction _idactcancel;
			};
			if ( _idactsnap != -1 ) then {
				player removeAction _idactsnap;
			};
			if ( _idactplacebis != -1 ) then {
				player removeAction _idactplacebis;
			};
			if ( _idactvector != -1 ) then {
				player removeAction _idactvector;
			};
			player removeAction _idactrotate;
			player removeAction _idactplace;
			player removeAction _idactraise;
			player removeAction _idactlower;
			
			if(buildtype == 99) then {
				_new_fob = getpos player;
				[_new_fob, false] remoteExec ["build_fob_remote_call",2];
				buildtype = 1;
			};

			build_confirmed = 0;
		};
	};

	if ( repeatbuild ) then {
		dobuild = 1;
		repeatbuild = false;
	} else {
		dobuild = 0;
	};
	manned = false;
};
