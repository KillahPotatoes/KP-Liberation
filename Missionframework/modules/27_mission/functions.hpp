/*
    KP LIBERATION MODULE FUNCTIONS

    File: functions.hpp
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-06-09
    Last Update: 2019-06-23
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Defines for all functions, which are brought by this module.
*/

class mission {
    file = "modules\27_mission\fnc";

    // Aborts the given mission
    class mission_abortMission {};

    // Selects which mission should be started/aborted and starts th next function
    class mission_buttonClick {};

    // Displays the information for the given mission
    class mission_displayMission {};

    // Deletes the mission from the running missions
    class mission_endMission {};

    // Loads module specific data from the save
    class mission_loadData {};

    // Opens the mission dialog
    class mission_openDialog {};

    // Module post initialization
    class mission_postInit {
        postInit = 1;
    };

    // Checks the mission conditions on a changing selection and disables the button
    class mission_preCheck {};

    // Module pre initialization
    class mission_preInit {
        preInit = 1;
    };

    // Reads the data of the given listbox
    class mission_readData {};

    // Registers a mission for the usage as event or "buyable" sidemission
    class mission_registerMission {};

    // Saves module specific data for the save
    class mission_saveData {};

    // CBA Settings initialization for this module
    class mission_settings {};

    // Initialization of actions available to players
    class mission_setupPlayerActions {};

    // Starts the given mission or selects one from the given array
    class mission_startMission {};

};
