/*
    KPLIB_fnc_cratefiller_getConfigPath

    File: fn_cratefiller_getConfigPath.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-04-05
    Last Update: 2019-04-06
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Gets the config path / type of the given classname.

    Parameter(s):
        _classname - Classname which should be checked [STRING, defaults to ""]

    Returns:
        Config path [STRING]
*/

params [
    ["_classname", "", [""]]
];

// find configclass
switch true do
{
    case (isClass (configFile >> "CfgMagazines" >> _classname)): {"CfgMagazines"};
    case (isClass (configFile >> "CfgWeapons" >> _classname)): {"CfgWeapons"};
    case (isClass (configFile >> "CfgVehicles" >> _classname)): {"CfgVehicles"};
    case (isClass (configFile >> "CfgGlasses" >> _classname)): {"CfgGlasses"};
    default {""};
};
