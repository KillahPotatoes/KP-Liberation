/*
    KPLIB_fnc_core_redeploy

    File: fn_core_redeploy.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2017-10-29
    Last Update: 2018-05-04
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Opens the redeploy dialog and switches to a cinematic camera while the dialog is opened.

    Parameter(s):
    NONE

    Returns:
    NOTHING
*/

// Start redeploy cinematic
showCinemaBorder false;
camUseNVG false;
private _respawn_camera = "camera" camCreate (getPosATL KPLIB_eden_startbase);
private _respawn_object = "Sign_Arrow_Blue_F" createVehicleLocal (getPosATL KPLIB_eden_startbase);
_respawn_object hideObject true;
_respawn_camera camSetTarget _respawn_object;
_respawn_camera cameraEffect ["internal","back"];
_respawn_camera camcommit 0;

// Open dialog and disable serialization, so local variables can store displays and controls
createDialog "KPLIB_redeploy";
disableSerialization;
waitUntil {dialog};

// Fetch display controls in variables
private _frame_pos = ctrlPosition ((findDisplay 5201) displayCtrl 758011);
private _map = (findDisplay 75801) displayCtrl 758012;
private _spawnlist_idc = 758013;
private _spawnlist = (findDisplay 75801) displayCtrl _spawnlist_idc;
private _loadouts_idc = 758014;
private _loadouts = (findDisplay 75801) displayCtrl _loadouts_idc;
private _standard_map_pos = ctrlPosition _map;

// Get current backpack (to avoid blacklisting of packed weapons/UAVs)
private _backpack = backpack player;

// Enable double click functionality in spawn location list
_spawnlist ctrlAddEventHandler ["mouseButtonDblClick", {KPLIB_dialog_deploy = 1;}];

// Fetch player loadouts and fill dropdown menu
private _loadouts_data = [];
{
    if (_forEachIndex % 2 == 0) then {
        _loadouts_data pushback _x;
    };
} forEach (profileNamespace getVariable "BIS_fnc_saveInventory_data");

lbAdd [_loadouts_idc, "--"];
{lbAdd [_loadouts_idc, _x];} forEach _loadouts_data;
lbSetCurSel [_loadouts_idc, 0];

// Array for all possible spawnpoints
private _spawnchoices = [];

// Selection storages
private _oldselect = -1;
private _oldMapTrigger = 0;

// Name of selected spawnpoint
private _spawn_str = "";
// Indicator if mobile spawnpoint was used
private _mobileRespawnDone = false;

// Starting while loop for the opened dialog
while {dialog && (alive player) && (KPLIB_dialog_deploy == 0)} do {

    // Startbase entry for the spawn list
    _spawnchoices = [[localize "STR_MAINBASE", getPosATL KPLIB_eden_startbase]];

    // Add the FOBs to the spawn list
    for "_i" from 0 to (count KPLIB_sectors_fobs - 1) do {
        _spawnchoices pushBack [format ["FOB %1 - %2", (KPLIB_preset_alphabet select _i), mapGridPosition (KPLIB_sectors_fobs select _i)], (KPLIB_sectors_fobs select _i)];
    };

    // Add mobile respawns to the spawn list if parameter isn't disabled
    if (KPLIB_param_mobileRespawn > 0) then {
        if (KPLIB_respawn_time <= time) then {
            private _mobileSpawns = call KPLIB_fnc_core_getMobSpawns;

            // Adding the mobile respawns with object refence as third element, to access it on spawning
            for "_i" from 0 to (count _mobileSpawns - 1) do {
                _spawnchoices pushBack [format ["%1 - %2", localize "STR_RESPAWN_TRUCK", mapGridPosition (getPosATL (_mobileSpawns select _i))], getPosATL (_mobileSpawns select _i), (_mobileSpawns select _i)];
            };
        };
    };

    // Add entries to the dialog control
    lbClear _spawnlist_idc;
    {
        lbAdd [_spawnlist_idc, (_x select 0)];
    } forEach _spawnchoices;

    if (lbCurSel _spawnlist_idc == -1) then {
            lbSetCurSel [_spawnlist_idc, 0];
    };

    // Adjust respawn camera if selection has changed
    if (lbCurSel _spawnlist_idc != _oldselect) then {
        _oldselect = lbCurSel _spawnlist_idc;
        private _objectpos = ((_spawnchoices select _oldselect) select 1);
        _respawn_object setposATL ((_spawnchoices select _oldselect) select 1);
        private _startdist = 120;
        private _enddist = 120;
        private _alt = 35;
        if (((_spawnchoices select (lbCurSel _spawnlist_idc)) select 0) == localize "STR_MAINBASE") then {
            _startdist = 200;
            _enddist = 300;
            _alt = 30;
        };

        "spawn_marker" setMarkerPosLocal (getPos _respawn_object);
        ctrlMapAnimClear _map;
        private _transition_map_pos = getPos _respawn_object;
        private _fullscreen_map_offset = 4000;
        if (KPLIB_dialog_mapTrigger % 2 == 1) then {
            _transition_map_pos = [(_transition_map_pos select 0) - _fullscreen_map_offset, (_transition_map_pos select 1) + (_fullscreen_map_offset * 0.75), 0];
        };

        _map ctrlMapAnimAdd [0, 0.3, _transition_map_pos];
        ctrlMapAnimCommit _map;

        _respawn_camera camSetPos [(getPos _respawn_object select 0) - 70, (getPos _respawn_object select 1) + _startdist, (getPos _respawn_object select 2) + _alt];
        _respawn_camera camcommit 0;
        _respawn_camera camSetPos [(getPos _respawn_object select 0) - 70, (getPos _respawn_object select 1) - _enddist, (getPos _respawn_object select 2) + _alt];
        _respawn_camera camcommit 90;
    };

    // Adjust map view, if map scale changed
    if (_oldMapTrigger != KPLIB_dialog_mapTrigger) then {
        _oldMapTrigger = KPLIB_dialog_mapTrigger;
        if (KPLIB_dialog_mapTrigger % 2 == 1) then {
            _map ctrlSetPosition [(_frame_pos select 0) + (_frame_pos select 2), (_frame_pos select 1), (0.6 * safezoneW), (_frame_pos select 3)];
        } else {
            _map ctrlSetPosition _standard_map_pos;
        };
        _map ctrlCommit 0.2;
        _oldselect = -1;
    };
    uiSleep 0.1;
};

// Move player to selected spawn position
if (dialog && KPLIB_dialog_deploy == 1) then {
    private _spawnId = lbCurSel _spawnlist_idc;
    _spawn_str = (_spawnchoices select _spawnId) select 0;

    // Check if respawn vehicle or FOB
    if ((count (_spawnchoices select _spawnId)) == 3) then {
        private _truck = (_spawnchoices select _spawnId) select 2;
        player setPos (_truck getPos [5, (random 360)]);
        _mobileRespawnDone = true;
    } else {
        private _destpos = (_spawnchoices select _spawnId) select 1;
        player setPosATL [((_destpos select 0) + 5) - (random 10), ((_destpos select 1) + 5) - (random 10), (_destpos select 2)];
    };

    // Add loadout if selected
    if ((lbCurSel _loadouts_idc) > 0) then {
        [player, [profileNamespace, _loadouts_data select ((lbCurSel _loadouts_idc) - 1)]] call BIS_fnc_loadInventory;
    };
};

// Kill the camera and dummy object
_respawn_camera cameraEffect ["Terminate","back"];
camDestroy _respawn_camera;
deleteVehicle _respawn_object;
camUseNVG false;
"spawn_marker" setMarkerPosLocal KPLIB_resetPos;

// Close dialog
if (dialog) then {
    closeDialog 0;
};

// Show spawn camera and apply mobile cooldown if needed
if (alive player && KPLIB_dialog_deploy == 1) then {
    if (KPLIB_param_deployCine > 0) then {[_spawn_str] spawn KPLIB_fnc_core_spawnCam;};
    if (_mobileRespawnDone) then {KPLIB_respawn_time = time + KPLIB_param_respawnCd;};
};

// Check if player has blacklisted items in his inventory
if (KPLIB_param_arsenalPreset > 0) then {
    [_backpack] call KPLIB_fnc_core_checkGear;
};

// Show mobile cooldown hint
if ((KPLIB_param_mobileRespawn > 0) && (KPLIB_respawn_time > time)) then {
    hint format [localize "STR_HINT_RESPAWNCOOLDOWN", ceil ((KPLIB_respawn_time - time) / 60)];
    uiSleep 12;
    hint "";
};

KPLIB_dialog_deploy = 0;
