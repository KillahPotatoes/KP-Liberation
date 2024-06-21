scriptName "manage_patrols";

_combat_triggers = [20,40,50,65,80,95];
if ( KPLIB_param_unitcap < 0.9 ) then { _combat_triggers = [20,45,90]; };
if ( KPLIB_param_unitcap > 1.3 ) then { _combat_triggers = [15,25,40,65,75,85,95]; };

_combat_triggers_infantry = [15,35,45,60,70,85];
if ( KPLIB_param_unitcap < 0.9 ) then { _combat_triggers_infantry = [15,40,80]; };
if ( KPLIB_param_unitcap > 1.3 ) then { _combat_triggers_infantry = [10,20,35,55,70,80,90]; };

sleep 5;

waitUntil { sleep 0.3; !isNil "KPLIB_sectors_player" };
waitUntil { sleep 0.3; count KPLIB_sectors_player > 3 };

if !(worldName in KPLIB_battlegroup_clearance) then {
    {
        [_x, false] spawn manage_one_patrol;
        sleep 1;
    } foreach _combat_triggers;
};

{
    [_x, true] spawn manage_one_patrol;
    sleep 1;
} foreach _combat_triggers_infantry;
