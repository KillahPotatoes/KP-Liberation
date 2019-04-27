/*

    File: script_component.hpp
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-04-11
    Last Update: 2019-04-27
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

    Description:
        Defines for cratefiller module scripts
*/

// Cratefiller get var
#define CGVAR(var, defVal)      (KPLIB_cratefiller_data getVariable [var, defVal])
// Cratefiller set var
#define CSVAR(var, val)         (KPLIB_cratefiller_data setVariable [var, val, true])

// Cratefiller cache get var
#define CCGVAR(var, defVal)     (KPLIB_cratefiller_cache getVariable [var, defVal])
// Cratefiller cache set var
#define CCSVAR(var, val, pub)   (KPLIB_cratefiller_cache setVariable [var, val, pub])
