player allowDamage false;
(vehicle player) allowDamage false;
GRLIB_endgame = 1;
sleep 20;

_this call compileFinal preprocessFileLineNumbers "scripts\client\ui\end_screen.sqf";
