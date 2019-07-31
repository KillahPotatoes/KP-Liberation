waitUntil {!isNil "GRLIB_permissions"};

private _players_array = [];
private _uids_array = ["Default"];
private _dialog = createDialog "liberation_permissions";
permission_playerid = -1;
permission_toset = -1;
save_changes = 0;

color_authorized = [0,0.9,0,1];
color_denied = [0.9,0,0,1];
fontsize = 0.017 * safezoneH;

private _modify_permissions = +GRLIB_permissions;

disableSerialization;

waitUntil { dialog };


permission_create_activetext = compileFinal '

	params ["_idx", "_column", "_permission", "_text", "_tooltip"];

	private _control = (findDisplay 5118) ctrlCreate ["RscActiveText", ((10 * _idx) + 111) + _column, (findDisplay 5118) displayCtrl 9969];
	_control ctrlSetPosition [0.072 * _column * safeZoneW, (_idx * 0.025) * safezoneH, 0.072 * safeZoneW, 0.025  * safezoneH];
	_control ctrlSetText _text;
	_control ctrlSetFontHeight fontsize;
	_control ctrlSetTooltip _tooltip;
	buttonSetAction [((10 * _idx) + 111) + _column, format ["permission_playerid = %1; permission_toset = %2;", _idx, _permission]];
	_control ctrlSetTextColor color_denied;
	_control ctrlSetActiveColor color_denied;
	_control ctrlCommit 0;

';



_players_array pushback ["Default", localize "STR_DEFAULT", 0];
private _idx = 2;

{
	if (!((name _x) in ["HC1", "HC2", "HC3"])) then {
		private _nextplayer = _x;

		private _displayname = "";
		if(count (squadParams _nextplayer) != 0) then {
			_displayname = "[" + ((squadParams _nextplayer select 0) select 0) + "] ";
		};
		_displayname = _displayname + name _nextplayer;

		_players_array pushback [getPlayerUID _nextplayer, _displayname, _idx];
		_uids_array pushBack getPlayerUID _nextplayer;

		_idx = _idx + 1;
	};
} foreach allPlayers;

_idx = _idx + 1;

{
	if !((_x select 0) in _uids_array) then {
		_players_array pushBack [_x select 0, _x select 1, _idx];
		_idx = _idx + 1;
	}
} forEach _modify_permissions;

{
	private _nextplayer = _x;
	private _idx = _nextplayer select 2;

	if (_idx % 2 == 0) then {

		private _control = (findDisplay 5118) ctrlCreate ["RscBackground", -1, (findDisplay 5118) displayCtrl 9969];
		_control ctrlSetPosition [0, (_idx * 0.025) * safezoneH, 0.595 * safeZoneW, 0.025  * safezoneH];
		_control ctrlSetBackgroundColor [0.75,1,0.75,0.12];
		_control ctrlCommit 0;
	};

	private _control = (findDisplay 5118) ctrlCreate ["RscText", (10 * _idx), (findDisplay 5118) displayCtrl 9969];
	_control ctrlSetPosition [0, (_idx * 0.025) * safezoneH, 0.072 * safeZoneW, 0.025  * safezoneH];
	_control ctrlSetText (_nextplayer select 1);
	_control ctrlSetFontHeight fontsize;
	_control ctrlCommit 0;

	[_idx, 1, 0, localize "STR_PERMISSIONS_LIGHT", localize "STR_PERMISSIONS_TOOLTIP_LIGHT"] call permission_create_activetext;
	[_idx, 2, 1, localize "STR_PERMISSIONS_ARMORED", localize "STR_PERMISSIONS_TOOLTIP_ARMORED"] call permission_create_activetext;
	[_idx, 3, 2, localize "STR_PERMISSIONS_AIR", localize "STR_PERMISSIONS_TOOLTIP_AIR"] call permission_create_activetext;
	[_idx, 4, 3, localize "STR_PERMISSIONS_CONSTRUCTION", localize "STR_PERMISSIONS_TOOLTIP_CONSTRUCTION"] call permission_create_activetext;
	[_idx, 5, 4, localize "STR_PERMISSIONS_RECYCLING", localize "STR_PERMISSIONS_TOOLTIP_RECYCLING"] call permission_create_activetext;
	[_idx, 6, 5, localize "STR_PERMISSIONS_MISC", localize "STR_PERMISSIONS_TOOLTIP_MISC"] call permission_create_activetext;

	_control = (findDisplay 5118) ctrlCreate ["RscButton", ((10 * _idx) + 111) + 7, (findDisplay 5118) displayCtrl 9969];
	_control ctrlSetPosition [((0.075 * 7) - 0.02) * safeZoneW, ((_idx * 0.025) * safezoneH) + 0.0025, (0.035 * safeZoneW), 0.022  * safezoneH];
	_control ctrlSetText (localize "STR_PERMISSIONS_ALL");
	_control ctrlSetFontHeight fontsize;
	_control ctrlSetTooltip (localize "STR_PERMISSIONS_TOOLTIP_ALL");
	buttonSetAction [ ((10 * _idx) + 111) + 7, format ["permission_playerid = %1; permission_toset = 666;", _idx]];
	_control ctrlCommit 0;

	_control = (findDisplay 5118) ctrlCreate ["RscButton", ((10 * _idx) + 111) + 8, (findDisplay 5118) displayCtrl 9969];
	_control ctrlSetPosition [((0.075 * 7) + 0.02) * safeZoneW, (_idx * 0.025) * safezoneH + 0.0025, 0.035 * safeZoneW, 0.022  * safezoneH];
	_control ctrlSetText (localize "STR_PERMISSIONS_NONE");
	_control ctrlSetFontHeight fontsize;
	_control ctrlSetTooltip (localize "STR_PERMISSIONS_TOOLTIP_NONE");
	buttonSetAction [((10 * _idx) + 111) + 8, format ["permission_playerid = %1; permission_toset = 999;", _idx]];
	_control ctrlCommit 0;

} foreach _players_array;

while {dialog && alive player} do {

	if (permission_playerid != -1 || permission_toset != -1) then {

		private _player_uid = "";
		private _player_name = "";
		{
			if (_x select 2 == permission_playerid) exitWith {_player_uid = _x select 0; _player_name = _x select 1;};
		} foreach _players_array;

		if (_player_uid != "") then {

			private _player_idx = -1;
			private _player_uids = [];
			private _player_permissions = [];
			{
				_player_uids pushback (_x select 0);
			} foreach _modify_permissions;

			_player_idx = _player_uids find _player_uid;

			if (permission_toset == 666) then {
				_player_permissions = [true, true, true, true, true, true];
			};
			if (permission_toset == 999) then {
				_player_permissions = [false, false, false, false, false, false];
			};

			if (_player_idx == -1) then {

				if (permission_toset != 666 && permission_toset != 999) then {
					_player_permissions = [false, false, false, false, false, false];
					_player_permissions set [permission_toset, true];
				};

				_modify_permissions pushback [_player_uid, _player_name, _player_permissions];
			} else {

				if (permission_toset != 666 && permission_toset != 999) then {

					_player_permissions = (_modify_permissions select _player_idx) select 2;

					private _idx = 0;
					{
						if (permission_toset == _idx) exitWith {
							if (_player_permissions select _idx) then {
								_player_permissions set [_idx, false];
							} else {
								_player_permissions set [_idx, true];
							};
						};
						_idx = _idx + 1;
					} foreach _player_permissions;
				};
				_modify_permissions set [_player_idx, [_player_uid, _player_name, _player_permissions]];
			};
		};

		permission_playerid = -1;
		permission_toset = -1;
	};

	{
		private _nextplayer = _x;
		{
			if (_nextplayer select 0 == _x select 0) exitWith {
				private _idx = _nextplayer select 2;
				private _player_permissions = _x select 2;

				{
					private _control = ((findDisplay 5118) displayCtrl ((10 * _idx) + _x + 111));
					if (_player_permissions select (_x - 1)) then {
						_control ctrlSetTextColor color_authorized;
						_control ctrlSetActiveColor color_authorized;
					} else {
						_control ctrlSetTextColor color_denied;
						_control ctrlSetActiveColor color_denied;
					};
				} foreach [1, 2, 3, 4, 5, 6];
			};
		} foreach _modify_permissions;

	} foreach _players_array;

	if (save_changes == 1) then {
		GRLIB_permissions = +_modify_permissions;
		publicVariable "GRLIB_permissions";
		closeDialog 0;
	};

	waitUntil {!dialog || !(alive player) || permission_playerid != -1 || permission_toset != -1 || save_changes != 0};
};
