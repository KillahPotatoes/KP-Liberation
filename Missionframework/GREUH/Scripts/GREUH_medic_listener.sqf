public_medic_message = [];

while { true } do {
	waitUntil { 
		sleep 0.3;
		count public_medic_message != 0;
	};
	
	_unit = (public_medic_message select 0);
	if (_unit != player) then {
		_unit sidechat (public_medic_message select 1);
	};
	public_medic_message = [];
};