scriptName "remote_call_endgame";

player allowDamage false;
(vehicle player) allowDamage false;
KPLIB_endgame = 1;
sleep 20;

_this call compile preprocessFileLineNumbers "scripts\client\ui\end_screen.sqf";
