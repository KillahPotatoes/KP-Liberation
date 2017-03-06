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
for "_i" from 1 to 5 do {_unit addItemToBackpack "150Rnd_762x54_Box_Tracer";};
_unit addHeadgear "H_Watchcap_khk";
_unit addGoggles "G_Balaclava_lowprofile";
_unit addWeapon "LMG_Zafir_F";
_unit addWeapon "hgun_P07_F";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";