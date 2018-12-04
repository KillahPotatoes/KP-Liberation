/*
    KP LIBERATION MODULE FUNCTIONS

    File: functions.hpp
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-06-02
    Last Update: 2018-11-10
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Defines for all functions, which are brought by this module.
*/

class plm {
    file = "modules\13_plm\fnc";

    // Apply and save settings
    class plm_apply {};

    // Creates a new group
    class plm_create {};

    // Apply view distance and sound volume
    class plm_getInOut {};

    // Joins selected group
    class plm_join {};

    // Open the dialog
    class plm_openDialog {};

    // Module post initialization
    class plm_postInit {
        postInit = 1;
    };

    // Module pre initialization
    class plm_preInit {
        preInit = 1;
    };

    // Applies new name to group
    class plm_rename {};

    // Save dialog settings
    class plm_save {};

    // Get and display KP Ranks data
    class plm_showRankData {};
};
