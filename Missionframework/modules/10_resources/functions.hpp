/*
    KP LIBERATION MODULE FUNCTIONS

    File: functions.hpp
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-12-13
    Last Update: 2018-12-16
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Defines for all functions, which are brought by this module.
*/

class res {
    file = "modules\10_resources\fnc";

    // Adds actions to spawned crates
    class res_addActions {};

    // Adds value to intel resource
    class res_addIntel {};

    // Displays amount of resources in crate
    class res_checkCrate {};

    // Creates a resource crate
    class res_createCrate {};

    // Gets storage attachTo positions
    class res_getAttachArray {};

    // Gets Z offset for crate storing
    class res_getCrateZ {};

    // Gets array with amounts of all resources at given location
    class res_getResTotal {};

    // Gets array with resource values of given storage
    class res_getStorageValue {};

    // Loads crate to transport vehicle
    class res_loadCrate {};

    // Loads module specific data from the save
    class res_loadData {};

    // Orders the crates in a storage area
    class res_orderStorage {};

    // Removes given amount of resources from given location
    class res_pay {};

    // Module post initialization
    class res_postInit {
        postInit = 1;
    };

    // Module pre initialization
    class res_preInit {
        preInit = 1;
    };

    // Push crate
    class res_pushCrate {};

    // Saves module specific data for the save
    class res_saveData {};

    // CBA Settings for this module
    class res_settings {};

    // Stack and sort crates inside storage area
    class res_stackNsort {};

    // Store crate in storage
    class res_storeCrate {};

    // Unloads crate from transport vehicle
    class res_unloadCrate {};

    // Unstores given kind of resource crate
    class res_unstoreCrate {};
};
