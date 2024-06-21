private [ "_scanned_units", "_scanned_groups" ];

waitUntil { !isNil "nametags_distance" };

while { true } do {

    _scanned_units = [ allUnits, { ( alive _x ) && ( side group _x == KPLIB_side_player ) } ] call BIS_fnc_conditionalSelect;
    _scanned_units = [ _scanned_units, { (_x == leader group player ) || (_x distance player < nametags_distance) } ] call BIS_fnc_conditionalSelect;
    _scanned_units = [ _scanned_units, { (_x != player) && (( vehicle player ) != ( vehicle _x )) } ] call BIS_fnc_conditionalSelect;
    KPLIB_nametag_units = [] + _scanned_units;

    _scanned_groups = [ allGroups, { ( side _x == side player ) && ( isplayer (leader _x) ) } ] call BIS_fnc_conditionalSelect;
    _scanned_groups = [ _scanned_groups, { ( count units _x > 1 ) || ( count units _x == 1 && leader _x != player ) } ] call BIS_fnc_conditionalSelect;
    KPLIB_overlay_groups = [] + _scanned_groups;

    sleep 1;
};
