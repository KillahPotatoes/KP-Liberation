scriptName "synchronise_vars";

sync_vars = []; publicVariable "sync_vars";

waitUntil{!isNil "KPLIB_saveLoaded"};
waitUntil{!isNil "KPLIB_fob_resources"};
waitUntil{!isNil "KPLIB_supplies_global"};
waitUntil{!isNil "KPLIB_ammo_global"};
waitUntil{!isNil "KPLIB_fuel_global"};
waitUntil{!isNil "KPLIB_enemyReadiness"};
waitUntil{!isNil "unitcap"};
waitUntil{!isNil "KPLIB_heli_count"};
waitUntil{!isNil "KPLIB_plane_count"};
waitUntil{!isNil "KPLIB_heli_slots"};
waitUntil{!isNil "KPLIB_plane_slots"};
waitUntil{!isNil "resources_intel"};
waitUntil{!isNil "infantry_cap"};
waitUntil{!isNil "KPLIB_civ_rep"};
waitUntil{!isNil "KPLIB_guerilla_strength"};
waitUntil{!isNil "infantry_weight"};
waitUntil{!isNil "armor_weight"};
waitUntil{!isNil "air_weight"};
waitUntil {KPLIB_saveLoaded};

private _KPLIB_fob_resources_old = [];
private _KPLIB_supplies_global_old = -1;
private _KPLIB_ammo_global_old = -1;
private _KPLIB_fuel_global_old = -1;
private _unitcap_old = -1;
private _KPLIB_heli_count_old = -1;
private _KPLIB_plane_count_old = -1;
private _KPLIB_heli_slots_old = -1;
private _KPLIB_plane_slots_old = -1;
private _KPLIB_enemyReadiness_old = -1;
private _resources_intel_old = -999;
private _infantry_cap_old = -999;
private _KPLIB_civ_rep_old = -999;
private _KPLIB_guerilla_strength_old = -999;
private _infantry_weight_old = -1;
private _armor_weight_old = -1;
private _air_weight_old = -1;

while {true} do {
    waitUntil {sleep 0.25;
        !(_KPLIB_fob_resources_old isEqualTo KPLIB_fob_resources)
        || _KPLIB_supplies_global_old != KPLIB_supplies_global
        || _KPLIB_ammo_global_old != KPLIB_ammo_global
        || _KPLIB_fuel_global_old != KPLIB_fuel_global
        || _unitcap_old != unitcap
        || _KPLIB_heli_count_old != KPLIB_heli_count
        || _KPLIB_plane_count_old != KPLIB_plane_count
        || _KPLIB_heli_slots_old != KPLIB_heli_slots
        || _KPLIB_plane_slots_old != KPLIB_plane_slots
        || _KPLIB_enemyReadiness_old != KPLIB_enemyReadiness
        || _resources_intel_old != resources_intel
        || _infantry_cap_old != infantry_cap
        || _KPLIB_civ_rep_old != KPLIB_civ_rep
        || _KPLIB_guerilla_strength_old != KPLIB_guerilla_strength
        || _infantry_weight_old != infantry_weight
        || _armor_weight_old != armor_weight
        || _air_weight_old != air_weight
    };

    if (KPLIB_guerilla_strength < 0) then {KPLIB_guerilla_strength = 0;};

    sleep 0.25;
    sync_vars = [
        KPLIB_fob_resources,
        KPLIB_supplies_global,
        KPLIB_ammo_global,
        KPLIB_fuel_global,
        unitcap,
        KPLIB_heli_count,
        KPLIB_plane_count,
        KPLIB_heli_slots,
        KPLIB_plane_slots,
        KPLIB_enemyReadiness,
        resources_intel,
        infantry_cap,
        KPLIB_civ_rep,
        KPLIB_guerilla_strength,
        infantry_weight,
        armor_weight,
        air_weight
    ];
    publicVariable "sync_vars";

    _KPLIB_fob_resources_old = +KPLIB_fob_resources;
    _KPLIB_supplies_global_old = KPLIB_supplies_global;
    _KPLIB_ammo_global_old = KPLIB_ammo_global;
    _KPLIB_fuel_global_old = KPLIB_fuel_global;
    _unitcap_old = unitcap;
    _KPLIB_heli_count_old = KPLIB_heli_count;
    _KPLIB_plane_count_old = KPLIB_plane_count;
    _KPLIB_heli_slots_old = KPLIB_heli_slots;
    _KPLIB_plane_slots_old = KPLIB_plane_slots;
    _KPLIB_enemyReadiness_old = KPLIB_enemyReadiness;
    _resources_intel_old = resources_intel;
    _infantry_cap_old = infantry_cap;
    _KPLIB_civ_rep_old = KPLIB_civ_rep;
    _KPLIB_guerilla_strength_old = KPLIB_guerilla_strength;
    _infantry_weight_old = infantry_weight;
    _armor_weight_old = armor_weight;
    _air_weight_old = air_weight;
};
