# KP Liberation Module Description

## Build Module
With this module the visual establishing of FOBs, the construction of vehicles and buildings and the AI recruiting is handled.
The main content is the free camera building system which gives players the opportunity to build their FOBs much easier then before.
Furthermore it handles the saving/loading of all objects which are buildable/spawnable by players in the mission.

### Dependencies
* Init
* Common
* Core
* Persistence
* Resources

### Functions
* KPLIB_fnc_build_addToSelection

  *Manages selection depending on currently pressed keys.*

* KPLIB_fnc_build_boundingBoxPFH

  *PFH that renders bouding boxes for objects in queue.*

* KPLIB_fnc_build_camAreaLimiter

  *PFH limiting camera flying area.*

* KPLIB_fnc_build_camCreate

  *Creates the build camera.*

* KPLIB_fnc_build_displayLoad

  *Display initialization.*

* KPLIB_fnc_build_displayPlaceObject

  *Place object in build queue.*

* KPLIB_fnc_build_displayUnload

  *Handle build display unload.*

* KPLIB_fnc_build_drawBoundingBox

  *Draws bounding box on single object.*

* KPLIB_fnc_build_drawIconsPFH

  *PFH that draws icons in 3D space.*

* KPLIB_fnc_build_handleDrag

  *Handle object dragging/positon changing.*

* KPLIB_fnc_build_handleKeys

  *Handle display keypresses.*

* KPLIB_fnc_build_handleMouse

  *Mouse movement and click handler.*

* KPLIB_fnc_build_handleRotation

  *Handle object dragging/rotation.*

* KPLIB_fnc_build_markArea

  *Marks given area with circle created out of spheres.*

* KPLIB_fnc_build_objectColor

  *Get user interface item color depending on object state.*

* KPLIB_fnc_build_objectUnderCursor

  *Return object under cursor.*

* KPLIB_fnc_build_setupPlayerActions

  *Add player actions.*

* KPLIB_fnc_build_start

  *Start building logic.*

* KPLIB_fnc_build_stop

  *Stop building logic.*

* KPLIB_fnc_build_surfaceUnderCursor

  *Returns surface that is directly under cursor.*

* KPLIB_fnc_build_validatePosition

  *Checks if object position is valid for building.*

### Scripts
No scripts will be started by this module

### Implemented permissions
* Build menu
