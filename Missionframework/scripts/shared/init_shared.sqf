kill_manager = compileFinal preprocessFileLineNumbers "scripts\shared\kill_manager.sqf";

build_remote_call = compileFinal preprocessFileLineNumbers "scripts\server\remotecall\build_remote_call.sqf";
build_fob_remote_call = compileFinal preprocessFileLineNumbers "scripts\server\remotecall\build_fob_remote_call.sqf";
cancel_build_remote_call = compileFinal preprocessFileLineNumbers "scripts\server\remotecall\cancel_build_remote_call.sqf";
prisonner_remote_call = compileFinal preprocessFileLineNumbers "scripts\server\remotecall\prisonner_remote_call.sqf";
recycle_remote_call = compileFinal preprocessFileLineNumbers "scripts\server\remotecall\recycle_remote_call.sqf";
reinforcements_remote_call = compileFinal preprocessFileLineNumbers "scripts\server\remotecall\reinforcements_remote_call.sqf";
sector_liberated_remote_call = compileFinal preprocessFileLineNumbers "scripts\server\remotecall\sector_liberated_remote_call.sqf";
intel_remote_call = compileFinal preprocessFileLineNumbers "scripts\server\remotecall\intel_remote_call.sqf";
start_secondary_remote_call = compileFinal preprocessFileLineNumbers "scripts\server\remotecall\start_secondary_remote_call.sqf";
zeus_remote_call = compileFinal preprocessFileLineNumbers "scripts\server\remotecall\zeus_remote_call.sqf";
change_prod_remote_call = compileFinal preprocessFileLineNumbers "scripts\server\remotecall\change_prod_remote_call.sqf";
build_fac_remote_call = compileFinal preprocessFileLineNumbers "scripts\server\remotecall\build_fac_remote_call.sqf";
check_sector_ress_remote_call = compileFinal preprocessFileLineNumbers "scripts\server\remotecall\check_sector_ress_remote_call.sqf";
if (KP_liberation_ailogistics) then {
	add_logiGroup_remote_call = compileFinal preprocessFileLineNumbers "scripts\server\remotecall\add_logiGroup_remote_call.sqf";
	del_logiGroup_remote_call = compileFinal preprocessFileLineNumbers "scripts\server\remotecall\del_logiGroup_remote_call.sqf";
	add_logiTruck_remote_call = compileFinal preprocessFileLineNumbers "scripts\server\remotecall\add_logiTruck_remote_call.sqf";
	del_logiTruck_remote_call = compileFinal preprocessFileLineNumbers "scripts\server\remotecall\del_logiTruck_remote_call.sqf";
	save_logi_remote_call = compileFinal preprocessFileLineNumbers "scripts\server\remotecall\save_logi_remote_call.sqf";
	abort_logi_remote_call = compileFinal preprocessFileLineNumbers "scripts\server\remotecall\abort_logi_remote_call.sqf";
};

remote_call_sector = compileFinal preprocessFileLineNumbers "scripts\client\remotecall\remote_call_sector.sqf";
remote_call_fob = compileFinal preprocessFileLineNumbers "scripts\client\remotecall\remote_call_fob.sqf";
remote_call_battlegroup = compileFinal preprocessFileLineNumbers "scripts\client\remotecall\remote_call_battlegroup.sqf";
remote_call_endgame = compileFinal preprocessFileLineNumbers "scripts\client\remotecall\remote_call_endgame.sqf";
remote_call_prisonner = compileFinal preprocessFileLineNumbers "scripts\client\remotecall\remote_call_prisonner.sqf";
remote_call_switchmove = compileFinal preprocessFileLineNumbers "scripts\client\remotecall\remote_call_switchmove.sqf";
remote_call_intel = compileFinal preprocessFileLineNumbers "scripts\client\remotecall\remote_call_intel.sqf";
remote_call_incoming = compileFinal preprocessFileLineNumbers "scripts\client\remotecall\remote_call_incoming.sqf";

civinfo_notifications = compileFinal preprocessFileLineNumbers "scripts\client\civinformant\civinfo_notifications.sqf";
civinfo_escort = compileFinal preprocessFileLineNumbers "scripts\client\civinformant\civinfo_escort.sqf";
civinfo_delivered = compileFinal preprocessFileLineNumbers "scripts\server\civinformant\civinfo_delivered.sqf";

asymm_notifications = compileFinal preprocessFileLineNumbers "scripts\client\asymmetric\asymm_notifications.sqf";

execVM "scripts\shared\scan_skill.sqf";
execVM "scripts\shared\diagnostics.sqf";
if (!KP_liberation_ace) then {execVM "scripts\shared\manage_weather.sqf";};
