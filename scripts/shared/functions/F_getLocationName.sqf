params [ "_attacked_position" ];
private [ "_attacked_string" ];

_attacked_string = [ _attacked_position ] call F_getFobName;
if ( _attacked_string == "" ) then {
	_attacked_string = markerText  ( [50, _attacked_position ] call F_getNearestSector );
} else {
	_attacked_string = format [ "FOB %1", _attacked_string ];
};

_attacked_string