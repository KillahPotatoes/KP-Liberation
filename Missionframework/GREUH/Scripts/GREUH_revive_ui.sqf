
_dialog = createDialog "GREUH_respawn";

waitUntil { dialog };

_labelwidth = -1;
_labelpos = [];
_tick = 0;
replace_ai = 0;


while { dialog && alive player } do {
	if ( !isNil "public_bleedout_message" && !isNil "public_bleedout_timer") then {
		if (_labelwidth == -1) then { _labelwidth = (ctrlPosition ((findDisplay 5566) displayCtrl 6699)) select 2 };
		_labelpos = [ctrlPosition ((findDisplay 5566) displayCtrl 6699) select 0, ctrlPosition ((findDisplay 5566) displayCtrl 6699) select 1,_labelwidth * (public_bleedout_timer / FAR_BleedOut), ctrlPosition ((findDisplay 5566) displayCtrl 6699) select 3];
		((findDisplay 5566) displayCtrl 6699) ctrlSetPosition _labelpos;
		ctrlSetText [5567,public_bleedout_message];

		if (public_bleedout_timer <= 30) then {
			((findDisplay 5566) displayCtrl 5567) ctrlSetTextColor [1, 0, 0, 1];
			if ( public_bleedout_timer % 2 == 0 ) then {
				((findDisplay 5566) displayCtrl 6698) ctrlSetTextColor [1, 0, 0, 1];
			} else {
				((findDisplay 5566) displayCtrl 6698) ctrlSetTextColor [1, 1, 1, 1];
			}
		} else {
			((findDisplay 5566) displayCtrl 5567) ctrlSetTextColor [1, 1, 1, 1];
		};
		((findDisplay 5566) displayCtrl 6699) ctrlCommit 0.5;
		((findDisplay 5566) displayCtrl 6698) ctrlCommit 0.5;

	};
	if ( _tick % 10 == 0 ) then {
		[ 10000 ] call BIS_fnc_bloodEffect;
	};
	_tick = _tick + 1;

	_nearby_ais = [ units group player, { !(isPlayer _x) && (_x distance player < 100) } ] call BIS_fnc_conditionalSelect;
	if ( count _nearby_ais > 0 ) then {
		_nearby_ai = ( [ _nearby_ais , [] , { _x distance player } , 'ASCEND' ] call BIS_fnc_sortBy ) select 0;
		((findDisplay 5566) displayCtrl 678) ctrlEnable true;
		((findDisplay 5566) displayCtrl 678) ctrlShow true;

		if ( replace_ai > 0 && (alive _nearby_ai) ) then {
			cutText [ "","BLACK IN", 3 ];
			GRLIB_replace_ai = true;
			player setVariable ["FAR_isUnconscious", 0, true];
			_ai_pos = getposATL _nearby_ai;
			_ai_dir = getDir _nearby_ai;
			_ai_damage = damage _nearby_ai;
			deleteVehicle _nearby_ai;
			player setPosATL _ai_pos;
			player setDir _ai_dir;
			player setDamage _ai_damage;
		};
	} else {
		replace_ai = 0;
		((findDisplay 5566) displayCtrl 678) ctrlEnable false;
		((findDisplay 5566) displayCtrl 678) ctrlShow false;
	};

	sleep 0.25;
};