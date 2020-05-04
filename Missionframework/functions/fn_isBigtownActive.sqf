/*
    File: fn_isBigtownActive.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-12-03
    Last Update: 2019-12-11
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Checks if a bigtown (capital) is currently activated.

    Parameter(s):
        NONE

    Returns:
        Bigtown currently activated [BOOL]
*/

(active_sectors findIf {_x in sectors_bigtown}) != -1
