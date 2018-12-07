#include "script_component.hpp"
/*
    KP Liberation Vanilla Civilian Preset

    File: vanilla.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-12-07
    Last Update: 2018-12-07
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Vanilla civilian preset file which contains only vanilla assets.

    Needed Mods:
        - None

    Optional Mods:
        - None
*/

// Civilian Citizens (KPLIB_preset_unitsC)
KPLIB_PRST_CAT_BEGIN("units");
KPLIB_PRST_CAT_ADD("units", "C_Man_Fisherman_01_F");
KPLIB_PRST_CAT_ADD("units", "C_man_w_worker_F");
KPLIB_PRST_CAT_ADD("units", "C_man_1_1_F");
KPLIB_PRST_CAT_ADD("units", "C_man_p_beggar_F");
KPLIB_PRST_CAT_ADD("units", "C_Man_Messenger_01_F");
KPLIB_PRST_CAT_ADD("units", "C_man_hunter_1_F");
KPLIB_PRST_CAT_ADD("units", "C_journalist_F");
KPLIB_PRST_CAT_ADD("units", "C_Journalist_01_War_F");
KPLIB_PRST_CAT_ADD("units", "C_man_shorts_2_F");
KPLIB_PRST_CAT_ADD("units", "C_Man_UtilityWorker_01_F");
KPLIB_PRST_CAT_ADD("units", "C_man_1");
KPLIB_PRST_CAT_ADD("units", "C_Man_casual_1_F");
KPLIB_PRST_CAT_ADD("units", "C_Man_casual_2_F");
KPLIB_PRST_CAT_ADD("units", "C_Man_casual_3_F");
KPLIB_PRST_CAT_ADD("units", "C_Man_casual_4_F");
KPLIB_PRST_CAT_ADD("units", "C_Man_casual_5_F");
KPLIB_PRST_CAT_ADD("units", "C_Man_casual_6_F");
KPLIB_PRST_CAT_ADD("units", "C_man_polo_1_F");
KPLIB_PRST_CAT_ADD("units", "C_man_polo_2_F");
KPLIB_PRST_CAT_ADD("units", "C_man_polo_3_F");
KPLIB_PRST_CAT_ADD("units", "C_man_polo_4_F");
KPLIB_PRST_CAT_ADD("units", "C_man_polo_5_F");
KPLIB_PRST_CAT_ADD("units", "C_man_polo_6_F");

// Civilian Cars (KPLIB_preset_vehLightUnarmedC)
KPLIB_PRST_CAT_BEGIN("vehLightUnarmed");
KPLIB_PRST_CAT_ADD("vehLightUnarmed", "C_Quadbike_01_F");
KPLIB_PRST_CAT_ADD("vehLightUnarmed", "C_Hatchback_01_F");
KPLIB_PRST_CAT_ADD("vehLightUnarmed", "C_Hatchback_01_sport_F");
KPLIB_PRST_CAT_ADD("vehLightUnarmed", "C_Offroad_01_F");
KPLIB_PRST_CAT_ADD("vehLightUnarmed", "C_SUV_01_F");
KPLIB_PRST_CAT_ADD("vehLightUnarmed", "C_Van_01_box_F");
KPLIB_PRST_CAT_ADD("vehLightUnarmed", "C_Van_02_transport_F");

// Civilian Trucks (KPLIB_preset_vehTransC)
KPLIB_PRST_CAT_BEGIN("vehTrans");
KPLIB_PRST_CAT_ADD("vehTrans", "C_Truck_02_covered_F");
KPLIB_PRST_CAT_ADD("vehTrans", "C_Truck_02_transport_F");
KPLIB_PRST_CAT_ADD("vehTrans", "C_Van_01_transport_F");
KPLIB_PRST_CAT_ADD("vehTrans", "C_Van_02_vehicle_F");

// Civilian Utility Vehicles (KPLIB_preset_logisticC)
KPLIB_PRST_CAT_BEGIN("logistic");
KPLIB_PRST_CAT_ADD("logistic", "C_Offroad_01_repair_F");
KPLIB_PRST_CAT_ADD("logistic", "C_Truck_02_box_F");
KPLIB_PRST_CAT_ADD("logistic", "C_Truck_02_fuel_F");
KPLIB_PRST_CAT_ADD("logistic", "C_Van_01_fuel_F");
KPLIB_PRST_CAT_ADD("logistic", "C_Van_02_medevac_F");

// Civilian Helicopters (KPLIB_preset_heliTransC)
KPLIB_PRST_CAT_BEGIN("heliTrans");
KPLIB_PRST_CAT_ADD("heliTrans", "C_Heli_Light_01_civil_F");

// Civilian Planes (KPLIB_preset_planeTransC)
KPLIB_PRST_CAT_BEGIN("planeTrans");
KPLIB_PRST_CAT_ADD("planeTrans", "C_Plane_Civil_01_F");
KPLIB_PRST_CAT_ADD("planeTrans", "C_Plane_Civil_01_racing_F");


/*-------------------------------
    !!! DO NOT EDIT BELOW !!!
-------------------------------*/

// Preset was properly parsed, if this is not set player will be informed about errors
KPLIB_validationNamespace setVariable [KPLIB_PRST_VAR("checked"), true];
