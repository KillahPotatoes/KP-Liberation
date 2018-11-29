/*

    File: script_components.hpp
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-10-07
    Last Update: 2018-11-09
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Defines for build module scripts
*/

// Logic get var
#define LGVAR(var)               (KPLIB_buildLogic getVariable #var)
// Logic get var with default val
#define LGVAR_D(var, defVal)     (KPLIB_buildLogic getVariable [#var, defVal])
// Logic set var
#define LSVAR(var, val)          (KPLIB_buildLogic setVariable [var, val])
