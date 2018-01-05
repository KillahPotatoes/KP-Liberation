waitUntil {!isNil "KPLIB_initDone"};
waitUntil {KPLIB_initDone};

// Remove all items
removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;

// Add basic items
player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "ItemWatch";
player linkItem "ItemRadio";

// Disable fatique if selected in parameters
if (KPLIB_param_fatigue == 0) then {
	player enableStamina false;
};

// Spawn redeploy dialog
[] spawn KPLIB_fnc_core_redeploy;
