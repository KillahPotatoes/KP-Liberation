/*
    KP LIBERATION MODULE FUNCTIONS

    File: functions.hpp
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-01-16
    Last Update: 2019-02-24
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Defines for all functions, which are brought by this module.
*/

class logi {
    file = "modules\23_logistic\fnc";

    // Adds the logistic actions
    class logi_addActions {};

    // Adds a new menu to the logistic main menu
    class logi_addMenu {};

    // Calculates the costs of the resupply action
    class logi_calcCosts {};

    // Open the logistioc main dialog
    class logi_openDialog {};

    // Opens the logistic recycle dialog
    class logi_openRecycleDialog {};

    // Opens the logistic resupply dialog
    class logi_openResupplyDialog {};

    // Module post initialization
    class logi_postInit {
        postInit = 1;
    };

    // Module pre initialization
    class logi_preInit {
        preInit = 1;
    };

    // Recycles the selected vehicle
    class logi_recycleTarget {};

    // Refreshes the vehicle list for the given dialog
    class logi_refreshTargets {};

    // Resupplies the given vehicle
    class logi_resupplyTarget {};

    // Selects the vehicle from the combo cox and fills the dialog
    class logi_selectRecycleTarget {};

    // Selects the vehicle from the combo cox and fills the dialog
    class logi_selectResupplyTarget {};

    // CBA Settings initialization for this module
    class logi_settings {};
};
