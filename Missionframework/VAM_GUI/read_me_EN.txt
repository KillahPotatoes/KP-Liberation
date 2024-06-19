Vehicle Appearance Manager (GUI) by UNIT_normal
This allows you to change camouflage and component via GUI.
VAM supports most of vanilla vehicles even mod vehicles.
You can apply custom textures by making exceptions.

Known issue
- Some components are linked each other. It's not VAM's limitation.
- Some components aren't compatible each other. It's not VAM's limitation.
- Some vehicles don't have default customizing value. Reset will not work in that case.

Installation
1. Put VAM folder on your mission folder.
2. Put stringtable.xml or copy & paste contents to your stringtable.xml.
3. Add this to init.sqf.
[] execVM "VAM_GUI\VAM_GUI_init.sqf";
4. Add this to description.ext.
#include "VAM_GUI\defines.hpp"
#include "VAM_GUI\VAM_GUI_controls.hpp"
#include "VAM_GUI\VAM_GUI_classes.hpp"

Option
- In VAM_GUI_init.sqf, you can enable multiple check systems.

Changelog
1.0
Released
1.10
Marid(v1 and v2) fixed. (I suggest you change every v1 to v2)
1.11
List text size adjusted
1.12
Liberation FOB distance check system is now available
1.20
Hidden texture option added for Hummingbird/Pawnee, Blackfoot, Orca
1.21
Bug fixed (Error message when user is trying to scroll down below last component with arrow down key.)
1.22
Action method changed. UGV RCWS bug fixed. Introducing fnc_VAM_variable_cleaner
1.3
Added more condition check options
1.31, 1.32
Minor change
1.40
Action mechanism changed
1.41
Locality problem fixed, some activation conditions has been changed.

Special Thanks
DCinside ARMA Minor Gallery for testing
JLD server for on-server testing