if (!isServer) exitWith {};

params [ "_new_fob", "_create_fob_building" ];
private [ "_fob_building", "_fob_pos" ];

GRLIB_all_fobs pushback _new_fob;
publicVariable "GRLIB_all_fobs";

if ( _create_fob_building ) then {
	_fob_pos = [ (_new_fob select 0) + 15, (_new_fob select 1) + 2, 0 ];
	_fob_building = FOB_typename createVehicle _fob_pos;
	_fob_building setpos _fob_pos;
	_fob_building setVectorUp [0,0,1];
	sleep 1;
};

trigger_server_save = true;

sleep 3;
[ [ _new_fob, 0 ] , "remote_call_fob" ] call BIS_fnc_MP;

stats_fobs_built = stats_fobs_built + 1;