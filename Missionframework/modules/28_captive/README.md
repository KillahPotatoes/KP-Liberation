# KP Liberation Module Description

## Captive Module
This module handles the prisoners of war.
It'll check for remaining soldiers on sector capture and ensure that they'll surrender and can get handled through interactions.

### Dependencies
* Common

### Consumed events
**KPLIB_sector_captured** (server side)
Calls KPLIB_fnc_captive_checkSector to search and handle remaining units

**KPLIB_captive_arrested** (server side)
Plays the arrest moves for captives to ensure that the moves are handled at the correct locality

**ace_captiveStatusChanged** (server side)
Calls KPLIB_fnc_captive_setAceCaptive to handle the ace captive system and integrate the lib stuff to the captives

**KPLIB_captive_load** (global)
Move the captive into the vehicle cargo

**KPLIB_captive_unload** (global)
Move the captive out of the vehicle cargo

**KPLIB_captive_loaded** (client side)
Handles the captive load, to ensure that the actions get applied and remove accordingly

**KPLIB_captive_unloaded** (client side)
Removes the unload action from the vehicle

### Emitted events
**KPLIB_captive_surrendered** (global)
Emitted when a unit surrenders

**KPLIB_captive_arrested** (global)
Emitted when a surrendered unit gets arrested

**KPLIB_captive_load** (target event)
Emitted when a captive should get loaded

**KPLIB_captive_loaded** (global)
Emitted when a captive gets loaded

**KPLIB_captive_unload** (target event)
Emitted when a captive should get unloaded

**KPLIB_captive_unloaded** (global)
Emitted when a captive gets unloaded

**KPLIB_captive_interrogated** (global)
Emitted when a captive gets interrogated

### Functions
* KPLIB_fnc_captive_addCaptiveAction

  *Adds all needed actions to a surrendered unit.*

* KPLIB_fnc_captive_checkSector

  *Checks the given sector for remaining enemys and let them surrender.*

* KPLIB_fnc_captive_escort

  *ttach a captive to the escorting player.*

* KPLIB_fnc_captive_interrogate

  *Interrogates the unit, adds intel and deletes it.*

* KPLIB_fnc_captive_loadCaptive

  *Loads given unit into the nearest vehicle cargo seat.*

* KPLIB_fnc_captive_postInit

  *Module post initialization.*

* KPLIB_fnc_captive_preInit

  *Module pre initialization.*

* KPLIB_fnc_captive_setAceCaptive

  *Checks for ACE handcuffed units and rebinds them into the Liberation captive system.*

* KPLIB_fnc_captive_setCaptive

  *Sets an unit into captive mode.*

* KPLIB_fnc_captive_setSurrender

  *Given unit surrenders.*

* KPLIB_fnc_captive_settings

  *CBA Settings initialization for this module*

* KPLIB_fnc_captive_stopEscort

  *Detach a captive from the escorting player.*

* KPLIB_fnc_captive_unloadCaptive

  *Unloads the give unit and removes the action from the vehicle.*

### Scripts
No scripts will be started by this module
