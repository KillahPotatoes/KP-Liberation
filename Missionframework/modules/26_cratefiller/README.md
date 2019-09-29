# KP Liberation Module Description

## Cratefiller Module
This module provides the cratefiller functionalities from the original [KP Cratefiller](https://github.com/KillahPotatoes/dubjunks-scripts) by Dubjunk.
It provides a dialog with the ability to manage several inventories.

### Dependencies
* Common
* Permission
* Logistic

### Consumed events
**KPLIB_arsenal_newLists** (server side)
Calls KPLIB_fnc_cratefiller_presets to process the new white- and blacklist

### Functions
* KPLIB_fnc_cratefiller_addEquipment

  *Adds the given amount of the selected item to the inventory.*

* KPLIB_fnc_cratefiller_createEquipmentList

  *Changes the shown equipment category.*

* KPLIB_fnc_cratefiller_createSubList

  *Creates a list with valueable magazines or attachments.*

* KPLIB_fnc_cratefiller_deletePreset

  *Deletes the selected preset.*

* KPLIB_fnc_cratefiller_export

  *Exports the active inventory.*

* KPLIB_fnc_cratefiller_getConfigPath

  *Gets the config path / type of the given classname.*

* KPLIB_fnc_cratefiller_getGroups

  *Gets all player groups.*

* KPLIB_fnc_cratefiller_getInventory

  *Gets all inventory items of the storage.*

* KPLIB_fnc_cratefiller_getNearStorages

  *Scans the fob for possible storages.*

* KPLIB_fnc_cratefiller_getPlayerInventory

  *Gets all weapons of the selected player.*

* KPLIB_fnc_cratefiller_getPlayers

  *Gets all players from the selected group.*

* KPLIB_fnc_cratefiller_getStorage

  *Returns the active storage.*

* KPLIB_fnc_cratefiller_import

  *Imports the selected inventory.*

* KPLIB_fnc_cratefiller_openDialog

  *Opens the cratefiller dialog.*

* KPLIB_fnc_cratefiller_postInit

  *Module post initialization.*

* KPLIB_fnc_cratefiller_preInit

  *Module pre initialization.*

* KPLIB_fnc_cratefiller_presets

  *Creates the different categories of the whitelisted items.*

* KPLIB_fnc_cratefiller_removeEquipment

  *Removes the given amount of the selected item from the storage.*

* KPLIB_fnc_cratefiller_search

  *Search for a weapon with the name entered in the search bar.*

* KPLIB_fnc_cratefiller_setInventory

  *Adds the items to the active storage.*

* KPLIB_fnc_cratefiller_settings

  *CBA Settings initialization for this module.*

* KPLIB_fnc_cratefiller_showInventory

  *Displays the items of the active storage.*

* KPLIB_fnc_cratefiller_showOverview

  *Shows the cratefiller overview display.*

* KPLIB_fnc_cratefiller_showPresets

  *Reads all saved presets and lists them.*

* KPLIB_fnc_cratefiller_sortList

  *Sorts the displaynames of the given item array.*

### Scripts
No scripts will be started by this module

### Implemented permissions
* Cratefiller
