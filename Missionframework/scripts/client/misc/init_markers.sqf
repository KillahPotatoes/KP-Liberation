_marker = createMarkerLocal ["zone_capture", markers_reset];
_marker setMarkerColorLocal "ColorUNKNOWN";
_marker setMarkerShapeLocal "Ellipse";
_marker setMarkerBrushLocal "SolidBorder";
_marker setMarkerSizeLocal [ KPLIB_range_sectorCapture, KPLIB_range_sectorCapture ];

_marker = createMarkerLocal ["spawn_marker", markers_reset];
_marker setMarkerColorLocal "ColorGreen";
_marker setMarkerTypeLocal "Select";
