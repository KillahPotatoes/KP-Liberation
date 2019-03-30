/*
    KP LIBERATION PERSISTENCE MODULE FUNCTIONS

    File: functions.hpp
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-02-02
    Last Update: 2019-03-30
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Defines for all functions, which are brought by persistence module.
*/

class persistence {
    file = "modules\03_persistence\fnc";

    class persistence_addPersistentVar {};

    class persistence_deserializeObject {};

    class persistence_deserializeUnit {};

    class persistence_getCargo {};

    // Loads module specific data from the save
    class persistence_loadData {};

    class persistence_makePersistent {};

    // Persistence pre initialization
    class persistence_preInit {
        preInit = 1;
    };

    // Saves module specific data for the save
    class persistence_saveData {};

    // Serialize vehicle into an array
    class persistence_serializeObject {};

    class persistence_serializeUnit {};

    class persistence_serializeVars {};

    class persistence_setCargo {};

    class persistence_setTurretMagazines {};
};
