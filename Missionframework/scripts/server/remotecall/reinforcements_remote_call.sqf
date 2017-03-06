if ( isServer ) then {

	params [ "_targetsector" ];
	[ _targetsector ] spawn reinforcements_manager;

};