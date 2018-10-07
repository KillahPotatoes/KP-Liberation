/*
    KP LIBERATION MODULE FUNCTIONS

    File: functions.hpp
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-07-01
    Last Update: 2018-10-07
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Defines for all functions, which are brought by this module.
*/

class build {
    file = "modules\02_build\fnc";

    class build_addToSelection {};

    // PFH that renders bouding boxes for objects in queue
    class build_boundingBoxPFH {};

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

    class build_drawBoundingBox {};

    class build_handleDrag {};

    // Mouse movement and click handler
    class build_handleMouse {};

    // Handle object dragging/rotation
    class build_handleRotation {};

    // Module initialization
    class build_initModule {
        postInit = 1;
    };

    // Marks given area with circle created out of spheres
    class build_markArea {};

    // Return object under cursor
    class build_objectUnderCursor {};

    class build_setupPlayerActions {};

    // Start building logic
    class build_start {};

    class build_stop {};
};
