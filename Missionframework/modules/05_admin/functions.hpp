/*
    KP LIBERATION MODULE FUNCTIONS

    File: functions.hpp
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-08-02
    Last Update: 2019-04-22
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Defines for all functions, which are brought by this module.
*/

class adm {
    file = "modules\05_admin\fnc";

    // Deletes exported data in the players profile
    class admin_deleteExport {};

    // Exports current save data to the players profile
    class admin_exportSave {};

    // Imports save data from the players profile
    class admin_importSave {};

    // Applies provided save data for import to the server profile
    class admin_importSaveServer {};

    // Opens the admin menu dialog
    class admin_openDialog {};

    // Module post initialization
    class admin_postInit {
        postInit = 1;
    };

    // Module pre initialization
    class admin_preInit {
        preInit = 1;
    };

    // Export current campaign to admins profile and requests server to wipe the saved campaign
    class admin_wipe {};
};
