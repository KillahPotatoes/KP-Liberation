# KP Liberation Module Description

## Zeus Module
This module provides access to Zeus module functionalities

### Dependencies
* Init
* Core
* Build

### Events

This module consumes "KPLIB_player_giveZeus" server side event.

```
// Gives zeus module access to unit with given mode (0-4)
["KPLIB_player_giveZeus", [<unit, OBJECT>, <mode, NUMBER>]] call CBA_fnc_serverEvent;
```

### Scripts
No scripts will be started by this module
