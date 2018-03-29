/*
	KPLIB_fnc_init_wipe
	
	File: fn_init_wipe.sqf
	Author: Wyqer - https://github.com/Wyqer
	Date: 2018-03-29
	Last Update: 2018-03-29
	License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

	Description:
	Wipes all save data.

	Parameter(s):
	NONE

	Returns:
	BOOL
*/

profileNamespace setVariable [KPLIB_save_key, nil];
saveProfileNamespace;
diag_log "[KP LIBERATION] [IMPORTANT] Save wiped";

true
