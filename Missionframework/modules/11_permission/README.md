# KP Liberation Module Description

## Permission Module
The permission module provides a permission framework with a dynamic dialog.
There are functions to create and check the permissions.

### Dependencies
* Init

### Consumed events
**KPLIB_doLoad** (server side)
Calls KPLIB_fnc_permission_loadData to process saved module data

**KPLIB_doSave** (server side)
Calls KPLIB_fnc_permission_saveData to add the module data to the save array

### Emitted events
**KPLIB_permission_newPH** (servere side)
EMitted when a new permission handler is registered

### Functions
* KPLIB_fnc_permission_addPermissionHandler

  *Adds a new permission to the permission system.*

* KPLIB_fnc_permission_changePermission

  *Changes the selected permission of the given player.*

* KPLIB_fnc_permission_checkPermission

  *Checks the given permission and executes the registered code.*

* KPLIB_fnc_permission_checkVehiclePermission

  *Checks the given vehicle permission and executes the registered code.*

* KPLIB_fnc_permission_ejectPlayer

  *Ejects the player and creates a hint.*

* KPLIB_fnc_permission_getPermission

  *Checks the given permission and returns the result.*

* KPLIB_fnc_permission_initDefault

  *Initializes the default permissions.*

* KPLIB_fnc_permission_loadData

  *Loads data which is bound to the this module from the given save data or initializes needed data for a new campaign.*

* KPLIB_fnc_permission_openDialog

  *Opens the permission dialog.*

* KPLIB_fnc_arsenal_postInit

  *Module post initialization.*

* KPLIB_fnc_arsenal_preInit

  *Module pre initialization.*

* KPLIB_fnc_permission_registerPlayer
  *Checks if the player is already registered to the permission system.*

* KPLIB_fnc_permission_resetToDefault
  *Resets all permissions to default.*

* KPLIB_fnc_permission_saveData
  *Fetches data which is bound to this module and send it to the global save data array.*

* KPLIB_fnc_permission_setupPermissionControls
  *Reads the player permissions and applies them to the dialog controls.*

* KPLIB_fnc_permission_setupplayerActions
  *Initialization of actions availible to players.*

* KPLIB_fnc_permission_syncClients
  *Receive client variables and send them to all clients.*

### Scripts
No scripts will be started by this module

### Example Permission Array
KPLIB_permission_list = [
    ["SteamID64", "PlayerName", [
        ["AVehicle", true],
        ["BVehicle", false],
        ["CVehicle", false]
    ]],
    ["SteamID64", "PlayerName", [
        ["AVehicle", true],
        ["BVehicle", false],
        ["CVehicle", false]
    ]],
];
