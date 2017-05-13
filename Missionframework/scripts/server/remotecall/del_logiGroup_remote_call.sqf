if (!isServer) exitWith {};

params ["_groupToDelete"];

KP_liberation_logistics = KP_liberation_logistics - [_groupToDelete];
