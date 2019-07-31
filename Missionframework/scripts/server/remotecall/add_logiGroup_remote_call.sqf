if (!isServer) exitWith {};

private _newID = [count KP_liberation_logistics] call F_getMilitaryID;

KP_liberation_logistics append [[
	_newID, 													// ID
	0,															// Truck Count
	[0,0,0],													// Position Point A
	[0,0,0],													// Position Point B
	[0,0,0],													// Ressource transport count A -> B [S,A,F]
	[0,0,0],													// Ressource transport count B -> A [S,A,F]
	[0,0,0],													// Currently loaded [S,A,F]
	0,															// Status (0 standby, 1 at A, 2 to B, 3 at B, 4 to A, 5 aborting to A, 6 aborting to B)
	-1,															// Time left in current status
	0															// Special Flag (0 unload, 1 load, 2 no storage, 3 no ressources)
]];
