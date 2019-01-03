waitUntil {sleep 1; (RydFFE_Debug)};

RydFFE_SVStart = false;

OnMapSingleClick 
	'
	if not (RydFFE_SVStart) then
		{
		RydFFE_SVStart = true; 
		
		_i = createMarker ["rangemark",_pos];
		_i setMarkerColor "ColorKhaki";
		_i setMarkerShape "ELLIPSE";
		_i setMarkerSize [RydFFE_SVRange,RydFFE_SVRange];
		_i setMarkerBrush "Border";

		missionNamespace setVariable ["shellVMark",_i];
		};

	if ((RydFFE_SVStart) and (_shift)) then 
		{
		RydFFE_SVStart = false;
		_svcircle = missionNamespace getVariable ["shellVMark",""];
		_shells = missionNamespace getVariable ["shellVShells",[]];

			{
			deleteMarker _x
			} 
		foreach _shells; 

		missionNamespace setVariable ["shellVShells",nil];

		deleteMarker _svcircle;

		missionNamespace setVariable ["shellVMark",nil]
		}
	';

while {RydFFE_ShellView} do
	{
	while {((RydFFE_SVStart) and (RydFFE_Debug))} do
		{
		_shells = missionNameSpace getVariable ["RydFFE_FiredShells",[]];
		
			{
			_shell = _x;
			if (isNil "_shell") then
				{
				_shells set [_foreachIndex,"Del"]
				}
			else
				{
				if (isNull _x) then
					{
					_shells set [_foreachIndex,"Del"]
					}
				}
			}
		foreach _shells;
		
		_shells = _shells - ["Del"];	
		missionNameSpace setVariable ["RydFFE_FiredShells",_shells];
		
		_svPos = getMarkerPos (missionNamespace getVariable ["shellVMark",""]);
		_shellsA = [_svPos,RydFFE_SVRange] call RydFFE_ShellsInRadius;
		_shells = [];

			{
			_shell = _x;
			if not (isNil "_shell") then
				{
				if not (isNull _x) then
					{
					if ((typeName _x) == "OBJECT") then
						{
						if not (_x isKindOf "AllVehicles") then
							{
							_shells set [(count _shells),_x]
							}
						}
					}
				}
			}
		foreach _shellsA;

		_shellMarks = [];

			{
			_shellpos = getposATL _x;
			_i = "shell" + (str _x) + (str (random 100));
			_i = createMarker [_i,_shellpos];
			_i setMarkerColor "ColorOrange";
			_i setMarkerShape "ICON";
			_i setMarkerType "mil_dot";
			_shellMarks set [(count _shellMarks),_i]
			}
		foreach _shells;

		missionNameSpace setVariable ["shellVShells",_shellMarks];



			{
			[_x] spawn
				{
				_mark = _this select 0;
				_size = 1;
				while {_size > 0.1} do
					{
					_size = _size - 0.03;
					_mark setMarkerSize [_size,_size];
					sleep 0.025
					};

				deleteMarker _mark
				}
			}
		foreach _shellMarks;
		sleep 0.2;
		missionNameSpace setVariable ["shellVShells",nil];
		sleep 0.05
		};

	sleep 2
	};
