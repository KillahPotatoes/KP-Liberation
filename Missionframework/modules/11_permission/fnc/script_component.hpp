/*

    File: script_component.hpp
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-12-29
    Last Update: 2019-04-11
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Defines for permission module scripts
*/

#define KPLIB_COLOR_RED    [0.9, 0, 0, 1]
#define KPLIB_COLOR_GREEN  [0, 0.8, 0, 1]
#define KPLIB_COLOR_WHITE  [1, 1, 1, 1]
#define KPLIB_COLOR_ORANGE [1, 0.5, 0, 0.8]

// Permission get var
#define PGVAR(var, defVal)      (KPLIB_permission_data getVariable [var, defVal])
// Permission set var
#define PSVAR(var, val)         (KPLIB_permission_data setVariable [var, val, true])
