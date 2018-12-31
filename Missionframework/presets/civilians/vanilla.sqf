#include "../script_component.hpp"
/*
    KP Liberation Vanilla Civilian Preset

    File: vanilla.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-12-07
    Last Update: 2018-12-08
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Vanilla civilian preset file which contains only vanilla assets.

    Needed Mods:
        - None

    Optional Mods:
        - None
*/


/*------------------------------------------------------------
    --- Civilian Population ---
    Just normal civilians which are living in the area.
------------------------------------------------------------*/

// Civilian Citizens (KPLIB_preset_unitsPlC)
KPLIB_PRST_CAT_BEGIN("unitsPlC");
KPLIB_PRST_CAT_ADD("unitsPlC", "C_Man_Fisherman_01_F");
KPLIB_PRST_CAT_ADD("unitsPlC", "C_man_w_worker_F");
KPLIB_PRST_CAT_ADD("unitsPlC", "C_man_1_1_F");
KPLIB_PRST_CAT_ADD("unitsPlC", "C_man_p_beggar_F");
KPLIB_PRST_CAT_ADD("unitsPlC", "C_Man_Messenger_01_F");
KPLIB_PRST_CAT_ADD("unitsPlC", "C_man_hunter_1_F");
KPLIB_PRST_CAT_ADD("unitsPlC", "C_journalist_F");
KPLIB_PRST_CAT_ADD("unitsPlC", "C_Journalist_01_War_F");
KPLIB_PRST_CAT_ADD("unitsPlC", "C_man_shorts_2_F");
KPLIB_PRST_CAT_ADD("unitsPlC", "C_Man_UtilityWorker_01_F");
KPLIB_PRST_CAT_ADD("unitsPlC", "C_man_1");
KPLIB_PRST_CAT_ADD("unitsPlC", "C_Man_casual_1_F");
KPLIB_PRST_CAT_ADD("unitsPlC", "C_Man_casual_2_F");
KPLIB_PRST_CAT_ADD("unitsPlC", "C_Man_casual_3_F");
KPLIB_PRST_CAT_ADD("unitsPlC", "C_Man_casual_4_F");
KPLIB_PRST_CAT_ADD("unitsPlC", "C_Man_casual_5_F");
KPLIB_PRST_CAT_ADD("unitsPlC", "C_Man_casual_6_F");
KPLIB_PRST_CAT_ADD("unitsPlC", "C_man_polo_1_F");
KPLIB_PRST_CAT_ADD("unitsPlC", "C_man_polo_2_F");
KPLIB_PRST_CAT_ADD("unitsPlC", "C_man_polo_3_F");
KPLIB_PRST_CAT_ADD("unitsPlC", "C_man_polo_4_F");
KPLIB_PRST_CAT_ADD("unitsPlC", "C_man_polo_5_F");
KPLIB_PRST_CAT_ADD("unitsPlC", "C_man_polo_6_F");

// Civilian Cars (KPLIB_preset_vehLightUnarmedPlC)
KPLIB_PRST_CAT_BEGIN("vehLightUnarmedPlC");
KPLIB_PRST_CAT_ADD("vehLightUnarmedPlC", "C_Quadbike_01_F");
KPLIB_PRST_CAT_ADD("vehLightUnarmedPlC", "C_Hatchback_01_F");
KPLIB_PRST_CAT_ADD("vehLightUnarmedPlC", "C_Hatchback_01_sport_F");
KPLIB_PRST_CAT_ADD("vehLightUnarmedPlC", "C_Offroad_01_F");
KPLIB_PRST_CAT_ADD("vehLightUnarmedPlC", "C_SUV_01_F");
KPLIB_PRST_CAT_ADD("vehLightUnarmedPlC", "C_Van_01_box_F");

// Civilian Trucks (KPLIB_preset_vehTransPlC)
KPLIB_PRST_CAT_BEGIN("vehTransPlC");
KPLIB_PRST_CAT_ADD("vehTransPlC", "C_Truck_02_covered_F");
KPLIB_PRST_CAT_ADD("vehTransPlC", "C_Truck_02_transport_F");
KPLIB_PRST_CAT_ADD("vehTransPlC", "C_Van_01_transport_F");
KPLIB_PRST_CAT_ADD("vehTransPlC", "C_Van_02_transport_F");
KPLIB_PRST_CAT_ADD("vehTransPlC", "C_Van_02_vehicle_F");

// Civilian Utility Vehicles (KPLIB_preset_logisticPlC)
KPLIB_PRST_CAT_BEGIN("logisticPlC");
KPLIB_PRST_CAT_ADD("logisticPlC", "C_Offroad_01_repair_F");
KPLIB_PRST_CAT_ADD("logisticPlC", "C_Truck_02_box_F");
KPLIB_PRST_CAT_ADD("logisticPlC", "C_Truck_02_fuel_F");
KPLIB_PRST_CAT_ADD("logisticPlC", "C_Van_01_fuel_F");
KPLIB_PRST_CAT_ADD("logisticPlC", "C_Van_02_medevac_F");

// Civilian Helicopters (KPLIB_preset_heliTransPlC)
KPLIB_PRST_CAT_BEGIN("heliTransPlC");
KPLIB_PRST_CAT_ADD("heliTransPlC", "C_Heli_Light_01_civil_F");

// Civilian Planes (KPLIB_preset_planeTransPlC)
KPLIB_PRST_CAT_BEGIN("planeTransPlC");
KPLIB_PRST_CAT_ADD("planeTransPlC", "C_Plane_Civil_01_F");
KPLIB_PRST_CAT_ADD("planeTransPlC", "C_Plane_Civil_01_racing_F");


/*------------------------------------------------------------
    --- Humanitarian Institution ---
    Units/Vehicles from a humanitarian institution like IDAP.
------------------------------------------------------------*/

// Engineer (EOD Specialist)
KPLIB_PRST_SETVAR("rsEngineerIdap", "C_IDAP_Man_EOD_01_F");
// Helicopter Pilot
KPLIB_PRST_SETVAR("rsPilotHeliIdap", "C_IDAP_Pilot_01_F");
// Medic
KPLIB_PRST_SETVAR("rsMedicIdap", "C_IDAP_Man_Paramedic_01_F");
// Medical Truck
KPLIB_PRST_SETVAR("respawnTruckIdap", "C_IDAP_Van_02_medevac_F");

// IDAP Units (KPLIB_preset_unitsPlIdap)
KPLIB_PRST_CAT_BEGIN("unitsPlIdap");
KPLIB_PRST_CAT_ADD("idapUnitsPlC", "C_IDAP_Man_AidWorker_01_F");
KPLIB_PRST_CAT_ADD("idapUnitsPlC", "C_IDAP_Man_AidWorker_02_F");
KPLIB_PRST_CAT_ADD("idapUnitsPlC", "C_IDAP_Man_AidWorker_03_F");
KPLIB_PRST_CAT_ADD("idapUnitsPlC", "C_IDAP_Man_AidWorker_04_F");
KPLIB_PRST_CAT_ADD("idapUnitsPlC", "C_IDAP_Man_AidWorker_05_F");
KPLIB_PRST_CAT_ADD("idapUnitsPlC", "C_IDAP_Man_AidWorker_06_F");
KPLIB_PRST_CAT_ADD("idapUnitsPlC", "C_IDAP_Man_AidWorker_07_F");
KPLIB_PRST_CAT_ADD("idapUnitsPlC", "C_IDAP_Man_AidWorker_08_F");
KPLIB_PRST_CAT_ADD("idapUnitsPlC", "C_IDAP_Man_AidWorker_09_F");

// IDAP Cars (KPLIB_preset_vehLightUnarmedPlIdap)
KPLIB_PRST_CAT_BEGIN("vehLightUnarmedPlIdap");
KPLIB_PRST_CAT_ADD("vehLightUnarmedPlIdap", "C_IDAP_Offroad_01_F");
KPLIB_PRST_CAT_ADD("vehLightUnarmedPlIdap", "C_IDAP_Offroad_02_unarmed_F");
KPLIB_PRST_CAT_ADD("vehLightUnarmedPlIdap", "C_IDAP_Van_02_transport_F");

// IDAP Trucks (KPLIB_preset_vehTransPlIdap)
KPLIB_PRST_CAT_BEGIN("vehTransPlIdap");
KPLIB_PRST_CAT_ADD("vehTransPlIdap", "C_IDAP_Truck_02_F");
KPLIB_PRST_CAT_ADD("vehTransPlIdap", "C_IDAP_Truck_02_transport_F");

// Civilian Helicopters (KPLIB_preset_heliTransPlIdap)
KPLIB_PRST_CAT_BEGIN("heliTransPlIdap");
KPLIB_PRST_CAT_ADD("heliTransPlIdap", "C_IDAP_Heli_Transport_02_F");


/*-------------------------------
    !!! DO NOT EDIT BELOW !!!
-------------------------------*/

// Preset was properly parsed, if this is not set player will be informed about errors
KPLIB_validationNamespace setVariable [KPLIB_PRST_VAR("checkedC"), true];
