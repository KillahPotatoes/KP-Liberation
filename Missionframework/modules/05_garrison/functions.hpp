/*
    KP LIBERATION MODULE FUNCTIONS

    File: functions.hpp
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-10-18
    Last Update: 2018-10-20
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Defines for all functions, which are brought by this module.
*/

class garrison {
    file = "modules\05_garrison\fnc";

    // Despawns the remaining garrison and updates the garrison array upon sector deactivation
    class garrison_despawn {};

    // Loads module specific data from the save
    class garrison_loadData {};

    // Module post initialization
    class garrison_postInit {
        postInit = 1;
    };

    // Module pre initialization
    class garrison_preInit {
        preInit = 1;
    };

    // Saves module specific data for the save
    class garrison_saveData {};

    // Spawns the garrison upon sector activation
    class garrison_spawn {};

    // Spawns an infantry patrol at a sector
    class garrison_spawnSectorPatrol {};
};
