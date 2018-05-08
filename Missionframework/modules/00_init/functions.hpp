/*
    KP LIBERATION MODULE FUNCTIONS

    File: functions.hpp
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2017-10-16
    Last Update: 2018-05-02
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Defines for all functions, which are brought by this module.
*/

class init {
    file = "modules\00_init\fnc";

    // Checks if given classname is inside CfgVehicles
    class init_checkClass {};

    // Creates local client markers
    class init_clientMarkers {};

    // Creates locked vehicle markers
    class init_createLockedVehMarkers {};

    // Initializes the virtual arsenal
    class init_fillArsenal {};

    // Filters not available classnames out of a given array of classnames
    class init_filterMods {};

    // Initializes full load procedure for the saved campaign
    class init_load {};

    // Loads module specific data from the save
    class init_loadData {};

    // Loads and checks the configured unit presets
    class init_loadPresets {};

    // Fetches the mission parameters and saves them
    class init_paramFetchAll {};

    // Loads param from KPLIB persistent params array
    class init_paramLoad {};

    // Creates variable from param name and value in format of "KPLIB_param_<name>"
    class init_paramVarCreate {};

    // Client function for processing init data which was published by the server
    class init_receiveInit {};

    // Initializes full saves procedure for the running campaign
    class init_save {};

    // Saves module specific data for the save
    class init_saveData {};

    // Setups global variables from params
    // Also initializes mission config
    class init_setupConfig {
        preInit = 1;
    };

    // Sorts sector markers and fills global sector arrays
    class init_sortSectors {};

    // Completely wipes all data from the current campaign
    class init_wipe {};
};
