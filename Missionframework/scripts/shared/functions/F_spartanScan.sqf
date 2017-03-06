private [ "_spartans", "_spartan" ];

_spartans = [ vehicles , { typeof _x == huron_typename && alive _x } ] call BIS_fnc_conditionalSelect;
_spartan = objNull;
if ( count _spartans != 0 ) then { _spartan = _spartans select 0 };

_spartan
