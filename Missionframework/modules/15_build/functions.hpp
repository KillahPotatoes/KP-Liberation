/*
    KP LIBERATION MODULE FUNCTIONS

    File: functions.hpp
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-07-01
    Last Update: 2018-12-11
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Defines for all functions, which are brought by this module.
*/

class build {
    file = "modules\15_build\fnc";

    // Adds buildable items
    class build_addBuildables {};

    // Manages selection depending on currently pressed keys
    class build_addToSelection {};

    // PFH that renders bouding boxes for objects in queue
    class build_boundingBoxPFH {};

    // PFH limiting camera flying area
    class build_camAreaLimiter {};

    // Creates the build camera
    class build_camCreate {};

    // Change queue mode between moving existing items and placing new
    class build_changeQueueMode {};

    // Confirms all items in queue
    class build_confirmAll {};

    // Confirms single item from queue
    class build_confirmSingle {};

    // Display initialization
    class build_displayLoad {};

    // Place object in build queue
    class build_displayPlaceObject {};

    // Set display build mode (tab)
    class build_displayFillList {};

    // Handle tab click
    class build_displayTabClick {};

    // Handle build display unload
    class build_displayUnload {};

    // Draws bounding box on single object
    class build_drawBoundingBox {};

    // PFH that draws icons in 3D space
    class build_drawIconsPFH {};

    // Handle object dragging/positon changing
    class build_handleDrag {};

    // Handles FOB build confirmation
    class build_handleFobBuildConfirm {};

    // Handle display keypresses
    class build_handleKeys {};

    // Mouse movement and click handler
    class build_handleMouse {};

    // Handle object dragging/rotation
    class build_handleRotation {};

    // Handle persistent data loading
    class build_loadData {};

    // Marks given area with circle created out of spheres
    class build_markArea {};

    // Get user interface item color depending on object state
    class build_objectColor {};

    // Return object under cursor
    class build_objectUnderCursor {};

    // Module post initialization
    class build_postInit {
        postInit = 1;
    };

    // Module pre initialization
    class build_preInit {
        preInit = 1;
    };

    // Removes buildable items from category
    class build_removeBuildables {};

    // Handle persistent data saving
    class build_saveData {};

    // Add player actions
    class build_setupPlayerActions {};

    // Start building logic
    class build_start {};

    // Start building logic for single item build
    class build_start_single {};

    // Stop building logic
    class build_stop {};

    // Returns surface that is directly under cursor
    class build_surfaceUnderCursor {};

    // Checks if object position is valid for building
    class build_validatePosition {};
};
