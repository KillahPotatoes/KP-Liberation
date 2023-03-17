// Carry Weight

player addEventHandler ["InventoryOpened", {
[] spawn {
waitUntil {!isNull (findDisplay 602)}; // Wait until the right dialog is really open
player addEventHandler ["InventoryClosed", {
removeMissionEventHandler ["Draw3D", missionNamespace getVariable "WGP_UI_redraw"];
}];
_whileopen = addMissionEventHandler ["Draw3D", {
_load = str round ((loadAbs player)/10); // Load rounded to whole number. Change the "^2" to change the number of decimal places.
_playerHealth = str round ((1 - (damage player))*100); // Health rounded and multiplied to display as 100%
(findDisplay 602 displayCtrl 111) ctrlSetText (name player + format [" Carrying: %1/100kg Health: %2", _load, _playerHealth] +"%" );
}];
missionNamespace setVariable ["WGP_UI_redraw", _whileopen];
};
}];

// Bleedout Timer
player addEventHandler ["animChanged", {
  params ["_unit","_anim"];
  if ("uncons" in toLowerAnsi _anim) then {
    [_unit,_anim] spawn {
      params ["_unit","_anim"];
      private _time = diag_tickTime -3;
      while {lifeState _unit == "incapacitated"} do {
	      _color = "#45f442"; //green
	      if (diag_tickTime >= (_time + 480)) then {_color = "#eef441";}; //yellow
	      if (diag_tickTime >= (_time + 540)) then {_color = "#ff0000";}; //red
	      if (diag_tickTime >= (_time + 600)) exitWith {
		      hintSilent parseText format ["<t color='%1'>--- Time is up! ---</t>",_color];
	      };
	        hintSilent parseText format ["Time Left:<br/><t color='%1'>--- %2 ---</t>", _color, [(bis_revive_bleedOutDuration - (diag_tickTime - _time))/60,"HH:MM:SS"] call BIS_fnc_timetostring];
      };
        uisleep 1
    };
      hintSilent ""
  }
}];