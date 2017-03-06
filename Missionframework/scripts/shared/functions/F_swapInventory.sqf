params [ "_unit1", "_unit2" ];
private [ "_loadout" ];

_loadout = [ _unit1, ["repetitive"] ] call F_getLoadout;
[ _unit2, _loadout ] call F_setLoadout;