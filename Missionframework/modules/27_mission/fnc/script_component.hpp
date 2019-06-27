/*

    File: script_component.hpp
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-06-13
    Last Update: 2019-06-13
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Defines for mission module scripts
*/

// Mission get var
#define MGVAR(var, defVal)      (KPLIB_mission_data getVariable [var, defVal])
// Mission set var
#define MSVAR(var, val)         (KPLIB_mission_data setVariable [var, val, true])
