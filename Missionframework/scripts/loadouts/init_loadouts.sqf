_is_rhs = false;
_rhs_classnames = [ "rhs_weap_ak74m_camo_folded","rhs_weap_ak74m_camo_npz","rhs_weap_pkm","rhs_weap_akms","rhs_weap_ak74m_camo_npz","rhs_weap_svdp_wd_npz","rhs_weap_akm","rhs_weap_rpg7" ];

if ( count ( [ _rhs_classnames, { isClass ( configFile / "cfgWeapons" / _x ) } ] call BIS_fnc_conditionalSelect ) == ( count _rhs_classnames ) ) then { _is_rhs = true };

_loadouts_folder = "scripts\loadouts\vanilla\";
if ( _is_rhs ) then { _loadouts_folder = "scripts\loadouts\rhs\"; };

loadout_crewman = compile preprocessFileLineNumbers (format ["%1%2.sqf", _loadouts_folder, "crewman" ]);
loadout_sl = compile preprocessFileLineNumbers (format ["%1%2.sqf", _loadouts_folder, "sl" ]);
loadout_rifleman = compile preprocessFileLineNumbers (format ["%1%2.sqf", _loadouts_folder, "rifleman" ]);
loadout_autorifleman = compile preprocessFileLineNumbers (format ["%1%2.sqf", _loadouts_folder, "autorifleman" ]);
loadout_rifleman_light = compile preprocessFileLineNumbers (format ["%1%2.sqf", _loadouts_folder, "rifleman_light" ]);
loadout_marksman = compile preprocessFileLineNumbers (format ["%1%2.sqf", _loadouts_folder, "marksman" ]);
loadout_at = compile preprocessFileLineNumbers (format ["%1%2.sqf", _loadouts_folder, "at" ]);

militia_standard_squad = [ loadout_sl, loadout_autorifleman, loadout_rifleman, loadout_rifleman, loadout_rifleman_light, loadout_rifleman_light, loadout_marksman, loadout_at, loadout_at, loadout_at ];