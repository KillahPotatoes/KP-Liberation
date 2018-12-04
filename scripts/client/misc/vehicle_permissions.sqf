private [ "_doeject" ];

_doeject = false;

while { true } do {

	waitUntil { alive player };

	waitUntil { sleep 0.2;
		vehicle player == player
	};

	waitUntil { sleep 0.2;
		(vehicle player != player) &&  ( (vehicle player ) getCargoIndex player ) < 0  && isTouchingGround (vehicle player) && !((vehicle player ) isKindOf "ParachuteBase")
	};

	if ( (vehicle player ) isKindOf "Tank" ) then {
		if ( ! (  [ player, 1 ] call F_fetchPermission ) ) then {
			_doeject = true;
			hint localize "STR_PERMISSION_NO_ARMOR";
		};
	} else {
		if ( (vehicle player ) isKindOf "Air" ) then {
			if ( ! (  [ player, 2 ] call F_fetchPermission ) ) then {
				_doeject = true;
				hint localize "STR_PERMISSION_NO_AIR";
			};
		} else {
			if ( ! (  [ player, 0 ] call F_fetchPermission ) ) then {
				_doeject = true;
				hint localize "STR_PERMISSION_NO_LIGHT";
			};

		};
	};

	if ( _doeject ) then {
		moveOut player;
		_doeject = false;
	};
};