# KP Liberation Module Description

## Misison Module
This module provides an mission framework to register created missions.
Also it provides a dialog which can start and abort sidemissions.

### Dependencies
* Init
* Common
* Permission

### Consumed events
**KPLIB_doLoad** (server side)
Calls KPLIB_fnc_mission_loadData to process saved module data

**KPLIB_doSave** (server side)
Calls KPLIB_fnc_mission_saveData to add the module data to the save array

**KPLIB_missionExec** (server side)
Processes a mission start or abort dependent on the passed arguments

**KPLIB_missionEnd** (server side)
Calls KPLIB_fnc_mission_endMission to delete the ended mission from the running missions

### Emitted events
**KPLIB_missionExec** (server side)
Processes a mission start or abort dependent on the passed arguments

### Functions
* KPLIB_fnc_mission_abortMission

  *Aborts the given mission.*

* KPLIB_fnc_mission_buttonClick

  *Selects which mission should be started/aborted and starts th next function.*

* KPLIB_fnc_mission_displayMission

  *Displays the information for the given mission.*

* KPLIB_fnc_mission_endMission

  *Deletes the mission from the running missions*

* KPLIB_fnc_mission_loadData

  *Loads data which is bound to the this module from the given save data or initializes needed data for a new campaign.*

* KPLIB_fnc_mission_openDialog

  *Opens the mission dialog.*

* KPLIB_fnc_mission_postInit

  *Module post initialization.*

* KPLIB_fnc_mission_preCheck

  *Checks the mission conditions on a changing selection and disables the button.*

* KPLIB_fnc_mission_preInit

  *Module pre initialization*

* KPLIB_fnc_mission_readData

  *Reads the data of the given listbox.*

* KPLIB_fnc_mission_registerMission

  *Registers a mission for the usage as event or "buyable" sidemission.*

* KPLIB_fnc_mission_saveData

  *Fetches data which is bound to this module and send it to the global save data array.*

* KPLIB_fnc_mission_settings

  *CBA Settings initialization for this module.*

* KPLIB_fnc_mission_setupPlayerActions

  *Initialization of actions available to players.*

* KPLIB_fnc_mission_startMission

  *Starts the given mission or selects one from the given array.*

### Scripts
No scripts will be started by this module

### Implemented permissions
* Mission dialog
