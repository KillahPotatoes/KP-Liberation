kill_manager = compileScript ["scripts\shared\kill_manager.sqf";

build_remote_call = compileScript ["scripts\server\remotecall\build_remote_call.sqf";
build_fob_remote_call = compileScript ["scripts\server\remotecall\build_fob_remote_call.sqf";
cancel_build_remote_call = compileScript ["scripts\server\remotecall\cancel_build_remote_call.sqf";
prisonner_remote_call = compileScript ["scripts\server\remotecall\prisonner_remote_call.sqf";
recycle_remote_call = compileScript ["scripts\server\remotecall\recycle_remote_call.sqf", true];
reinforcements_remote_call = compileScript ["scripts\server\remotecall\reinforcements_remote_call.sqf", true];
sector_liberated_remote_call = compileScript ["scripts\server\remotecall\sector_liberated_remote_call.sqf", true];
intel_remote_call = compileScript ["scripts\server\remotecall\intel_remote_call.sqf", true];
start_secondary_remote_call = compileScript ["scripts\server\remotecall\start_secondary_remote_call.sqf", true];
change_prod_remote_call = compileScript ["scripts\server\remotecall\change_prod_remote_call.sqf", true];
build_fac_remote_call = compileScript ["scripts\server\remotecall\build_fac_remote_call.sqf", true];
if (KPLIB_param_logistic) then {
    add_logiGroup_remote_call = compileScript ["scripts\server\remotecall\add_logiGroup_remote_call.sqf", true];
    del_logiGroup_remote_call = compileScript ["scripts\server\remotecall\del_logiGroup_remote_call.sqf", true];
    add_logiTruck_remote_call = compileScript ["scripts\server\remotecall\add_logiTruck_remote_call.sqf", true];
    del_logiTruck_remote_call = compileScript ["scripts\server\remotecall\del_logiTruck_remote_call.sqf", true];
    save_logi_remote_call = compileScript ["scripts\server\remotecall\save_logi_remote_call.sqf", true];
    abort_logi_remote_call = compileScript ["scripts\server\remotecall\abort_logi_remote_call.sqf", true];
};

remote_call_sector = compileScript ["scripts\client\remotecall\remote_call_sector.sqf", true];
remote_call_fob = compileScript ["scripts\client\remotecall\remote_call_fob.sqf", true];
remote_call_battlegroup = compileScript ["scripts\client\remotecall\remote_call_battlegroup.sqf", true];
remote_call_endgame = compileScript ["scripts\client\remotecall\remote_call_endgame.sqf", true];
remote_call_prisonner = compileScript ["scripts\client\remotecall\remote_call_prisonner.sqf", true];
remote_call_intel = compileScript ["scripts\client\remotecall\remote_call_intel.sqf", true];
remote_call_incoming = compileScript ["scripts\client\remotecall\remote_call_incoming.sqf", true];

civinfo_notifications = compileScript ["scripts\client\civinformant\civinfo_notifications.sqf", true];
civinfo_escort = compileScript ["scripts\client\civinformant\civinfo_escort.sqf", true];
civinfo_delivered = compileScript ["scripts\server\civinformant\civinfo_delivered.sqf", true];

asymm_notifications = compileScript ["scripts\client\asymmetric\asymm_notifications.sqf", true];

execVM "scripts\shared\diagnostics.sqf";
