RYD_AngTowards = 
	{
	private ["_source0", "_target0", "_rnd0","_dX0","_dY0","_angleAzimuth0"];

	_source0 = _this select 0;
	_target0 = _this select 1;
	_rnd0 = _this select 2;

	_dX0 = (_target0 select 0) - (_source0 select 0);
	_dY0 = (_target0 select 1) - (_source0 select 1);

	_angleAzimuth0 = (_dX0 atan2 _dY0) + (random (2 * _rnd0)) - _rnd0;

	_angleAzimuth0
	};

RYD_PosTowards2D = 
	{
	private ["_source","_distT","_angle","_dXb","_dYb","_px","_py","_pz"];

	_source = _this select 0;
	_angle = _this select 1;
	_distT = _this select 2;

	_dXb = _distT * (sin _angle);
	_dYb = _distT * (cos _angle);

	_px = (_source select 0) + _dXb;
	_py = (_source select 1) + _dYb;

	_pz = getTerrainHeightASL [_px,_py];

	[_px,_py,_pz]
	};

RYD_ArtyPrep = 
	{
	private ["_arty","_amount","_vh","_handled","_magTypes","_mags","_tp","_cnt"];	

	_arty = _this select 0;
	_amount = _this select 1;
	
	_amount = ceil _amount;
	//if (_amount < 2) exitWith {};

		{		
			{
			_vh = vehicle _x;
			_handled = _vh getVariable ["RydFFEArtyAmmoHandled",false];
			
			if not (_handled) then
				{
				_vh setVariable ["RydFFEArtyAmmoHandled",true];
				
				_vh addEventHandler ["Fired",
					{
					(_this select 0) setVariable ["RydFFE_ShotFired",true];
					(_this select 0) setVariable ["RydFFE_ShotFired2",((_this select 0) getVariable ["RydFFE_ShotFired2",0]) + 1];
					
					//if ((RydFFE_SVStart) and (RydFFE_Debug)) then
						//{
						_shells = missionNameSpace getVariable ["RydFFE_FiredShells",[]];
						_shells set [(count _shells),(_this select 6)];
						missionNameSpace setVariable ["RydFFE_FiredShells",_shells];
						//}
					}];
				
				_magTypes = getArtilleryAmmo [_vh];
				_mags = magazines _vh;
				
					{
					_tp = _x;
					_cnt = {_x in [_tp]} count _mags;
					_vh addMagazines [_tp, _cnt * (_amount - 1)];
					}
				foreach _magTypes
				}
			}
		foreach (units _x)
		}
	foreach _arty;
	};

RYD_CFF_TGT = 
	{//_tgt = [RydFFE_KnEnemies] call RYD_CFF_TGT;
	private ["_enemies","_targets","_target","_nothing","_potential","_potL","_taken","_candidate","_CL","_vehFactor","_artFactor","_crowdFactor","_veh","_nearImp","_ValMax","_trgValS",
	"_temptation","_vh","_HQfactor","_nearCiv"];

	_enemies = _this select 0;

	_targets = [];
	_target = objNull;
	_temptation = 0;
	_nothing = 0;

		{
		_potential = _x;
		
		_potL = vehicle (leader _potential);
		_taken = (group _potential) getVariable ["CFF_Taken",false];

		if not (isNull _potential) then
			{
			if (alive _potential) then
				{
				if not (_taken) then
					{
					if (((getposATL _potL) select 2) < 20) then
						{ 
						if ((abs(speed _potL)) < 50) then
							{ 
							if ((count (weapons (leader _potential))) > 0) then
								{ 
								if not ((leader _potential) isKindOf "civilian") then 
									{
									if not (captive _potL) then
										{
										if not (_potential in _targets) then
											{
											if ((damage _potL) < 0.9) then 
												{
												_targets set [(count _targets),_potential]
												}
											}
										}
									}
								}
							}
						}
					}
				}
			}
		}
	foreach _enemies;

		{
		_candidate = _x;
		_CL = leader _candidate;

		_temptation = 0;
		_vehFactor = 0;
		_artFactor = 1;
		_crowdFactor = 1;
		_HQFactor = 1;
		_veh = ObjNull;

		if not (isNull (assignedVehicle _CL)) then {_veh = assignedVehicle _CL};
		if not ((vehicle _CL) == _CL) then 
			{
			_veh = vehicle _CL;
			if ((toLower (typeOf _veh)) in RydFFE_AllArty) then {_artFactor = 10} else {_vehFactor = 500 + (rating _veh)};
			};

		_nearImp = (getPosATL _CL) nearEntities [["CAManBase","AllVehicles","Strategic","WarfareBBaseStructure","Fortress"],100];
		_nearCiv = false;

			{
			if (_x isKindOf "civilian") exitWith {_nearCiv = true};
			if (((side _x) getFriend (side _CL)) >= 0.6) then 
				{
				_vh = vehicle _x;
				_crowdFactor = _crowdFactor + 0.2;
				if not (_x == _vh) then 
					{
					_crowdFactor = _crowdFactor + 0.2;
					if ((toLower (typeOf _vh)) in RydFFE_AllArty) then 
						{
						_crowdFactor = _crowdFactor + 0.2
						}
					}
				};
			}
		foreach _nearImp;
		
		if (_nearCiv) then 
			{
			_targets set [_foreachIndex,0]
			}
		else
			{

				{
				_temptation = _temptation + (250 + (rating _x));
				}
			foreach (units _candidate);

			_temptation = (((_temptation + _vehFactor)*10)/(5 + (speed _CL))) * _artFactor * _crowdFactor * _HQFactor;
			_candidate setVariable ["CFF_Temptation",_temptation]
			}
		}
	foreach _targets;
	
	_targets = _targets - [0];

	_ValMax = 0;

		{
		_trgValS = _x getVariable ["CFF_Temptation",0];
		if ((_ValMax < _trgValS) and (random 100 < 85)) then {_ValMax = _trgValS;_target = _x};
		}
	foreach _targets;

	if (isNull _target) then 
		{
		if not ((count _targets) == 0) then 
			{
			_target = _targets select (floor (random (count _targets)))
			} 
		else 
			{
			_nothing = 1
			}
		};

	_target
	};

RYD_ArtyMission = 
	{//_bArr = [_tgtPos,RydFFE_ArtG,"SADARM",6,leaderHQ] call RYD_ArtyMission;
	private ["_pos","_arty","_ammoG","_amount","_FO","_ammo","_possible","_battery","_agp","_artyAv","_vehs","_gp","_hasAmmo","_checked","_vh","_tp","_inRange","_pX","_pY","_pZ","_ammoArr","_allAmmo"];

	_pos = _this select 0;
	_arty = _this select 1;
	_ammoG = _this select 2;
	_amount = _this select 3;
	_FO = _this select 4;
	
	_ammo = "";
	_ammoArr = [];

	_hasAmmo = 0;
	_possible = false;
	_battery = [];
	_agp = [];

	_artyAv = [];
	_vehs = 0;
	_allAmmo = 0;

		{
		_gp = _x; 
		if not (isNull _gp) then
			{
			if not (_gp getVariable ["RydFFE_BatteryBusy",false]) then
				{
				_hasAmmo = 0;
				_checked = [];
				
					{
					_vh = vehicle _x;
					if not (_vh in _checked) then
						{
						_checked set [(count _checked),_vh];
											
						_tp = toLower (typeOf _vh);
						
						switch (true) do
							{
							case (_tp in RydFFE_Mortar) : 
								{
								switch (_ammoG) do
									{
									case ("HE") : {_ammo = "8Rnd_82mm_Mo_shells"};
									case ("SPECIAL") : {_ammo = "8Rnd_82mm_Mo_shells"};
									case ("SECONDARY") : {_ammo = "8Rnd_82mm_Mo_shells"};
									case ("SMOKE") : {_ammo = "8Rnd_82mm_Mo_Smoke_white"};
									case ("ILLUM") : {_ammo = "8Rnd_82mm_Mo_Flare_white"};
									}
								};
								
							case (_tp in RydFFE_SPMortar) : 
								{
								_side = configfile >> "CfgVehicles" >> _tp >> "side";
								if ((not (isNumber _side)) or {not ((getNumber _side) == 0)}) then
									{
									switch (_ammoG) do
										{
										case ("HE") : {_ammo = "32Rnd_155mm_Mo_shells"};
										case ("SPECIAL") : {_ammo = "2Rnd_155mm_Mo_Cluster"};
										case ("SECONDARY") : {_ammo = "2Rnd_155mm_Mo_guided"};
										case ("SMOKE") : {_ammo = "6Rnd_155mm_Mo_smoke"};
										case ("ILLUM") : {_ammo = ""};
										};
									}
								else
									{
									switch (_ammoG) do
										{
										case ("HE") : {_ammo = "32Rnd_155mm_Mo_shells_O"};
										case ("SPECIAL") : {_ammo = "2Rnd_155mm_Mo_Cluster_O"};
										case ("SECONDARY") : {_ammo = "2Rnd_155mm_Mo_guided_O"};
										case ("SMOKE") : {_ammo = "6Rnd_155mm_Mo_smoke_O"};
										case ("ILLUM") : {_ammo = ""};
										};
									}
								};
										
							case (_tp in RydFFE_Rocket) :
								{
								switch (_ammoG) do
									{
									case ("HE") : {_ammo = "12Rnd_230mm_rockets"};
									case ("SPECIAL") : {_ammo = "12Rnd_230mm_rockets"};
									case ("SECONDARY") : {_ammo = "12Rnd_230mm_rockets"};
									case ("SMOKE") : {_ammo = ""};
									case ("ILLUM") : {_ammo = ""};
									};
								};
								
							default
								{
								if ((count RydFFE_Other) > 0) then
									{
									_arr = [];
									
										{
										if (_tp in (_x select 0)) exitWith {_arr = _x select 1}
										}
									foreach RydFFE_Other;
									
									if ((count _arr) > 0) then
										{
										switch (_ammoG) do
											{
											case ("HE") : {_ammo = _arr select 0};
											case ("SPECIAL") : {_ammo = _arr select 1};
											case ("SECONDARY") : {_ammo = _arr select 2};
											case ("SMOKE") : {_ammo = _arr select 3};
											case ("ILLUM") : {_ammo = _arr select 4};
											}
										}
									}						
								}
							};
														
						_inRange = _pos inRangeOfArtillery [[_vh],_ammo];
												
						if (_inRange) then
							{
								{
								if ((_x select 0) in [_ammo]) then
									{
									_hasAmmo = _hasAmmo + (_x select 1);
									_allAmmo = _allAmmo + (_x select 1);
									_ammoArr set [(count _ammoArr),_ammo];
									_vehs = _vehs + 1
									};
									
								if not (_hasAmmo < _amount) exitWith {};
								if not (_allAmmo < _amount) exitWith {}
								}
							foreach (magazinesAmmo _vh);
							}
						};

					if not (_vehs < _amount) exitWith {}
					}
				foreach (units _gp);

				if (_hasAmmo > 0) then
					{
					_artyAv set [(count _artyAv),_gp];
					_agp set [(count _agp),leader _gp]
					}
				}
			};
			
		if not (_hasAmmo < _amount) exitWith {};
		if not (_allAmmo < _amount) exitWith {}
		}
	foreach _arty;
	
	if not ((count _artyAv) == 0) then
		{
		_battery = _artyAv;

		_possible = true;

		if (_ammoG in ["ILLUM","SMOKE"]) then
			{
				{
				if not (isNull _x) then
					{
					_x setVariable ["RydFFE_BatteryBusy",true]
					}
				}
			foreach _battery;

			_pX = _pos select 0;
			_pY = _pos select 1;
			_pZ = _pos select 2;

			_pX = _pX + (random 100) - 50;
			_pY = _pY + (random 100) - 50;
			_pZ = _pZ + (random 20) - 10;

			_pos = [_pX,_pY,_pZ];
//_i = [_pos,(random 1000),"markArty","ColorRed","ICON","mil_dot",_ammoG,"",[0.75,0.75]] call RYD_Mark;
			[_battery,_pos,_ammoArr,_FO,_amount,_ammoG] spawn
				{
				_battery = _this select 0;
				_pos = _this select 1;
				_ammo = _this select 2;
				_FO = getPosASL (_this select 3);
				_amount = _this select 4;
				_ammoG = _this select 5;

				if (_ammoG == "ILLUM") then 
					{
					[_battery,_pos,_ammo,_amount] call RYD_CFF_Fire;
					}
				else
					{
					_angle = [_FO,_pos,10] call RYD_AngTowards;
					_pos2 = [_pos,_angle + 110,200 + (random 100) - 50] call RYD_PosTowards2D;
					_pos3 = [_pos,_angle - 110,200 + (random 100) - 50] call RYD_PosTowards2D;
					//_i2 = [_pos2,(random 1000),"markArty","ColorRed","ICON","mil_dot",_ammoG,"",[0.75,0.75]] call RYD_Mark;
					//_i3 = [_pos3,(random 1000),"markArty","ColorRed","ICON","mil_dot",_ammoG,"",[0.75,0.75]] call RYD_Mark;

						{
						[_battery,_x,_ammo,ceil (_amount/3)] call RYD_CFF_Fire;
								
						_ct = 0;
						waitUntil 
							{
							sleep 0.1;
							_ct = _ct + 0.1;
							_busy = 0; 
							
								{
								if not (isNull _x) then
									{
									_busy = _busy + ({not ((vehicle _x) getVariable ["RydFFE_GunFree",true])} count (units _x))
									};
								}
							foreach _battery;
							
							((_busy == 0) or (_ct > 12))
							};
						}
					foreach [_pos,_pos2,_pos3]
					};
					
				_ct = 0;
				waitUntil 
					{
					sleep 0.1;
					_ct = _ct + 0.1;
					_busy = 0; 
					
						{
						if not (isNull _x) then
							{
							_add = {not ((vehicle _x) getVariable ["RydFFE_GunFree",true])} count (units _x);
							_busy = _busy + _add;
							if (_add == 0) then {_x setVariable ["RydFFE_BatteryBusy",false]}
							};
						}
					foreach _battery;
					
					((_busy == 0) or (_ct > 12))
					};
										
					{
					if not (isNull _x) then
						{
						_x setVariable ["RydFFE_BatteryBusy",false]
						}
					}
				foreach _battery
				}
			}
		};

	//diag_log format ["AM: %1",[_possible,_battery,_agp,_ammoArr]];

	[_possible,_battery,_agp,_ammoArr,_allAmmo]
	};
	
RYD_CFF_FFE = 
	{//[_battery,_tgt,_batlead,"SADARM",RydFFE_Friends,RydFFE_Debug] spawn RYD_CFF_FFE
	private ["_battery","_target","_batlead","_Ammo","_friends","_Debug","_ammoG","_batname","_first","_phaseF","_targlead","_againF","_dispF","_accF","_amount","_Rate","_FMType","_againcheck","_Aunit",
	"_RydAccF","_TTI","_amount1","_amount2","_template","_targetPos","_X0","_Y0","_X1","_Y1","_X2","_Y2","_Xav","_Yav","_transspeed","_transdir","_Xhd","_Yhd","_impactpos","_safebase","_distance",
	"_safe","_safecheck","_gauss1","_gauss09","_gauss04","_gauss2","_distance2","_DdistF","_DdamageF","_DweatherF","_DskillF","_anotherD","_Dreduct","_spawndisp","_dispersion","_disp","_RydAccF",
	"_gauss1b","_gauss2b","_AdistF","_AweatherF","_AdamageF","_AskillF","_Areduct","_spotterF","_anotherA","_acc","_finalimpact","_posX","_posY","_i","_dX","_dY","_angle","_dXb","_dYb","_posX2",
	"_posY2","_AmmoN","_exDst","_exPX","_exPY","_onRoad","_exPos","_nR","_stRS","_dMin","_dAct","_dSum","_checkedRS","_RSArr","_angle","_rPos","_actRS","_ammocheck","_artyGp","_ammoCount","_dstAct",
	"_maxRange","_minRange","_isTaken","_batlead","_alive","_waitFor","_UL","_ammoC","_add","_myFO","_assumedPos","_eta"];	

	_battery = _this select 0;
	_target = _this select 1;
	_batlead = _this select 2;
	_Ammo = _this select 3;
	_friends = _this select 4;
	_Debug = _this select 5;
	_ammoG = _this select 6;
	_amount = _this select 7;
	
	_myFO = _target getVariable ["RydFFE_MyFO",objNull];
	_assumedPos = (getPosATL _target);
	if not (isNull _myFO) then
		{
		_assumedPos = _myFO getHideFrom _target;
		};
		
	_markers = [];
	
	_battery1 = _battery select 0;
	
	_batLead1 = leader _battery1;

	_batname = str _battery1;

	//_first = _battery getVariable [("FIRST" + _batname),1];

	//_artyGp = group _batlead;

	_isTaken = (group _target) getVariable ["CFF_Taken",false];
	if ((_isTaken) and (RydFFE_Monogamy)) exitWith 
		{
			{
			if not (isNull _x) then
				{
				_x setVariable ["RydFFE_BatteryBusy",false]
				}
			}
		foreach _battery
		};
		
	(group _target) setVariable ["CFF_Taken",true];

	_phaseF = [1,2];
	if ((RydFFE_OnePhase) or ((count RydFFE_FO) == 0) and not (RydFFE_2PhWithoutFO)) then {_phaseF = [1]};

	_targlead = vehicle (leader _target);

	_waitFor = true;
	
	_amount1 = ceil (_amount/6);
	_amount2 = _amount - _amount1;

		{
		if (isNil ("_myFO")) exitwith {_waitFor = false};
		if (isNull _myFO) exitwith {_waitFor = false};
		if not (alive _myFO) exitwith {_waitFor = false};
		
		if (isNil ("_target")) exitwith {_waitFor = false};
		if (isNull _target) exitwith {_waitFor = false};
		if not (alive _target) exitwith {_waitFor = false};
		
		if (({not (isNull _x)} count _batlead) < 1) exitwith {_waitFor = false};
		if (isNull _battery1) exitWith {_waitFor = false};
		if (({(alive _x)} count _batlead) < 1)  exitwith {_waitFor = false};

		if ((abs (speed _target)) > 50) exitWith {_waitFor = false};
		if ((_assumedPos select 2) > 20)  exitWith {_waitFor = false};
		
		if ((_assumedPos distance [0,0,0]) == 0) exitWith {_waitFor = false};
		
		_againF = 0.85;
		_accF = RydFFE_Acc;

		_againcheck = _battery1 getVariable [("CFF_Trg" + _batname),objNull];
		if not ((str _againcheck) == (str _target)) then {_againF = 1};

		_RydAccF = 1;

		//if (isNil ("RydFFE_Amount")) then {_amount = _this select 7} else {_amount = RydFFE_Amount};
		//if (isNil ("RydFFE_Acc")) then {_accF = 2} else {_accF = RydFFE_Acc};

		//if (_ammoG in ["SPECIAL","SECONDARY"]) then {_amount = ceil (_amount/3)};

		if ((count _phaseF) == 2) then
			{
			if (_x == 1) then
				{
				_amount = _amount1
				}
			else
				{
				_amount = _amount2
				}
			};

		if (_amount == 0) exitwith {_waitFor = false};

		if not (isNull _myFO) then
			{
			_assumedPos = _myFO getHideFrom _target;
			};
			
		if ((_assumedPos distance [0,0,0]) == 0) exitWith {_waitFor = false};

		_targetPosATL = _assumedPos;
		_targetPos = ATLtoASL _assumedPos;
		
		_eta = -1;
		
			{
				{
				_vh = vehicle _x;
				_vhMags = magazines _vh; 
				if (not (_vh isEqualTo _x) and {(count _vhMags) > 0}) then
					{
					_ammoC = _vhMags select 0;
					
						{
						if (_x in _ammo) exitWith
							{
							_ammoC = _x
							}
						}
					foreach _vhMags;
					
					_newEta = _vh getArtilleryETA [_targetPosATL,_ammoC];
					
					if (not (isNil "_newEta") and {((_newEta < _eta) or (_eta < 0))}) then
						{
						_eta = _newEta
						}
					}
				}
			foreach (units _x)
			}
		foreach _battery;
		
		if (_eta == -1) exitWith {_waitFor = false};

		_X0 = (_targetpos select 0);
		_Y0 = (_targetpos select 1);
		
		sleep 10;
		
		if (isNil ("_myFO")) exitwith {_waitFor = false};
		if (isNull _myFO) exitwith {_waitFor = false};
		if not (alive _myFO) exitwith {_waitFor = false};

		if (isNull _target) exitwith {_waitFor = false};
		if not (alive _target) exitwith {_waitFor = false};
		
		if (({not (isNull _x)} count _batlead) < 1) exitwith {_waitFor = false};
		if (isNull _battery1) exitWith {_waitFor = false};
		if (({(alive _x)} count _batlead) < 1)  exitwith {_waitFor = false};

		if ((abs (speed _target)) > 50) exitWith {_waitFor = false};
		if ((_assumedPos select 2) > 20)  exitWith {_waitFor = false};

		if not (isNull _myFO) then
			{
			_assumedPos = _myFO getHideFrom _target;
			};
			
		if ((_assumedPos distance [0,0,0]) == 0) exitWith {_waitFor = false};

		_targetPos = ATLtoASL _assumedPos;
		
		_X1 = (_targetpos select 0);
		_Y1 = (_targetpos select 1);
		
		sleep 10;

		if (isNil ("_myFO")) exitwith {_waitFor = false};
		if (isNull _myFO) exitwith {_waitFor = false};
		if not (alive _myFO) exitwith {_waitFor = false};

		if (isNull _target) exitwith {_waitFor = false};
		if not (alive _target) exitwith {_waitFor = false};
		
		if (({not (isNull _x)} count _batlead) < 1) exitwith {_waitFor = false};
		if (isNull _battery1) exitWith {_waitFor = false};
		if (({(alive _x)} count _batlead) < 1)  exitwith {_waitFor = false};

		if ((abs (speed _target)) > 50) exitWith {_waitFor = false};
		if ((_assumedPos select 2) > 20)  exitWith {_waitFor = false};

		if not (isNull _myFO) then
			{
			_assumedPos = _myFO getHideFrom _target;
			};
			
		if ((_assumedPos distance [0,0,0]) == 0) exitWith {_waitFor = false};

		_targetPos = ATLtoASL _assumedPos;
		
		_X2 = (_targetpos select 0);
		_Y2 = (_targetpos select 1);

		_onRoad = isOnRoad _targlead;

		_Xav = (_X1+_X2)/2;
		_Yav = (_Y1+_Y2)/2;

		_transspeed = ([_X0,_Y0] distance [_Xav,_Yav])/15;
		_transdir = (_Xav - _X0) atan2 (_Yav - _Y0);
		
		_add = 16/(1 + (_transspeed));

		_Xhd = _transspeed * (sin _transdir) * (_eta + _add);
		_Yhd = _transspeed * (cos _transdir) * (_eta + _add);
		_impactpos = _targetpos;
		_safebase = 100;

		_exPX = (_targetPos select 0) + _Xhd;
		_exPY = (_targetPos select 1) + _Yhd;

		_exPos = [_exPX,_exPY,getTerrainHeightASL [_exPX,_exPY]];
		_exTargetPosATL = ASLtoATL _exPos;
		
		_eta = -1;
		
			{
				{
				_vh = vehicle _x;
				_vhMags = magazines _vh; 
				if (not (_vh isEqualTo _x) and {(count _vhMags) > 0}) then
					{
					_ammoC = _vhMags select 0;
					
						{
						if (_x in _ammo) exitWith
							{
							_ammoC = _x
							}
						}
					foreach _vhMags;
					
					_newEta = _vh getArtilleryETA [_exTargetPosATL,_ammoC];
					
					if (not (isNil "_newEta") and {((_newEta < _eta) or (_eta < 0))}) then
						{
						_eta = _newEta
						}
					}
				}
			foreach (units _x)
			}
		foreach _battery;
		
		if (_eta == -1) exitWith {_waitFor = false};
		
		_Xhd = _transspeed * (sin _transdir) * (_eta + _add);
		_Yhd = _transspeed * (cos _transdir) * (_eta + _add);

		_exPX = (_targetPos select 0) + _Xhd;
		_exPY = (_targetPos select 1) + _Yhd;

		_exPos = [_exPX,_exPY,getTerrainHeightASL [_exPX,_exPY]];

		_exDst = _targetPos distance _exPos;

		if (isNil ("RydFFE_Safe")) then {_safebase = 100} else {_safebase = RydFFE_Safe};

		_safe = _safebase * _RydAccf * (1 + overcast);

		_safecheck = true;

		if not (_onRoad) then
			{
				{
				if (([(_impactpos select 0) + _Xhd, (_impactpos select 1) + _Yhd] distance (vehicle (leader _x))) < _safe) exitwith 
						{
						_Xhd = _Xhd/2;
						_Yhd = _Yhd/2
						}
				}
			foreach _friends;

				{
				if ([(_impactpos select 0) + _Xhd, (_impactpos select 1) + _Yhd] distance (vehicle (leader _x)) < _safe) exitwith {_safecheck = false};
				}
			foreach _friends;

			if not (_safecheck) then 
				{
				_Xhd = _Xhd/2;
				_Yhd = _Yhd/2;
				_safecheck = true;
					{
					if ([(_impactpos select 0) + _Xhd, (_impactpos select 1) + _Yhd] distance (vehicle (leader _x)) < _safe) exitwith {_safecheck = false};
					}
				foreach _friends;
				if not (_safecheck) then 
					{
					_Xhd = _Xhd/5;
					_Yhd = _Yhd/5;
					_safecheck = true;
						{
						if ([(_impactpos select 0) + _Xhd, (_impactpos select 1) + _Yhd] distance (vehicle (leader _x)) < _safe) exitwith {_safecheck = false};
						}
					foreach _friends
					}
				};

			_impactpos = [(_targetpos select 0) + _Xhd, (_targetpos select 1) + _Yhd];
			}
		else
			{
			_nR = _targlead nearRoads 30;

			_stRS = _nR select 0;
			_dMin = _stRS distance _exPos;

				{
				_dAct = _x distance _exPos;
				if (_dAct < _dMin) then {_dMin = _dAct;_stRS = _x}
				}
			foreach _nR;

			_dSum = _assumedPos distance _stRS;
			_checkedRS = [_stRS];
			_actRS = _stRS;

			while {_dSum < _exDst} do
				{
				_RSArr = (roadsConnectedTo _actRS) - _checkedRS;
				if ((count _RSArr) == 0) exitWith {};
				_stRS = _RSArr select 0;
				_dMin = _stRS distance _exPos;

					{
					_dAct = _x distance _exPos;
					if (_dAct < _dMin) then {_dMin = _dAct;_stRS = _x}
					}
				foreach _RSArr;

				_dSum = _dSum + (_stRS distance _actRS);

				_actRS = _stRS;

				_checkedRS set [(count _checkedRS),_stRS];
				};

			if (_dSum < _exDst) then
				{
				//if (_transdir < 0) then {_transdir = _transdir + 360};
				_angle = [_targetPos,(getPosASL _stRS),1] call RYD_AngTowards;
				_impactPos = [(getPosASL _stRS),_angle,(_exDst - _dSum)] call RYD_PosTowards2D
				}
			else
				{
				_rPos = getPosASL _stRS;
				_impactPos = [_rPos select 0,_rPos select 1]
				};
			
				{
				if ((_impactpos distance (vehicle (leader _x))) < _safe) exitwith 
					{
					_safeCheck = false;
					_impactpos = [((_impactpos select 0) + (_targetPos select 0))/2,((_impactpos select 1) + (_targetPos select 1))/2]
					}
				}
			foreach _friends
			};

		if not (_safeCheck) then
			{
			_safeCheck = true;

				{
				if ((_impactpos distance (vehicle (leader _x))) < _safe) exitwith 
					{
					_safeCheck = false
					}
				}
			foreach _friends
			};

		if not (_safecheck) exitwith {(group _target) setVariable ["CFF_Taken",false];_waitFor = false};
						
		_distance2 = _impactPos distance (getPosATL (vehicle _batlead1));
		_DweatherF = 1 + overcast;
		_gauss09 = (random 0.09) + (random 0.09) + (random 0.09) + (random 0.09) + (random 0.09) + (random 0.09) + (random 0.09) + (random 0.09) +  (random 0.09) + (random 0.09);

		//_gauss1 = (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) +  (random 0.1) + (random 0.1);
		//_gauss04 = (random 0.04) + (random 0.04) + (random 0.04) + (random 0.04) + (random 0.04) + (random 0.04) + (random 0.04) + (random 0.04) +  (random 0.04) + (random 0.04);
		//_gauss2 = (random 0.2) + (random 0.2) + (random 0.2) + (random 0.2) + (random 0.2) + (random 0.2) + (random 0.2) + (random 0.2) +  (random 0.2) + (random 0.2);
		//_DdistF = (_distance2/10) * (0.1 + _gauss04);
		//_DdamageF = 1 + 0.5 * (damage _batlead1);
		//_DskillF = 2 * (skill _batlead1);
		//_anotherD = 1 + _gauss1;
		//_Dreduct = (1 + _gauss2) + _DskillF;
		 
		//_spawndisp = _dispF * ((_RydAccf * _DdistF * _DdamageF) + (50 * _DweatherF * _anotherD)) / _Dreduct;
		//_dispersion = 10000 * (_spawndisp atan2 _distance2) / 57.3;

		//_disp = _dispersion;
		//if (isNil ("RydFFE_SpawnM")) then {_disp = _dispersion} else {_disp = _spawndisp};

		//[_battery,_disp] call BIS_ARTY_F_SetDispersion;
		
		_RydAccF = 1;

		_gauss1b = (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) +  (random 0.1) + (random 0.1);
		_gauss2b = (random 0.2) + (random 0.2) + (random 0.2) + (random 0.2) + (random 0.2) + (random 0.2) + (random 0.2) + (random 0.2) +  (random 0.2) + (random 0.2);
		_AdistF = (_distance2/10) * (0.1 + _gauss09);
		_AweatherF = _DweatherF;
		_AdamageF = 1 + 0.1 * (damage (vehicle _batlead1));
		_AskillF = 5 * (_batlead1 skill "aimingAccuracy");
		_Areduct = (1 + _gauss2b) + _AskillF;
		_spotterF = 0.2 + (random 0.2);
		_anotherA = 1 + _gauss1b;
		if not (isNil ("RydFFE_FOAccGain")) then {_spotterF = RydFFE_FOAccGain + (random 0.2)};
		if (((count _phaseF) == 2) and (_x == 1) or ((count _phaseF) == 1)) then {_spotterF = 1};

		_acc = _spotterF * _againF * _accF * ((_AdistF * _AdamageF) + (50 * _AweatherF * _anotherA)) / _Areduct;

		_finalimpact = [(_impactpos select 0) + (random (2 * _acc)) - _acc,(_impactpos select 1) + (random (2 * _acc)) - _acc];

		if not (isNull _myFO) then
			{
			_assumedPos = _myFO getHideFrom _target;
			};

		if (isNull _target) exitwith {_waitFor = false};
		if not (alive _target) exitwith {_waitFor = false};
		
		if (({not (isNull _x)} count _batlead) < 1) exitwith {_waitFor = false};
		if (isNull _battery1) exitWith {_waitFor = false};
		if (({(alive _x)} count _batlead) < 1)  exitwith {_waitFor = false};

		if ((abs (speed _target)) > 50) exitWith {_waitFor = false};
		if ((_assumedPos select 2) > 20) exitWith {_waitFor = false};

		//_dstAct = _impactpos vectorDistance _batlead;
		
			{
			if not (isNull _x) then
				{
					{
					(vehicle _x) setVariable ["RydFFE_ShotFired",false]
					}
				foreach (units _x)
				};
			}
		foreach _battery;

		sleep 0.2;
		_posX = 0;
		_posY = 0;
		
		_distance = _impactPos distance _finalimpact;
		
		(_battery select 0) setVariable ["RydFFE_Break",false];
		
		if (_Debug) then 
			{
			_posM1 = getposATL (vehicle _batlead1);
			_posM1 set [2,0];
			_impactPosM = +_impactPos;
			_impactPosM set [2,0];
			_finalimpactM = +_finalimpact;
			_finalimpactM set [2,0];
			
			_text = getText (configFile >> "CfgVehicles" >> (typeOf (vehicle _batlead1)) >> "displayName");
			_i = "markBat" + str (_battery1);
			_i = createMarker [_i,_posM1];
			_i setMarkerColor "ColorBlack";
			_i setMarkerShape "ICON";
			_i setMarkerType "mil_circle";
			_i setMarkerSize [0.4,0.4];
			_i setMarkerText ("Firing battery - " + _text);
			
			_markers pushBack _i;
			
			_distance = _impactPosM vectorDistance _finalimpactM;
			_distance2 = _impactPosM vectorDistance _posM1;
			_i = "mark0" + str (_battery1);
			_i = createMarker [_i,_impactPos];
			_i setMarkerColor "ColorBlue";
			_i setMarkerShape "ELLIPSE";
			_i setMarkerSize [_distance, _distance];
			_i setMarkerBrush "Border";
			
			_markers pushBack _i;

			_dX = (_impactPosM select 0) - (_posM1 select 0);
			_dY = (_impactPosM select 1) - (_posM1 select 1);
			_angle = _dX atan2 _dY;
			if (_angle >= 180) then {_angle = _angle - 180};
			_dXb = (_distance2/2) * (sin _angle);
			_dYb = (_distance2/2) * (cos _angle);
			_posX = (_posM1 select 0) + _dXb;
			_posY = (_posM1 select 1) + _dYb;

			_i = "mark1" + str (_battery1);
			_i = createMarker [_i,[_posX,_posY]];
			_i setMarkerColor "ColorBlack";
			_i setMarkerShape "RECTANGLE";
			_i setMarkerSize [0.5,_distance2/2];
			_i setMarkerBrush "Solid";
			_i setMarkerdir _angle;
			
			_markers pushBack _i;

			_dX = (_finalimpactM select 0) - (_impactPosM select 0);
			_dY = (_finalimpactM select 1) - (_impactPosM select 1);
			_angle = _dX atan2 _dY;
			if (_angle >= 180) then {_angle = _angle - 180};
			_dXb = (_distance/2) * (sin _angle);
			_dYb = (_distance/2) * (cos _angle);
			_posX2 = (_impactPosM select 0) + _dXb;
			_posY2 = (_impactPosM select 1) + _dYb;

			_i = "mark2" + str (_battery1);
			_i = createMarker [_i,[_posX2,_posY2]];
			_i setMarkerColor "ColorBlack";
			_i setMarkerShape "RECTANGLE";
			_i setMarkerSize [0.5,_distance/2];
			_i setMarkerBrush "Solid";
			_i setMarkerdir _angle;
			
			_markers pushBack _i;

			_i = "mark3" + str (_battery1);
			_i = createMarker [_i,_impactPosM];
			_i setMarkerColor "ColorBlack";
			_i setMarkerShape "ICON";
			_i setMarkerType "mil_dot";
			
			_markers pushBack _i;

			_i = "mark4" + str (_battery1);
			_i = createMarker [_i,_finalimpactM];
			_i setMarkerColor "ColorRed";
			_i setMarkerShape "ICON";
			_i setMarkerType "mil_dot";
			_i setMarkerText (str (round _distance) + "m" + " - ETA: " + str (round _eta) + " - " + _ammoG);
			
			_markers pushBack _i;
			
			/*_i = "mark5" + str (_battery);
			_i = createMarker [_i,_finalimpactM];
			_i setMarkerColor "ColorRedAlpha";
			_i setMarkerShape "ELLIPSE";
			_i setMarkerSize [_spawndisp,_spawndisp];*/
			};
				
		[_battery,_distance,_eta,_ammoG,_batlead,_target,_markers] spawn
			{
			private ["_mark","_battery","_distance","_eta","_Ammo","_target","_alive","_stoper","_TOF","_batlead"];

			_battery = _this select 0;
			_distance = _this select 1;
			_eta = _this select 2;
			_ammoG = _this select 3;
			_batlead = _this select 4;
			_target = _this select 5;
			_markers = _this select 6;
			
			_battery1 = _battery select 0;

			_alive = true;
			_shot = false;

			waitUntil 
				{
				sleep 0.1;
				if (({not (isNull _x)} count _batlead) < 1) then {_alive = false};
				if (isNull _battery1) then {_alive = false};
				if (({(alive _x)} count _batlead) < 1) then {_alive = false};
				if (_battery1 getVariable ["RydFFE_Break",false]) then {_alive = false};
				
					{
					if not (isNull _x) then
						{
							{
							if ((vehicle _x) getVariable ["RydFFE_ShotFired",false]) exitWith {_shot = true}
							}
						foreach (units _x)
						};
					
					if (_shot) exitWith {}
					}
				foreach _battery;
				
				((_shot) or not (_alive))
				};
				
				{
				if not (isNull _x) then
					{
						{
						(vehicle _x) setVariable ["RydFFE_ShotFired",false]
						}
					foreach (units _x)
					};
				}
			foreach _battery;

			_stoper = time;
			_TOF = 0;
			_rEta = _eta;
			_mark = "";
			
			if ((count _markers) > 0) then
				{
				_mark = _markers select ((count _markers) -1);
				};

			while {(not (_rEta < 5) and not (_TOF > 200) and (_alive))} do
				{
				if (({not (isNull _x)} count _batlead) < 1) exitWith {_alive = false};
				if (isNull _battery1) exitWith {_alive = false};
				if (({(alive _x)} count _batlead) < 1) exitWith {_alive = false};
				if (_battery1 getVariable ["RydFFE_Break",false]) exitWith {_alive = false};

				_TOF = (round (10 * (time - _stoper)))/10;
				_rEta = _eta - _TOF;
				
				if ((count _markers) > 0) then
					{
					_mark setMarkerText (str (round _distance) + "m" + " - ETA: " + str (round _rEta) + " - TOF: " + (str _TOF) + " - " + _ammoG);
					};
					
				sleep 0.1
				};

			if not (_alive) exitWith 
				{
				(group _target) setvariable ["CFF_Taken",false];
				
					{
					deleteMarker _x;
					}
				foreach _markers;
				};
				
			_battery1 setVariable ["RydFFE_SPLASH",true];

			if ((count _markers) > 0) then
				{
				_mark setMarkerText (str (round _distance) + "m"  + " - SPLASH!" + " - " + _ammoG);
				};
			};

		_eta = [_battery,_finalimpact,_ammo,_amount] call RYD_CFF_Fire;
					
		_UL = _batlead1;

		_alive = (_eta > 0);
		
		if not (_alive) then {(_battery select 0) setVariable ["RydFFE_Break",true]};

		waituntil 
			{
			sleep 1;

			_available = true;
			if (({not (isNull _x)} count _batlead) < 1) then {_alive = false};
			if (isNull _battery1) then {_alive = false};
			if (({(alive _x)} count _batlead) < 1) then {_alive = false};
						
				{
				if not (isNull _x) then
					{
						{
						if not ((vehicle _x) getVariable ["RydFFE_GunFree",true]) exitWith {_available = false}
						}
					foreach (units _x)
					};
				
				if not (_available) exitWith {}
				}
			foreach _battery;
			
			((_available) or not (_alive))
			};

		if not (_alive) exitWith {_waitFor = false};

		if (((count _phaseF) == 2) and (_x == 1)) then 
			{
			_alive = true;
			_splash = false;

			waitUntil 
				{
				sleep 1;

				if (({not (isNull _x)} count _batlead) < 1) then {_alive = false};
				if (isNull _battery1) then {_alive = false};
				if (({(alive _x)} count _batlead) < 1) then {_alive = false};
				if not (isNull _battery1) then {_splash = _battery1 getVariable ["RydFFE_SPLASH",false]};
				
				((_splash) or not (_alive))
				};
				
			if not (isNull _battery1) then {_battery1 setVariable ["RydFFE_SPLASH",false]};

			sleep 10;
			
				{
				deleteMarker _x;
				}
			foreach _markers
			};

		if not (_alive) exitWith {_waitFor = false};
		}
	foreach _phaseF;

	_battery1 setVariable [("CFF_Trg" + _batname),_target];

	_alive = true;
	_splash = false;

	if (_waitFor) then
		{
		waitUntil 
			{
			sleep 1;

			if (({not (isNull _x)} count _batlead) < 1) then {_alive = false};
			if (isNull _battery1) then {_alive = false};
			if (({(alive _x)} count _batlead) < 1) then {_alive = false};
			if not (isNull _battery1) then {_splash = _battery1 getVariable ["RydFFE_SPLASH",false]};
			
			((_splash) or not (_alive))
			};
				
		if not (isNull _battery1) then {_battery1 setVariable ["RydFFE_SPLASH",false]};

		sleep 10
		};

		{
		deleteMarker _x;
		}
	foreach _markers;

	(group _target) setVariable ["CFF_Taken",false];
	
	_alive = true;

	waitUntil 
		{
		sleep 1;

		_available = true;
		if (({not (isNull _x)} count _batlead) < 1) then {_alive = false};
		//if (isNull _battery1) then {_alive = false};
		if (({(alive _x)} count _batlead) < 1) then {_alive = false};
					
			{
			if not (isNull _x) then
				{
					{
					if not ((vehicle _x) getVariable ["RydFFE_GunFree",true]) exitWith {_available = false}
					}
				foreach (units _x)
				};
			
			if not (_available) exitWith {}
			}
		foreach _battery;
		
		((_available) or not (_alive))
		};

	//if not (_alive) exitWith {};

		{
		if not (isNull _x) then
			{
			_x setVariable ["RydFFE_BatteryBusy",false]
			}
		}
	foreach _battery
	};
	
RYD_CFF = 
	{//[RydFFE_ArtG,RydFFE_KnEnemies,(RydFFE_EnHArmor + RydFFE_EnMArmor + RydFFE_EnLArmor),RydFFE_Friends,RydFFE_Debug] call RYD_CFF;
	private ["_artG","_knEnemies","_enArmor","_friends","_Debug","_CFFMissions","_tgt","_ammo","_bArr","_possible","_amount","_amnt"];

	_artG = _this select 0;
	_knEnemies = _this select 1;
	_enArmor = _this select 2;
	_friends = _this select 3;
	_Debug = _this select 4;
	_amount = _this select 5;

	_CFFMissions = ceil (random (count _artG));

	for "_i" from 1 to _CFFMissions do
		{
		_tgt = [_knEnemies] call RYD_CFF_TGT;

		if not (isNull _tgt) then
			{
			_ammo = "HE";
			_amnt = _amount;
			if ((random 100) > 85) then {_ammo = "SPECIAL";_amnt = (ceil (_amount/3))};
			//if (_tgt in _enArmor) then {_ammo = "HE";_amnt = 6};

			_bArr = [(getPosATL _tgt),_artG,_ammo,_amnt,objNull] call RYD_ArtyMission;

			_possible = _bArr select 0;
			if (_possible) then
				{
					{
					if not (isNull _x) then
						{
						_x setVariable ["RydFFE_BatteryBusy",true]
						}
					}
				foreach (_bArr select 1);
				[_bArr select 1,_tgt,_bArr select 2,_bArr select 3,_friends,_Debug,_ammo,_amnt min (_bArr select 4)] spawn RYD_CFF_FFE
				}
			else
				{
				switch (true) do
					{
					case (_ammo in ["SPECIAL","SECONDARY"]) : {_ammo = "HE";_amnt = _amount};
					case (_ammo in ["HE"]) : {_ammo = "SECONDARY";_amnt = _amount};
					};

				_bArr = [(getPosATL _tgt),_artG,_ammo,_amnt,objNull] call RYD_ArtyMission;

				_possible = _bArr select 0;
				if (_possible) then
					{
						{
						if not (isNull _x) then
							{
							_x setVariable ["RydFFE_BatteryBusy",true]
							}
						}
					foreach (_bArr select 1);
					[_bArr select 1,_tgt,_bArr select 2,_bArr select 3,_friends,_Debug,_ammo,_amnt min (_bArr select 4)] spawn RYD_CFF_FFE
					}
				}
			};

		sleep (5 + (random 5))
		}
	};
		
RYD_CFF_Fire = 
	{
	private ["_battery","_pos","_ammo","_amount","_guns","_vh","_mags","_amount0","_eta","_alive","_available","_perGun","_rest","_aGuns","_perGun1","_shots","_toFire","_rest0","_bad","_ammoC","_ws","_gun"];
	
	_battery = _this select 0;
	_pos = _this select 1;
	_ammo = _this select 2;
	_amount = _this select 3;
	
	_eta = -1;
	
	_guns = [];
	
		{
		if not (isNull _x) then
			{
				{
				_vh = vehicle _x;
				if not (_vh in _guns) then
					{
					_shots = 0;
					
						{
						if ((_x select 0) in _ammo) then
							{
							_shots = _shots + (_x select 1)
							}
						}
					foreach (magazinesAmmo _vh);
					
					_vh setVariable ["RydFFE_ShotsToFire",0];
					_vh setVariable ["RydFFE_MyShots",_shots];
					
					if (_shots > 0) then
						{
						_guns set [(count _guns),_vh]
						}
					}
				}
			foreach (units _x)
			}
		}
	foreach _battery;
	
	_aGuns = count _guns;
	
	if (_aGuns < 1) exitWith {-1};
	if (_amount < 1) exitWith {-1};
	
	_perGun = floor (_amount/_aGuns);
	_rest = _amount - (_perGun * _aGuns);
			
		{
		_shots = _x getVariable ["RydFFE_MyShots",0];
		if not (_shots > _perGun) then
			{
			_x setVariable ["RydFFE_ShotsToFire",_shots];
			_amount = _amount - _shots;
			_rest = _rest + (_perGun - _shots);
			_x setVariable ["RydFFE_MyShots",0]
			}
		else
			{				
			_x setVariable ["RydFFE_ShotsToFire",_perGun];
			_x setVariable ["RydFFE_MyShots",_shots - _perGun]
			};
		}
	foreach _guns;
	
	_bad = false;
		
	while {(_rest > 0)} do
		{
		_rest0 = _rest;
		
			{
			if (_rest < 1) exitWith {};
			_shots = _x getVariable ["RydFFE_MyShots",0];
			
			if (_shots > 0) then
				{
				_toFire = _x getVariable ["RydFFE_ShotsToFire",0];

				_rest = _rest - 1;
				
				_x setVariable ["RydFFE_ShotsToFire",_toFire + 1];
				_x setVariable ["RydFFE_MyShots",_shots - 1]
				}		
			}
		foreach _guns;
		
		if (not (_rest0 > _rest) and (_rest > 0)) exitWith {_bad = true}
		};
		
	if (_bad) exitWith {-1};
		
		{
		if not (isNull _x) then
			{
			_vh = vehicle _x;
			
			if ((_vh getVariable ["RydFFE_ShotsToFire",0]) > 0) then
				{
				_mags = getArtilleryAmmo [_vh];
				
				_ammoC = (magazines _vh) select 0;
				
					{
					if (_x in _ammo) exitWith
						{
						_ammoC = _x
						}
					}
				foreach (magazines _vh);	
				
				if (_ammoC in _mags) then
					{
					_amount = _amount - 1;
					
					_newEta = _vh getArtilleryETA [_pos,_ammoC];
					
					if (not (isNil "_newEta") and {((_newEta < _eta) or (_eta < 0))}) then
						{
						_eta = _newEta
						};

					[_vh,_pos,_ammoC] spawn
						{
						_vh = _this select 0;
						_pos = _this select 1;
						_ammo = _this select 2;
						
						if (_pos inRangeOfArtillery [[_vh],_ammo]) then
							{
							if (_ammo in (getArtilleryAmmo [_vh])) then
								{
								_vh setVariable ["RydFFE_GunFree",false];
								
								if not ((currentMagazine _vh) in [_ammo]) then
									{
									_vh loadMagazine [[0],currentWeapon _vh,_ammo]; 
									
									_ct = time;
									
									waitUntil
										{
										sleep 0.1;
										_ws = weaponState [_vh,[0]];
										_ws = _ws select 3;
										((_ws in [_ammo]) or ((time - _ct) > 30))
										};
										
									sleep ((getNumber (configFile >> "cfgWeapons" >> (currentWeapon _vh) >> "magazineReloadTime")) + 0.1)
									};
								
								if (_pos inRangeOfArtillery [[_vh],_ammo]) then
									{
									if (_ammo in (getArtilleryAmmo [_vh])) then
										{																				
										if (((toLower (typeOf _vh)) in ["uss_iowa_turret_c","uss_iowa_turret_b","uss_iowa_turret_a"]) or {RydFFE_IowaMode}) then
											{
												{
												_gun = vehicle _x;
												if not ((toLower (typeOf _gun)) isEqualTo "uss_iowa_battleship") then
													{
													_gun doArtilleryFire [_pos, _ammo,(_vh getVariable ["RydFFE_ShotsToFire",1])]
													}
												}
											foreach (units (group _vh))
											}
										else
											{
											_vh doArtilleryFire [_pos, _ammo,(_vh getVariable ["RydFFE_ShotsToFire",1])]
											};
										
										_ct = time;
										
										waitUntil
											{
											sleep 0.1;
											(not ((_vh getVariable ["RydFFE_ShotFired2",0]) < (_vh getVariable ["RydFFE_ShotsToFire",1])) or ((time - _ct) > 15))
											};
										
										_vh setVariable ["RydFFE_ShotFired",true];
										_vh setVariable ["RydFFE_ShotFired2",0];
										};
									};
								
								sleep ((getNumber (configFile >> "cfgWeapons" >> (currentWeapon _vh) >> "reloadTime")) + 0.5);
								
								_vh setVariable ["RydFFE_GunFree",true]
								}
							}
						}
					}
				}
			}
		}
	foreach _guns;
		
		/*{
		if not (isNull _x) then
			{
				{
				(vehicle _x) setVariable ["RydFFE_GunFree",true]
				}
			foreach (units _x)
			}			
		}
	foreach _battery;*/
		
	_eta
	};
				
RydFFE_ShellsInRadius = 
	{
	private ["_center","_radius","_shells","_inRange","_pos1","_shell","_pos2"];
	
	_center = _this select 0;
	_radius = _this select 1;
	
	_pos1 = [_center select 0,_center select 1,0];
	
	_shells = missionNameSpace getVariable ["RydFFE_FiredShells",[]];
	
	_inRange = [];
	
		{
		_shell = _x;
		if not (isNil "_shell") then
			{
			if not (isNull _x) then
				{
				_pos2 = getPosASL _x;
				_pos2 = [_pos2 select 0,_pos2 select 1,0];
				
				if ((_pos1 distance _pos2) < _radius) then
					{
					_inRange set [(count _inRange),_x]
					}
				}
			}
		}
	foreach _shells;
	
	_inRange
	};
	
RydFFE_AutoConfig = 
	{
	private ["_allArty","_vh","_typeVh","_mags","_prim","_rare","_sec","_smoke","_illum","_maxHit","_ammo","_ammoC","_actHit","_subM","_mags0","_illumChosen","_smokeChosen","_rareChosen","_secChosen",
	"_hit","_lc","_sim","_subM","_arr"];
	
	_allArty = _this select 0;
	
		{
		_vh = _x;
				
		if not (_vh getVariable ["RydFFE_CheckedOut",false]) then
			{
			_vh setVariable ["RydFFE_CheckedOut",true];
			_typeVh = toLower (typeOf _vh);
			
			if not (_typeVh in _allArty) then	
				{
				_mags = getArtilleryAmmo [_vh];
					
				if ((count _mags) > 0) then 
					{
					_prim = "";
					_rare = "";
					_sec = "";
					_smoke = "";
					_illum = "";
					
					_maxHit = 10;
					
						{
						_ammo = getText (configfile >> "CfgMagazines" >> _x >> "ammo");
						_ammoC = configfile >> "CfgAmmo" >> _ammo;
						
						_actHit = getNumber (_ammoC >> "indirectHitRange");
						_subM = toLower (getText (_ammoC >> "submunitionAmmo"));
											
						if (_actHit <= 10) then
							{
							if not (_subM isEqualTo "") then
								{
								_ammoC = configfile >> "CfgAmmo" >> _subM;
								_actHit = getNumber (_ammoC >> "indirectHitRange")
								}
							};
						
						if ((_actHit > _maxHit) and {_actHit < 100}) then
							{
							_maxHit = _actHit;
							_prim = _x
							}
						}
					foreach _mags;
						
					_mags = _mags - [_prim];
					_mags0 = +_mags;
					_illumChosen = false;
					_smokeChosen = false;
					_rareChosen = false;
					_secChosen = false;
					
						{
						_ammo = getText (configfile >> "CfgMagazines" >> _x >> "ammo");
						_ammoC = configfile >> "CfgAmmo" >> _ammo;
						
						_hit = getNumber (_ammoC >> "indirectHit");
						_lc = _ammoC >> "lightColor";
						_sim = toLower (getText (_ammoC >> "simulation"));
						_subM = toLower (getText (_ammoC >> "submunitionAmmo"));
						
						if (_hit <= 10) then
							{
							if not (_subM isEqualTo "") then
								{
								_ammoC = configfile >> "CfgAmmo" >> _subM;
								_hit = getNumber (_ammoC >> "indirectHit")
								}
							};

						switch (true) do
							{
							case ((isArray _lc) and {not (_illumChosen)}) : 
								{
								_illum = _x;
								_mags = _mags - [_x];
								_illumChosen = true
								};
								
							case ((_hit <= 10) and {(_subM isEqualTo "smokeshellarty") and {not (_smokeChosen)}}) : 
								{
								_smoke = _x;
								_mags = _mags - [_x];
								_smokeChosen = true
								};
								
							case ((_sim isEqualTo "shotsubmunitions") and {not (_rareChosen)}) : 
								{
								_rare = _x;
								_mags = _mags - [_x];
								_rareChosen = true
								};
								
							case ((_hit > 10) and {not ((_secChosen) or {(_rare == _x)})})  : 
								{
								_sec = _x;
								_mags = _mags - [_x];
								_secChosen = true
								}
							}
						}
					foreach _mags0;
					
					if (_sec isEqualTo "") then
						{
						_maxHit = 10;
						
							{
							_ammo = getText (configfile >> "CfgMagazines" >> _x >> "ammo");
							_ammoC = configfile >> "CfgAmmo" >> _ammo;
							_subAmmo = _ammoC >> "subMunitionAmmo";
							
							if ((isText _subAmmo) and {not ((getText _subAmmo) isEqualTo "")}) then
								{
								_ammoC = configfile >> "CfgAmmo" >> (getText _subAmmo);
								};
								
							_actHit = getNumber (_ammoC >> "indirectHit");
							
							if (_actHit > _maxHit) then
								{
								_maxHit = _actHit;
								_sec = _x
								}
							}
						foreach _mags;
						};
						
					_arr = [_prim,_rare,_sec,_smoke,_illum];
					
					if (({_x isEqualTo ""} count _arr) < 5) then
						{
						RydFFE_Other pushBack [[_typeVh],_arr];
						_allArty pushBack _typeVh
						}
					}
				}
			}
		} 
	foreach vehicles;
	
	RydFFE_AllArty = _allArty;
	
	_allArty
	};