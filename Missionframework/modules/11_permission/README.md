# KP Liberation Module Description

## Permission Module
The permission module provides a dynamic permission framework with a permission overview dialog.
It contains functions to check player permissions and add new permissions to the framework.
Additionally it contains some pre defined permissions.

### Dependencies
* Init
* Common

### Consumed events
**KPLIB_doLoad** (server side)
Calls KPLIB_fnc_permission_loadData to process saved module data

**KPLIB_doSave** (server side)
Calls KPLIB_fnc_permission_saveData to add the module data to the save array

**KPLIB_permission_newPH** (server side)
Calls KPLIB_fnc_permission_initDefault to add the permission to the default permissions

**GetInMan** (client side)
Calls KPLIB_fnc_permission_checkVehiclePermission and checks the player permission for the entered vehicle

**SeatSwitchedMan** (client side)
Calls KPLIB_fnc_permission_checkVehiclePermission and checks the player permission for the entered vehicle

### Emitted events
**KPLIB_permission_newPH** (server side)
Emitted when a new permission handler is registered

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

* KPLIB_fnc_permission_export

  *Export the permission list to profileNamespace.*

* KPLIB_fnc_permission_getPermission

  *Checks the given permission and returns the result.*

* KPLIB_fnc_permission_import

  *Import the permission list from profileNamespace.*

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

* KPLIB_fnc_permission_settings

  *CBA Settings initialization for this module.*

* KPLIB_fnc_permission_setupPermissionControls

  *Reads the player permissions and applies them to the dialog controls.*

* KPLIB_fnc_permission_setupPlayerActions

  *Initialization of actions availible to players.*

### Scripts
No scripts will be started by this module

### Implemented permissions
* Commander slot
* Sub-Commander slot
* Light vehicles
* Transport vehicles
* Heavy vehicles
* Anti-Air vehicles
* Artillery vehicles
* Transport helicopter
* Attack helicopter
* Transport plane
* Attack jets
* Logistic vehicles
