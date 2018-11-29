# KP Liberation Module Description

## Core Module
The core module provides the very basic CTI functionalities for the Liberation mission.
It makes sure to spawn the starting equipment, the sector owner changing and checking if any win condition is met to end the mission.
So this is the core gameplay where all other modules are inject their functionalities to extend the way of the mission from the beginning to winning.

### Dependencies
* Init
* Common

### Functions
* KPLIB_fnc_core_areUnitsNear

  *Check if units are near a position.*

* KPLIB_fnc_core_buildFob

  *Build fob and register it.*

* KPLIB_fnc_core_canBuildFob

  *Checks if player can build fob.*

* KPLIB_fnc_core_changeSectorOwner

  *Change the owner of a sector.*

* KPLIB_fnc_core_checkWinCond

  *Check if win conditions are met.*

* KPLIB_fnc_core_createFobMarker

  *Creates FOB marker.*

* KPLIB_fnc_core_getMobSpawns

  *Get all mobile respawn vehicles.*

* KPLIB_fnc_core_getNearestMarker

  *Get the marker from array of markers.*

* KPLIB_fnc_core_handleSector

  *Handle an activated sector.*

* KPLIB_fnc_core_handleVehicleSpawn

  *Handle vehicle spawn event.*

* KPLIB_fnc_core_reviveInit

  *Initialize BIS revive.*

* KPLIB_fnc_core_setupPlayerActions

  *Setup of actions avaible to players.*

* KPLIB_fnc_core_spawnCam

  *The spawn camera sequence.*

* KPLIB_fnc_core_spawnPotato

  *Spawning of the Potato 01 helicopter.*

* KPLIB_fnc_core_spawnStartFobBox

  *Spawning of the start fob box.*

* KPLIB_fnc_core_spawnStartVeh

  *Spawning of the start vehicles.*

* KPLIB_fnc_core_updateFobMarkers

  *Updates the fob markers labels.*

* KPLIB_fnc_core_updateSectorMarkers

  *Updates the sector marker colors.*

### Scripts
* eventLoop.sqf - server side event loop

  *Does periodic checks on players and emits events when necessary.*

* sectorMonitor.sqf - sector monitoring script

  *Handles activation of sectors and spawning of the sector handle script, if blufor units are near a sector.*
