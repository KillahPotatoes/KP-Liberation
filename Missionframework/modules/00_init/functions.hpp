/*
	KP LIBERATION MODULE FUNCTIONS
	
	File: functions.hpp
	Author: Wyqer - https://github.com/Wyqer
	Date: 2017-10-16
	Last Update: 2018-03-29
	License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

	Description:
	Defines for all functions, which are brought by this module.
*/

class init {
    file = "modules\00_init\fnc";
    
    // Checks if given classname is inside CfgVehicles
    class init_checkClass {};

    // Create local client markers
    class init_clientMarkers {};

    // Fetches the mission parameters
    class init_fetchParams {
        preInit = 1;
    };

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

    // Client function for processing init data which was published by the server
    class init_receiveInit {};

    // Initializes full saves procedure for the running campaign
    class init_save {};

    // Saves module specific data for the save
    class init_saveData {};

    // Sorts sector markers and fills global sector arrays 
    class init_sortSectors {};

    // Completely wipes all data from the current campaign
    class init_wipe {}; 
};
