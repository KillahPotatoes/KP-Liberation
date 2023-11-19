kill_manager = compile preprocessFileLineNumbers "scripts\shared\kill_manager.sqf";

build_remote_call = compile preprocessFileLineNumbers "scripts\server\remotecall\build_remote_call.sqf";
build_fob_remote_call = compile preprocessFileLineNumbers "scripts\server\remotecall\build_fob_remote_call.sqf";
cancel_build_remote_call = compile preprocessFileLineNumbers "scripts\server\remotecall\cancel_build_remote_call.sqf";
prisonner_remote_call = compile preprocessFileLineNumbers "scripts\server\remotecall\prisonner_remote_call.sqf";
recycle_remote_call = compile preprocessFileLineNumbers "scripts\server\remotecall\recycle_remote_call.sqf";
reinforcements_remote_call = compile preprocessFileLineNumbers "scripts\server\remotecall\reinforcements_remote_call.sqf";
sector_liberated_remote_call = compile preprocessFileLineNumbers "scripts\server\remotecall\sector_liberated_remote_call.sqf";
intel_remote_call = compile preprocessFileLineNumbers "scripts\server\remotecall\intel_remote_call.sqf";
start_secondary_remote_call = compile preprocessFileLineNumbers "scripts\server\remotecall\start_secondary_remote_call.sqf";
change_prod_remote_call = compile preprocessFileLineNumbers "scripts\server\remotecall\change_prod_remote_call.sqf";
build_fac_remote_call = compile preprocessFileLineNumbers "scripts\server\remotecall\build_fac_remote_call.sqf";
if (KPLIB_param_logistic) then {
    add_logiGroup_remote_call = compile preprocessFileLineNumbers "scripts\server\remotecall\add_logiGroup_remote_call.sqf";
    del_logiGroup_remote_call = compile preprocessFileLineNumbers "scripts\server\remotecall\del_logiGroup_remote_call.sqf";
    add_logiTruck_remote_call = compile preprocessFileLineNumbers "scripts\server\remotecall\add_logiTruck_remote_call.sqf";
    del_logiTruck_remote_call = compile preprocessFileLineNumbers "scripts\server\remotecall\del_logiTruck_remote_call.sqf";
    save_logi_remote_call = compile preprocessFileLineNumbers "scripts\server\remotecall\save_logi_remote_call.sqf";
    abort_logi_remote_call = compile preprocessFileLineNumbers "scripts\server\remotecall\abort_logi_remote_call.sqf";
};

remote_call_sector = compile preprocessFileLineNumbers "scripts\client\remotecall\remote_call_sector.sqf";
remote_call_fob = compile preprocessFileLineNumbers "scripts\client\remotecall\remote_call_fob.sqf";
remote_call_battlegroup = compile preprocessFileLineNumbers "scripts\client\remotecall\remote_call_battlegroup.sqf";
remote_call_endgame = compile preprocessFileLineNumbers "scripts\client\remotecall\remote_call_endgame.sqf";
remote_call_prisonner = compile preprocessFileLineNumbers "scripts\client\remotecall\remote_call_prisonner.sqf";
remote_call_intel = compile preprocessFileLineNumbers "scripts\client\remotecall\remote_call_intel.sqf";
remote_call_incoming = compile preprocessFileLineNumbers "scripts\client\remotecall\remote_call_incoming.sqf";

civinfo_notifications = compile preprocessFileLineNumbers "scripts\client\civinformant\civinfo_notifications.sqf";
civinfo_escort = compile preprocessFileLineNumbers "scripts\client\civinformant\civinfo_escort.sqf";
civinfo_delivered = compile preprocessFileLineNumbers "scripts\server\civinformant\civinfo_delivered.sqf";

asymm_notifications = compile preprocessFileLineNumbers "scripts\client\asymmetric\asymm_notifications.sqf";

execVM "scripts\shared\diagnostics.sqf";
