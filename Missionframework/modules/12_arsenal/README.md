# KP Liberation Module Description

## Arsenal Module
The arsenal module provides the arsenal dialog and several functions.
It defines the arsenal items and gives the ability to access the arsenal, define default loadouts and copy loadouts from other players.

### Dependencies
* Common

### Consumed events
**arsenalOpened** (client side)
Saves the players backpack to ensure a correct search for blacklisted items

**arsenalClosed** (client side)
Calls KPLIB_fnc_arsenal_checkGear to search the player inventory for blacklisted items

**ace_arsenal_displayOpened** (client side)
Saves the players backpack to ensure a correct search for blacklisted items

**ace_arsenal_displayClosed** (client side)
Calls KPLIB_fnc_arsenal_checkGear to search the player inventory for blacklisted items

**KPLIB_player_redeploy** (client side)
Calls KPLIB_fnc_arsenal_checkGear to search the player inventory for blacklisted items

### Emitted events
**KPLIB_arsenal_newLists** (server side)
Emitted when the arsenal white- and blacklist are (re)initialized

### Functions
* KPLIB_fnc_arsenal_applyLoadout

  *Applies the selected loadout to the player.*

* KPLIB_fnc_arsenal_checkGear

  *Checks the players gear for blacklisted items and report these items.*

* KPLIB_fnc_arsenal_copyLoadout

  *Copies the loadout from selected player.*

* KPLIB_fnc_arsenal_fillArsenal

  *Initializes the virtual arsenal.*

* KPLIB_fnc_arsenal_getNearPlayers

  *Lists all near players in a predefined radius.*

* KPLIB_fnc_arsenal_openArsenal

  *Opens the arsenal dependent on the selected type.*

* KPLIB_fnc_arsenal_openDialog

  *Open the arsenal dialog.*

* KPLIB_fnc_arsenal_postInit

  *Module post initialization.*

* KPLIB_fnc_arsenal_preInit

  *Module pre initialization.*

* KPLIB_fnc_arsenal_setDefaultLoadout

  *Stores the selected loadout as default loadout.*

* KPLIB_fnc_arsenal_settings

  *CBA Settings initialization for this module.*

* KPLIB_fnc_arsenal_setupPlayerActions

  *Setup of actions available to players.*

### Scripts
No scripts will be started by this module
