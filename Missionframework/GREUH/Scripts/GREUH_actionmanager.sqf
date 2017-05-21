_idact = -1;
while { true } do {
	waitUntil{ sleep 0.3; alive player };
	_idact = player addAction ["<t color='#FF8000'>-- Extended Options --</t>","GREUH\scripts\GREUH_dialog.sqf","",-1000,false,true];
	waitUntil{ sleep 0.3; !alive player};
};