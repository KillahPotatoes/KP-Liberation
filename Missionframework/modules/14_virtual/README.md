# KP Liberation Module Description

## Zeus Module
This module provides access to Zeus module functionalities

### Dependencies
* Init
* Core
* Build

### Consumed events

**KPLIB_player_giveZeus** (server side):
```
// Gives zeus module access to unit with given mode (0-3)
["KPLIB_player_giveZeus", [<unit, OBJECT>, <mode, NUMBER>]] call CBA_fnc_serverEvent;
```

### Emitted events

**KPLIB_curatorOpen** (local) - emmited when player opens curator, receives curator display

**KPLIB_playerCuratorOpen** (server side) - emmited when player opens curator, receives player unit

### Scripts
No scripts will be started by this module
