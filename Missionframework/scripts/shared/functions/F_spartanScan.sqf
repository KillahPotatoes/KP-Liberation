private [ "_spartans", "_spartan" ];

_spartans = vehicles select {typeof _x == huron_typename && alive _x};
_spartan = objNull;
if ( count _spartans != 0 ) then { _spartan = _spartans select 0 };

_spartan
