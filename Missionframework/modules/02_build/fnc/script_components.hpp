/*

    File: script_components.hpp
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-10-07
    Last Update: 2018-10-07
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    -

    Parameter(s):
    NONE

    Returns:
    NOTHING
*/

// Logic get var
#define LGVAR(var)               (KPLIB_buildLogic getVariable #var)
// Logic set var
#define LSVAR(var, val)          (KPLIB_buildLogic setVariable [#var, val])
