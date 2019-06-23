# KP Liberation Module Description

## Logistic Module
The permission module handles the resupply and recycle functionalities and contains the ability to add new menus to the logistic station.
All provided menus will be added to the logistic main menus.

### Dependencies
* Init
* Common
* Permission

### Consumed events
**KPLIB_vehicle_spawned** (server side)
Calls KPLIB_fnc_logistic_addActions which will check the vehicle type and add the logistic actions to it

### Functions
* KPLIB_fnc_logistic_addActions

  *Adds all actions to the spawned logistic building.*

* KPLIB_fnc_logistic_addMenu

  *Adds a new menu to the logistic main menu.*

* KPLIB_fnc_logistic_calcCosts

  *Calculates the costs of the resupply action.*

* KPLIB_fnc_logistic_openDialog

  *Opens the logistic main dialog.*

* KPLIB_fnc_logistic_openRecycleDialog

  *Opens the logistic recycle dialog.*

* KPLIB_fnc_logistic_openResupplyDialog

  *Opens the logistic resupply dialog.*

* KPLIB_fnc_logistic_postInit

  *Module post initialization.*

* KPLIB_fnc_logistic_preInit

  *Module pre initialization.*

* KPLIB_fnc_logistic_recycleTarget

  *Recycles the selected vehicle.*

* KPLIB_fnc_logistic_refreshTargets

  *Refreshes the vehicle list for the given dialog.*

* KPLIB_fnc_logistic_resupplyTarget

  *Resupplies the given vehicle.*

* KPLIB_fnc_logistic_selectRecycleTarget

  *Selects the vehicle from the combo cox and fills the dialog.*

* KPLIB_fnc_logistic_selectResupplyTarget

  *Selects the vehicle from the combo cox and fills the dialog.*

* KPLIB_fnc_logistic_settings

  *CBA Settings initialization for this module.*

### Scripts
No scripts will be started by this module

### Implemented permissions
* Recycle
* Resupply

### Implemented logistic menus
* Recycle
* Resupply
