_unit = _this select 0;

removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;

sleep 0.5;

_unit addVest "V_I_G_ResistanceLeader_F";
_unit addItemToVest "FirstAidKit";
for "_i" from 1 to 2 do {_unit addItemToVest "MiniGrenade";};
_unit addItemToVest "SmokeShell";
for "_i" from 1 to 2 do {_unit addItemToVest "16Rnd_9x21_Mag";};
_unit addBackpack "B_TacticalPack_oli";
_unit addItemToVest "rhs_100Rnd_762x54mmR_green";
for "_i" from 1 to 4 do {_unit addItemToBackpack "rhs_100Rnd_762x54mmR_green";};
_unit addHeadgear "H_Watchcap_khk";
_unit addGoggles "G_Balaclava_lowprofile";
_unit addWeapon "rhs_weap_pkm";
_unit addWeapon "hgun_P07_F";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";