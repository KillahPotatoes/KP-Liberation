# KP Liberation Module Description

## Init Module
The init module handles the general mission initialization and distributes it to all clients.
It contains the general/vital CBA settings for the mission, defines basic global variables and ui classes/values.
Also the presets are loaded and checked for syntax errors. If any errors are found, it'll end the mission with a hint.
Furthermore it takes care of the saving process by running scheduled savings.
Mostly everything is processed on the server, which distributes the final data to the clients.

### Dependencies
This module uses no data or functions from other modules.

### Functions
* KPLIB_fnc_init_checkClass

  *Checks if given classname is inside CfgVehicles.*

* KPLIB_fnc_init_clientMarkers

  *Creates local client markers.*

* KPLIB_fnc_init_configGuard

  *Try to catch errors in config file.*

* KPLIB_fnc_init_createLockedVehMarkers

  *Creates locked vehicle markers.*

* KPLIB_fnc_init_filterMods

  *Filters not available classnames out of a given array of classnames.*

* KPLIB_fnc_init_getSaveData

  *Gets the module save data from the global save data array.*

* KPLIB_fnc_init_load

  *Initializes full load procedure for the saved campaign.*

* KPLIB_fnc_init_loadPresets

  *Loads and checks the configured unit presets.*

* KPLIB_fnc_init_receiveInit

  *Client function for processing init data which was published by the server.*

* KPLIB_fnc_init_save

  *Initializes full saves procedure for the running campaign.*

* KPLIB_fnc_init_setSaveData

  *Adds a module data array to the save data array.*

* KPLIB_fnc_init_sortSectors

  *Sorts sector markers and fills global sector arrays.*

* KPLIB_fnc_init_timeMultiApply

  *Applies the chosen time multiplier.*

* KPLIB_fnc_init_wipe

  *Completely wipes all data from the current campaign.*

### Scripts
No scripts will be started by this module
