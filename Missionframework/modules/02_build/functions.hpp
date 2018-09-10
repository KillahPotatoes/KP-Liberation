/*
    KP LIBERATION MODULE FUNCTIONS

    File: functions.hpp
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-07-01
    Last Update: 2018-08-31
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Defines for all functions, which are brought by this module.
*/

class build {
    file = "modules\02_build\fnc";

    // PFH limiting camera flying area
    class build_camAreaLimiter {};

    // Open build menu
    class build_camCreate {};

    // Display initialization
    class build_displayLoad {};

    // Place object in build queue
    class build_displayPlaceObject {};

    // Set display build mode (tab)
    class build_displaySetMode {};

    // Handle tab click
    class build_displayTabClick {};

    // Display load handler
    class build_displayUnload {};

    // Mouse movement and click handler
    class build_handleMouse {};

    // Module initialization
    class build_initModule {
        postInit = 1;
    };

    // Marks given area with circle created out of spheres
    class build_markArea {};

    class build_setupPlayerActions {};

    // Start building logic
    class build_start {};

    class build_stop {};
};
