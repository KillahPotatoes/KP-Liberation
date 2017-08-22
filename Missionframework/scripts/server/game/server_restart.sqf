if (!isDedicated) exitWith {};

private ["_serverDuration","_timeStart","_timeSinceStart","_shutdownSuccess","_timeUntilRestart","_30minspassed","_15minspassed","_5minspassed","_60secondspassed"];

_serverDuration = (KP_liberation_restart * 60 * 60);

diag_log format ["[KP LIBERATION] [RESTART] Restart Timer Set To %1", _serverDuration];

_30minspassed = false;
_15minspassed = false;
_5minspassed = false;
_60secondspassed = false;

_timeStart = diag_tickTime;

while{true} do
{
	_timeSinceStart = diag_tickTime - _timeStart;
	_timeUntilRestart = _serverDuration - _timeSinceStart;

	switch true do
	{
		case ((_timeUntilRestart < (1 * 60)) && !_60secondspassed) :
		{
			["lib_restart_60_s"] remoteExecCall ["BIS_fnc_showNotification"];
			diag_log "[KP LIBERATION] [RESTART] 60 seconds until server restart.";
			_60secondspassed = true;
			_5minspassed = true;
			_15minspassed = true;
			_30minspassed = true;
		};
		case ((_timeUntilRestart < (5 * 60)) && !_5minspassed) :
		{
			["lib_restart_5_min"] remoteExecCall ["BIS_fnc_showNotification"];
			diag_log "[KP LIBERATION] [RESTART] 5 minutes until server restart.";
			_5minspassed = true;
			_15minspassed = true;
			_30minspassed = true;
		};
		case ((_timeUntilRestart < (15 * 60)) && !_15minspassed) :
		{
			["lib_restart_15_min"] remoteExecCall ["BIS_fnc_showNotification"];
			diag_log "[KP LIBERATION] [RESTART] 15 minutes until server restart.";
			_15minspassed = true;
			_30minspassed = true;
		};
		case ((_timeUntilRestart < (30 * 60)) && !_30minspassed) :
		{
			["lib_restart_30_min"] remoteExecCall ["BIS_fnc_showNotification"];
			diag_log "[KP LIBERATION] [RESTART] 30 minutes until server restart.";
			_30minspassed = true;
		};
	};

	if(_timeSinceStart > _serverDuration) then
	{
		diag_log "[KP LIBERATION] [RESTART] Restart timeout elapsed, attempting server shutdown.";
		sleep 5;

		_myPass = call compile preprocessFileLineNumbers "\userconfig\restart\myPass.hpp";
		_shutdownSuccess = _myPass serverCommand "#restart";//you can change with #restartserver if you want to restart the server process(Windows Dedicated Only).

		if(_shutdownSuccess) then
		{
			diag_log "[KP LIBERATION] [RESTART] Shutting down server!";
		}
		else
		{
			diag_log "[KP LIBERATION] [RESTART] Shutdown failed!";
		};
	};
	sleep 15;
};
