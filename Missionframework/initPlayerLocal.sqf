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
Unser Gegner ist eine gut ausgerüstete Miliz. Diese hat hier in Lythium Fuss gefasst und kämpft erbittert um die Kontrolle im Gebiet.</br> 
Der Feind verfügt über umlackierte, russische Fahrzeuge und besitzt starke Luftabwehr. Allerdings verfügt sie über keine Luftwaffe, was uns einen entscheidenden Vorteil verschaffen könnte.</br></br>
Achten Sie aber auf IEDs auf den Strassen, diese sind eine ständige Bedrohung!<br></br>

Als Basis dient der "Liberation" Modus von den Killah Potatoes. Allerdings wurden von uns einige Änderungen vorgenommen, so dass das Gameplay mehr MilSim Charakter erhält. Wichtigste Punkte:</br>
- Ziel ist es, die komplette Karte einzunehmen</br>
- Für jeden eingenommenen Punkt, werden Resssourcen gutgeschrieben</br>
- Die Ressourcen können von Admins und trusted Spielern für Fahrzeuge ausgegeben werden</br>
- Jeder Respawn kostet Ressourcen (Wartet also wenn immer möglich auf Hilfe)
</br></br>
<br></br> 
EN <br></br> 
<br></br> 
Our opponent is a well-equipped militia. This militia has gained a foothold here in Lythium and fights fiercely for control of the area.</br>
The enemy has repainted Russian vehicles and has strong air defenses. However, it has no air force, which could give us a decisive advantage.</br>
Watch out for IEDs on the roads though, they are a constant threat!</br></br>

The "Liberation" mode from the Killah Potatoes serves as the basis. However, we have made some changes so that the gameplay has more MilSim character. Most important points:</br> 
- The goal is to capture the entire map.</br> 
- For each captured point, resources are credited.</br> 
- Resources can be spent on vehicles by admins and trusted players.</br> 
- Every respawn costs resources (so wait for help whenever possible)</br> 
- There are standard loadouts in the arsenal, but they can be customised

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
	
	if ( ((_hs_time select 3) == 19) &&  ((_hs_time select 4) <= 30) ) then {
		hint format['Server restart 19:30 \nFahrzeuge zurück zur FOB! \nReturn vehicles to FOB!'];
	};
	if ( ((_hs_time select 3) == 3) && ((_hs_time select 4) <= 30) ) then {
		hint format['Server restart 03:30 \nFahrzeuge zurück zur FOB! \nReturn vehicles to FOB!'];
	};
	if ( ((_hs_time select 3) == 11) && ((_hs_time select 4) <= 30) ) then {
		hint format['Server restart 11:30 \nFahrzeuge zurück zur FOB! \nReturn vehicles to FOB!'];
	};
};

// hint format['%1:%2', (_hs_time select 3), (_hs_time select 4)];
