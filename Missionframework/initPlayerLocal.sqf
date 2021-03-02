


waitUntil {!isNull player};


_rules = '
<br></br> 
DE<br></br> 
<br></br> 
Respawn oder Disconnect, während man bewusstlos ist, kostet Ressourcen. <br></br> 
Wann immer möglich, auf Rettung warten und versuchen, andere zu retten. <br></br> 
<br></br> 
Jeder Spieler muss mittels TFAR auf Teamspeak erreichbar sein. <br></br> 
Teamspeak-Server-Nickname: kampfverband-13.de <br></br> 
Jede Gruppe muss auf der Frequenz 42 erreichbar sein. <br></br> 
<br></br> 
Um Fahrzeug- und Baurechte zu bekommen, muss man jemanden mit bestehenden Rechten bitten, eine Empfehlung über Discord zu schreiben. <br></br> 
Der Einladungslink steht in der Teamspeak Channel-Beschreibung. 
<br></br> 
<br></br> 
<br></br> 
EN<br></br> 
<br></br> 
Respawn or disconnect while being unconscious costs resources. <br></br> 
Whenever possible, wait for rescue and try to rescue others. <br></br> 
<br></br> 
Each player has to be available via TFAR on Teamspeak. <br></br> 
Teamspeak server nickname: kampfverband-13.de <br></br> 
Each group has to be available on frequency 42. <br></br> 
<br></br> 
To get vehicle and building privileges, you have to ask somebody with existing privileges to write a recommendation via Discord.<br></br> 
An invite link can be found in the Teamspeak channel description. 
<br></br> 
<br></br>
';


_situation = '
DE <br></br> 
<br></br> 
Ein neues Militärbündnis ehemaliger Schwellenländer (CSAT) versucht, sich den Zugang zu Ressourcen mit Gewalt zu sichern. <br></br> 
Dadurch entstehen Konflikte mit den alten Machtblöcken Russland und NATO, die in diesem Fall kooperieren. <br></br> 
In der nahen Zukunft verwenden kleinere Armeen zunehmend die Ausrüstung ihrer größeren Verbündeten, um sich Eigenentwicklungen zu sparen und einfacher zusammen arbeiten zu können. <br></br> 
<br></br> 
<br></br> 
EN <br></br> 
<br></br> 
A new military alliance of emerging economies (CSAT) tries to secure access to resources by violence. <br></br> 
This creates conflicts with the old power blocks Russia an NATO, who cooperate in this case. <br></br> 
In the near future smaller armies increasingly use equipment of their bigger allies, to save on custom development and simplify cooperation. <br></br> 
<br></br> 
<br></br>
';


player createDiaryRecord ['Diary', ['Regeln / Rules', _rules], taskNull, '', false];

player createDiaryRecord ['Diary', ['Situation', _situation], taskNull, '', false];




sleep 60;
hint format['
Karte öffnen, Regeln lesen! \n
Open map, read rules! \n
TeamSpeak Server: kampfverband-13.de \n
'];

sleep 180;
hint format['
Karte öffnen, Regeln lesen! \n
Open map, read rules! \n
TeamSpeak Server: kampfverband-13.de \n
'];





while {true} do{
		
	sleep 300;
	
	_hs_time = systemTime;
	
	if ( ((_hs_time select 3) >= 16) && ((_hs_time select 3) < 17) && ((_hs_time select 4) >= 30) ) then {
		hint format['Server restart 17:00 \nFahrzeuge zurück zur FOB! \nReturn vehicles to FOB!'];
	}else{
		if ( ((_hs_time select 3) >= 4) && ((_hs_time select 3) < 5) && ((_hs_time select 4) >= 30) ) then {
			hint format['Server restart 05:00 \nFahrzeuge zurück zur FOB! \nReturn vehicles to FOB!'];
		}		
	};
	
};

// hint format['%1:%2', (_hs_time select 3), (_hs_time select 4)];






