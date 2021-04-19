waitUntil {!isNull player};

_rules = '
DE<br /><br />
Natürlich gelten hier wie auch auf dem Server die üblichen (Verhaltens)Regeln. Wir verzichten darauf, diese hier alle aufzuführen. Einige Punkte sind aber vor allem spielerisch hervorzuheben:<br /><br />
- Spielt zusammen und versucht stets, ein gemeinsames Spiel zu ermöglichen<br />
- Respawn oder Disconnect, während man bewusstlos ist, kostet Ressourcen -> Wartet also nach Möglichkeit immer auf Rettung<br />
- Jeder Spieler muss mittels TFAR auf dem KV13-Teamspeak erreichbar sein<br />
- Die Gruppen sprechen sich gegenseitig ab und schreiben ihre Frequenz auf den Kartenrand (50 ist normalerweise Zugfunk)<br />
- Fahrzeug- und Baurechte erhält ihr nur mit einer Empfehlung. Mehr dazu im #recommendations Channel<br />
- Wer fliegen möchte, muss einem Admin kurz zeigen, dass er Abheben und Landen kann, bevor die Rechte gegeben werden<br />
- Nur signierte Mods aus dem Workshop oder unserem Repository nutzen<br />
- Spass haben und lieb sein zueinander

<br /><br />
EN<br /><br />
Of course, the usual (behavioural) rules apply here as well as on the server. We refrain from listing them all here. However, some points should be emphasised, especially from a gameplay point of view:<br /><br />
- Play together as a group.<br />
- Respawning or disconnecting while unconscious costs resources -> always wait for rescue if possible.<br />
- Every player must be reachable via TFAR on the KV13 teamspeak.<br />
- The groups talk to each other and write their frequency on the edge of the card (LR50 is usually the platoon-frequency)<br />
- You can only get vehicle- and building rights with a recommendation. More about this in the #recommendations channel<br />
- Anyone who wants to fly must briefly show an admin that they can take off and land before the rights are given<br />
- Only use signed mods from the workshop or our repository<br />
- Have fun and be nice to each other
<br /><br /> 
<br /><br />
';

_situation = '
DE <br /><br />
Unser Gegner ist eine gut ausgerüstete Miliz. Diese hat hier in Lythium Fuss gefasst und kämpft erbittert um die Kontrolle im Gebiet.<br /> 
Der Feind verfügt über umlackierte, russische Fahrzeuge und besitzt starke Luftabwehr. Allerdings verfügt sie über keine Luftwaffe, was uns einen entscheidenden Vorteil verschaffen könnte.<br /><br />
Achten Sie aber auf IEDs auf den Strassen, diese sind eine ständige Bedrohung!<br /><br />

Als Basis dient der "Liberation" Modus von den Killah Potatoes. Allerdings wurden von uns einige Änderungen vorgenommen, so dass das Gameplay mehr MilSim Charakter erhält. Wichtigste Punkte:<br />
- Ziel ist es, die komplette Karte einzunehmen<br />
- Für jeden eingenommenen Punkt, werden Resssourcen gutgeschrieben<br />
- Die Ressourcen können von Admins und trusted Spielern für Fahrzeuge ausgegeben werden<br />
- Jeder Respawn kostet Ressourcen (Wartet also wenn immer möglich auf Hilfe)
<br /><br />
EN <br /><br />
Our opponent is a well-equipped militia. This militia has gained a foothold here in Lythium and fights fiercely for control of the area.<br />
The enemy has repainted Russian vehicles and has strong air defenses. However, it has no air force, which could give us a decisive advantage.<br />
Watch out for IEDs on the roads though, they are a constant threat!<br /><br />

The "Liberation" mode from the Killah Potatoes serves as the basis. However, we have made some changes so that the gameplay has more MilSim character. Most important points:<br /> 
- The goal is to capture the entire map.<br /> 
- For each captured point, resources are credited.<br /> 
- Resources can be spent on vehicles by admins and trusted players.<br /> 
- Every respawn costs resources (so wait for help whenever possible)<br /> 
- There are standard loadouts in the arsenal, but they can be customised
<br /><br />
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
	
	if ( ((_hs_time select 3) == 18) &&  ((_hs_time select 4) >= 30) ) then {
		hint format['Server restart 19:00 \nFahrzeuge zurück zur FOB! \nReturn vehicles to FOB!'];
	};
	if ( ((_hs_time select 3) == 2) && ((_hs_time select 4) >= 30) ) then {
		hint format['Server restart 03:00 \nFahrzeuge zurück zur FOB! \nReturn vehicles to FOB!'];
	};
	if ( ((_hs_time select 3) == 10) && ((_hs_time select 4) >= 30) ) then {
		hint format['Server restart 11:00 \nFahrzeuge zurück zur FOB! \nReturn vehicles to FOB!'];
	};
};

// hint format['%1:%2', (_hs_time select 3), (_hs_time select 4)];
