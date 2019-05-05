/*

    File: script_component.hpp
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-04-11
    Last Update: 2019-04-11
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Defines for logistic module scripts
*/

// Logistic get var
#define LGVAR(var, defVal)      (KPLIB_logistic_data getVariable [var, defVal])
// Logistic set var
#define LSVAR(var, val)         (KPLIB_logistic_data setVariable [var, val, true])
