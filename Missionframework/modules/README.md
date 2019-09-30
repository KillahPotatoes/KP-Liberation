# KP Liberation Module Framework

The used framework provides a modular structure, where each module provides one specific gameplay aspect or functionality.

Each module contains some basic data:
* `fnc` folder
* functions.hpp

Additional:
* `ui`folder
* ui.hpp

These modules are categorized concerning their functionality.
The different categories are listed below.

### Core Modules
Modules which are vital for the mission to run properly. All of these modules need to be loaded to ensure the general functionalities of the mission.
```
00 Init
01 Common
02 Core
03 Persistence
04 Respawn
05 Admin menu
```
### Basic Modules
These modules provide the basic CTI gameplay experience and should therefore also be loaded completely. The mission should be able to work without the modules (respecting possible dependencies) but would lack most of the essential content.
```
10 Resources
11 Permissions
12 Arsenal
13 Player Menu
14 Virtual/Curator
15 Build
16 Garrison
```
### Additional Modules
With these additions the intended complexity comes into the mission. It is highly recommended to have them enabled, but it isn't needed in any case and can safely be deactivated without downsides beside of the gameplay experience.
```
20 Civilian Reputation
21 Guerilla Forces
22 Production
23 Logistic
24 Enemy Commander
25 Friendly Commander Managing Dialog
26 Cratefiller
27 Mission handling
28 Prisoners of war
```
### TBA
Mod specific compatibility modules
Very special (auto enable) additions due to wanted mod support or anything "special case" stuff. starting at 40.
