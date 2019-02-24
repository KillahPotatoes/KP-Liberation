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

class logistic {
    file = "modules\23_logistic\fnc";

    // Adds the logistic actions
    class logistic_addActions {};

    // Adds a new menu to the logistic main menu
    class logistic_addMenu {};

    // Calculates the costs of the resupply action
    class logistic_calcCosts {};

    // Open the logistioc main dialog
    class logistic_openDialog {};

    // Opens the logistic recycle dialog
    class logistic_openRecycleDialog {};

    // Opens the logistic resupply dialog
    class logistic_openResupplyDialog {};

    // Module post initialization
    class logistic_postInit {
        postInit = 1;
    };

    // Module pre initialization
    class logistic_preInit {
        preInit = 1;
    };

    // Recycles the selected vehicle
    class logistic_recycleTarget {};

    // Refreshes the vehicle list for the given dialog
    class logistic_refreshTargets {};

    // Resupplies the given vehicle
    class logistic_resupplyTarget {};

    // Selects the vehicle from the combo cox and fills the dialog
    class logistic_selectRecycleTarget {};

    // Selects the vehicle from the combo cox and fills the dialog
    class logistic_selectResupplyTarget {};

    // CBA Settings initialization for this module
    class logistic_settings {};
};
