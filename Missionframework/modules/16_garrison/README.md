# KP Liberation Module Description

## Garrison Module
This module provides a persistent garrison for each sector.
It handles the spawn, despawn, capture and despawn events which are affecting the garrison strength.
It'll also provide functions to change garrison data and a garrison management dialog for the player owned sectors.

### Dependencies
* Init
* Common
* Core
* Garrison

### Functions
* KPLIB_fnc_garrison_changeOwner

  *Changes the owner of a sector garrison.*

* KPLIB_fnc_garrison_despawn

  *Despawns the remaining garrison and updates the garrison array upon sector deactivation.*

* KPLIB_fnc_garrison_getGarrison

  *Gets the specific garrison array.*

* KPLIB_fnc_garrison_getVehSpawnPos

  *Finds empty position suitable for vehicle spawn.*

* KPLIB_fnc_garrison_initSector

  *Initializes a sector garrison.*

* KPLIB_fnc_garrison_reInitSectors

  *Reinitialize sectors of given preset faction.*

* KPLIB_fnc_garrison_spawn

  *Spawns the garrison upon sector activation.*

* KPLIB_fnc_garrison_spawnSectorInfantry

  *Spawns garrison infantry at a sector.*

* KPLIB_fnc_garrison_spawnSectorVehicle

  *Spawns a vehicle at a sector.*

### Scripts
No scripts will be started by this module

### Implemented permissions
* Garrison management
