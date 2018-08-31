/*
    KP LIBERATION FUNCTION FETCHING FILE

    File: KPLIB_functions.hpp
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2017-10-16
    Last Update: 2018-08-31
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Fetches all functions from the modules.
*/

class CfgFunctions {
    class KPLIB {
        // Include procedures and functions from each module
        #include "modules\00_init\functions.hpp"
        #include "modules\01_core\functions.hpp"
        #include "modules\02_build\functions.hpp"
        #include "modules\99_adm\functions.hpp"
        #include "modules\99_plm\functions.hpp"
    };
};
