/*
    KP LIBERATION MODULE FUNCTIONS

    File: functions.hpp
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-02-02
    Last Update: 2019-02-18
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Defines for all functions, which are brought by this module.
*/

class civilian {
    file = "modules\20_civilian\fnc";

    // Loads module specific data from the save
    class civilian_loadData {};

    // Module post initialization
    class civilian_postInit {
        postInit = 1;
    };

    // Module pre initialization
    class civilian_preInit {
        preInit = 1;
    };

    // Saves module specific data for the save
    class civilian_saveData {};

    // CBA Settings for this module
    class civilian_settings {};

    // Despawn civilians on sector deactivation
    class civilian_despawn {};

    // Spawn civilians on sector activation
    class civliian_spawn {};

    // Spawn a single civ agent on foot
    class civilian_spawnCiv {};

    // Spawn a civilian vehicle (empty, or manned)
    class civilian_spawnVeh {};

    // Spawn a crowd of civilians in intersection??
    class civilian_spawnCrowd {};

};
