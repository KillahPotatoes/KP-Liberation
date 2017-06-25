# KP Liberation ALiVE Integration

## Current version : 0.955

![KP Liberation](https://www.killahpotatoes.de/images/arma/liberation.png) ![ALiVE](http://alivemod.com/img/home_logo.png)

## Current Version 0.952.01
## Currently Only Supports Takistan Map. More to come!

This mission is an ALiVE integration of [KP/Wyqer's](https://github.com/Wyqer) continuation of [GreuhZbug's](https://github.com/GreuhZbug) Liberation Mission.

If you like the mission and want to send a beer to the people who are actively improving and maintaining it donate to [Wyqer](https://www.paypal.me/wyqer).

# KP Liberation Links and Info
[BI Forum Thread](https://forums.bistudio.com/topic/202711-mpcti-coop-liberation-continued/)

[Steam Workshop](http://steamcommunity.com/id/wyqer/myworkshopfiles/?appid=107410)

[Discord](https://discord.gg/bpPUU48)

# Original Liberation Files and Devs
[Original Liberation mission v0.924](https://github.com/GreuhZbug/greuh_liberation.Altis) and
[GreuhZbug's Github](https://github.com/GreuhZbug)

## Overview
The area has fallen to the enemy, and it is up to you to take it back. Embark with your teammates on a persistent campaign that will span several weeks of real time to liberate all the major cities of the area.
* Experience a massive CTI campaign with up to 200 different capturable settlements across the entire area
* Cooperative gameplay for up to 34 players
* A commander role to take care of the planning, production, logistic and AI commanding
* Recruitable AI troops to fill the gaps
* Buy troops and vehicles using three different types of resources
* Build the FOB of your dreams with an ingame "what you see is what you get" system
* Fight aggressive and cunning hostile forces who react and adapt to your actions
* Learn that every window is a threat thanks to the custom urban combat AI
* Accomplish meaningful secondary objectives that will benefit your progression
* Never lose your progress with the built-in server-side save system

## Public Servers

### Currently SADBOYS Server is private for testing. Public server access coming soon™.

## Needed Mods
This mods are needed if you use the prepacked missionfiles from the release tab or Steam Workshop.
You can play every map without any mods (only the maps themself) if you set the preset to custom in `kp_liberation_config`.
* Takistan
	* [ALiVE](http://alivemod.com/#Download)
	* [CUP Terrains - Core](http://steamcommunity.com/sharedfiles/filedetails/?id=583496184)
	* [CUP Terrains - Maps](http://steamcommunity.com/sharedfiles/filedetails/?id=583544987)
	* [Project OPFOR](http://steamcommunity.com/sharedfiles/filedetails/?id=735566597)
	* [RHS: Armed Forces of the Russian Federation](http://steamcommunity.com/sharedfiles/filedetails/?id=843425103)
	* [RHS: United States Forces](http://steamcommunity.com/sharedfiles/filedetails/?id=843577117)

## Recommended Mods
This Mods would greatly increase your gaming experience:
* [ACE](http://steamcommunity.com/sharedfiles/filedetails/?id=463939057)
* [ACE Compat - RHS Armed Forces of the Russian Federation](http://steamcommunity.com/workshop/filedetails/?id=773131200)
* [ACE Compat - RHS United States Armed Forces](http://steamcommunity.com/workshop/filedetails/?id=773125288)
* [ACE3 - BWMOD Compatibility](http://steamcommunity.com/sharedfiles/filedetails/?id=870313336)
* [ACRE 2](http://steamcommunity.com/sharedfiles/filedetails/?id=751965892)
* [Enhanced Movement](http://steamcommunity.com/sharedfiles/filedetails/?id=333310405)
* [Enhanced Visuals](http://steamcommunity.com/sharedfiles/filedetails/?id=880703327)
* [FA-18 Super Hornet](http://steamcommunity.com/sharedfiles/filedetails/?id=743099837)
* [Immerse](http://steamcommunity.com/sharedfiles/filedetails/?id=825172265)
* [JSRS SOUNDMOD](http://steamcommunity.com/sharedfiles/filedetails/?id=861133494)
* [JSRS SOUNDMOD - Additional](http://steamcommunity.com/sharedfiles/filedetails/?id=863393819)
* [KP Ranks](http://steamcommunity.com/sharedfiles/filedetails/?id=741621641)
* [LAxemann's Suppress](https://steamcommunity.com/sharedfiles/filedetails/?id=825174634)

Also you should think about using this mods as serverside mods:
* [Advanced Rappeling](http://steamcommunity.com/sharedfiles/filedetails/?id=713709341)
* [Advanced Sling Loading](http://steamcommunity.com/sharedfiles/filedetails/?id=615007497)
* [Advanced Towing](http://steamcommunity.com/sharedfiles/filedetails/?id=639837898)
* [Advanced Urban Rappeling](http://steamcommunity.com/sharedfiles/filedetails/?id=730310357)

## ACE Serverside Settings
Wyqer provided the KP community serverconfig.hpp for the [usage with the ace_server.pbo](https://ace3mod.com/wiki/framework/settings-framework.html#32-loading-up-the-server-config) for dedicated servers.
Just copy the userconfig folder into your ArmA 3 Server folder and start the ace_server.pbo as serverside mod.

## Recommended Difficulty Settings
KP recommends using the following difficulty settings for this mission (User profile of your server):
```
class CustomDifficulty
{
	class Options
	{
		groupIndicators=0;
		friendlyTags=0;
		enemyTags=0;
		detectedMines=0;
		commands=0;
		waypoints=0;
		weaponInfo=1;
		stanceIndicator=1;
		reducedDamage=0;
		staminaBar=0;
		weaponCrosshair=0;
		visionAid=0;
		thirdPersonView=0;
		cameraShake=1;
		scoreTable=0;
		deathMessages=0;
		vonID=1;
		mapContent=0;
		autoReport=0;
		multipleSaves=0;
		squadRadar=0;
		tacticalPing=0;
	};
	aiLevelPreset=1;
};
```

In the server config file:
```
forcedDifficulty = "custom";

class Missions
{
	class kp_liberation
	{
		template = "kp_liberation.Altis";
		difficulty = "custom";
	};
};
```



## Changelog

### 0.955
* TODO: // FILL ME IN!

### 0.952.01
* Added: ALiVE Support Module integration with Transport Helicopter (Ghost Hawk) and Artillery Position (M109A6 x3). Requires Banana for Support Menu Access
* Added: CAS Module testing

