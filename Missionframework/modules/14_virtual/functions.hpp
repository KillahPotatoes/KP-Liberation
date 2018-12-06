/*
    KP LIBERATION MODULE FUNCTIONS

    File: functions.hpp
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-11-18
    Last Update: 2018-11-27
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Defines for all functions, which are brought by this module.
*/

class virtual {
    file = "modules\14_virtual\fnc";

    // Adds curator to player
    class virtual_addCurator {};

    // Limit curator editing area
    class virtual_curatorAreaLimit {};

    // Remove curator FOB indicators
    class virtual_curatorRemoveFobIcons {};

    // Update curator FOB indicators
    class virtual_curatorUpdateFobIcons {};

    // Initializes curator handling for player
    class virtual_initCuratorOnPlayer {};

    // Module post initialization
    class virtual_postInit {
        postInit = 1;
    };

    // Module pre initialization
    class virtual_preInit {
        preInit = 1;
    };

    // Remove curator to player
    class virtual_removeCurator {};

    // Setup settings for this module
    class virtual_settings {};

};
