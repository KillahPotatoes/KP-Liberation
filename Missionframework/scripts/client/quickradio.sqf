player linkItem "tf_pnr1000a";
player linkItem "tf_microdagr";
[quickarsenal] call CBA_fnc_removePlayerAction;
quickarsenalpresent = false;
hint "You should now have a radio. Default frequencies set. This action is removed until you respawn.";
sleep 4;
[(call TFAR_fnc_activeSwRadio), 1, "50"] call TFAR_fnc_SetChannelFrequency;
[(call TFAR_fnc_activeSwRadio), 2, "60"] call TFAR_fnc_SetChannelFrequency;
[(call TFAR_fnc_activeSwRadio), 3, "70"] call TFAR_fnc_SetChannelFrequency;
