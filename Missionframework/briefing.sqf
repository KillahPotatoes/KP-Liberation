diag_log format['**Starting Briefing.sqf**'];

if (!hasInterface) exitWith {}; //skip for server and hc

player createDiarySubject ["menu1","Server Rules"];
player createDiarySubject ["menu2","Missions"];
player createDiarySubject ["menu3","Tips"];

player createDiaryRecord ["menu1",
["Server Rules","<br/>
<font size='16'>General Rules</font> <br/>
- No Friendly Fire (that means killing of any bluforce unit in any way for any reason)<br/>
- No Killing Civilians <br/>
- No Destroying Buildings <br/>
- No Recruiting on other Servers <br/>
- Stay out of Operations Areas unless active and you are part of the Ops unit<br/>
<br/>

<font size='16'>Persistent Mode</font> <br/>
<font size='12'>Default mode of the server</font> <br/>
- Free to engage any locations that are not marked for Ops <br/>
- Free to use all vehicles <br/>
- Free to respawn <br/>
- Free to use radio (even when downed) <br/>
- Very loose chain of command <br/>
<br/>

<font size='16'>Ops Mode</font> <br/>
<font size='12'>Active during server events</font> <br/>
- Follow the rules set by Ops Leader <br/>
- Only respawn on command by Ops Leader or Squad Leader <br/>
- Only use vehicles cleared by Ops Leader or Squad Leader <br/>
- No use of radio when downed, only direct <br/>
- No lone wolfing, a minimum of 2 Units must be together at all times <br/>
- When downed, roleplay the timer based on color <br/>
"]];

player createDiaryRecord ["menu",
["Missions","<br/>
Missions are posted in the #missions channel on Discord <br/>
In game briefings will be added at a later date <br/>
"]];

player createDiaryRecord ["menu3",
["Tips","<br/>
- Press END to use Earplugs <br/>
- Automatic restart around 6AM GMT+1 <br/>
"]];