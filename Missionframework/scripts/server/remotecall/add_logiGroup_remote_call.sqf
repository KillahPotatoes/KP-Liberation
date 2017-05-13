if (!isServer) exitWith {};

KP_liberation_logistics append [[
	military_alphabet select (count KP_liberation_logistics), 	// ID
	0,															// Truck Count
	[],															// Position Point A
	[],															// Position Point B
	[],															// Ressource transport count A -> B [S,A,F]
	[],															// Ressource transport count B -> A [S,A,F]
	[],															// Currently loaded [S,A,F]
	0,															// Status (0 standby, 1 at A, 2 to B, 3 at B, 4 to A)
	-1															// Time left in current status
]];
