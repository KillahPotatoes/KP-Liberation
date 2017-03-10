![KP Liberation](https://www.killahpotatoes.de/images/arma/liberation.png)

# KP Liberation for ArmA 3

## Current version : 0.931

This mission is only a continued project based on the original, but most likely abandoned, mission from [GreuhZbug](https://github.com/GreuhZbug).

[Original Liberation mission v0.924](https://github.com/GreuhZbug/greuh_liberation.Altis)

## Overview
The area has fallen to the OPFOR, and it is up to you to take it back. Embark with your teammates on a persistent campaign that will span several weeks of real time to liberate all the major cities of the area.
* Experience a massive CTI campaign with over 150 different capturable settlements across the entire area,
* Cooperate with 0 to 34 other players, with a commander role and recruitable AI troops to fill the gaps,
* Buy troops and vehicles using three different types of resources,
* Build the FOB of your dreams with an ingame "what you see is what you get" system,
* Fight aggressive and cunning hostile forces who react and adapt to your actions,
* Learn that every window is a threat thanks to the custom urban combat AI,
* Accomplish meaningful secondary objectives that will benefit your progression,
* Never lose your progress with the built-in server-side save system.

Things that were added since GreuhZbugs 0.924
* Added the kp_liberation_config.sqf with some additional config values
* Added ACE support
* Added [fuel consumption script](https://forums.bistudio.com/topic/201953-kp-fuel-consumption-script/)
* Moved the classnames_extension.sqf to a preset system
* Added preset system (will grow with more maps) to choose between different classnames_extension presets
* Added a custom.sqf in the preset system, where you can adjust everything to your liking (like editing the old classnames_extension.sqf)
* Tweaked the player group organisation (group changing via extended options ingame still enabled)
* Added BI Revive System. Activate it via Parameters in the MP Lobby if you don't use ACE
* Added an option in the mission parameters to disable the whole mapmarkers and disable the function in the extended options for every player
* Removed Farooq's Revive
* Added the ability to blacklist arsenal items
* Split scriptpart from missionpart, so it's easier to provide different maps

## Needed Mods
* Altis
	* [CBA A3](http://steamcommunity.com/sharedfiles/filedetails/?id=450814997)
	* To start from an LHD, you need the [ATLAS Mod: LHD Plus](http://steamcommunity.com/sharedfiles/filedetails/?id=677642222)
* Chernarus
	* [CBA A3](http://steamcommunity.com/sharedfiles/filedetails/?id=450814997)
	* [CUP Terrains - Core](http://steamcommunity.com/sharedfiles/filedetails/?id=583496184)
	* [CUP Terrains - CWA](http://steamcommunity.com/sharedfiles/filedetails/?id=853743366)
	* [CUP Terrains - Maps](http://steamcommunity.com/sharedfiles/filedetails/?id=583544987)
	* [FA-18 Super Hornet](http://steamcommunity.com/sharedfiles/filedetails/?id=743099837)
	* [JBAD](http://steamcommunity.com/sharedfiles/filedetails/?id=520618345)
	* [Open Chernarus Project with JBAD](http://steamcommunity.com/sharedfiles/filedetails/?id=786865959)
	* [RHS: Armed Forces of the Russian Federation](http://steamcommunity.com/sharedfiles/filedetails/?id=843425103)
	* [RHS: United States Forces](http://steamcommunity.com/sharedfiles/filedetails/?id=843577117)
* Takistan
	* [CBA A3](http://steamcommunity.com/sharedfiles/filedetails/?id=450814997)
	* [CUP Terrains - Core](http://steamcommunity.com/sharedfiles/filedetails/?id=583496184)
	* [CUP Terrains - CWA](http://steamcommunity.com/sharedfiles/filedetails/?id=853743366)
	* [CUP Terrains - Maps](http://steamcommunity.com/sharedfiles/filedetails/?id=583544987)
	* [FA-18 Super Hornet](http://steamcommunity.com/sharedfiles/filedetails/?id=743099837)
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
* [Arma Enhanced Movement](http://steamcommunity.com/sharedfiles/filedetails/?id=333310405)
* [BWMod](http://steamcommunity.com/sharedfiles/filedetails/?id=870276636)
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
I've provided our community serverconfig.hpp for the [usage with the ace_server.pbo](https://ace3mod.com/wiki/framework/settings-framework.html#32-loading-up-the-server-config) for dedicated servers.
Just copy the userconfig folder into your ArmA 3 Server folder and start the ace_server.pbo as serverside mod.

## Recommended Difficulty Settings
I recommend to use the following difficulty settings for this mission (User profile of your server):
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

## Join us on Discord
[Click to join the Killah Potatoes Discord Server](https://discord.gg/bpPUU48)

## Media
[![Gameplay](http://img.youtube.com/vi/hFQIi5qk8gs/0.jpg)](http://www.youtube.com/watch?v=hFQIi5qk8gs)

