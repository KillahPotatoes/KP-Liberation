#include "..\ui\defines.hpp"
#include "script_components.hpp"
/*
    KPLIB_fnc_build_searchClear

    File: fn_build_searchClear.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-04-29
    Last Update: 2019-04-30
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

    Description:
        Clears build list search.

    Parameter(s):
        NONE

    Returns:
        Search was cleared [BOOL]
*/

// Clear search box
private _searchBox = LGVAR(display) displayCtrl KPLIB_IDC_BUILD_SEARCH;
_searchBox ctrlSetText "";
// Update list
[] call KPLIB_fnc_build_displayFillList;

true
