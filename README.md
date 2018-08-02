![KP Liberation](https://www.killahpotatoes.de/images/arma/liberation.png)

# KP Liberation for ArmA 3

[![license](https://img.shields.io/github/license/KillahPotatoes/KP-Liberation.svg)](https://github.com/KillahPotatoes/KP-Liberation/LICENSE)
[![GitHub release](https://img.shields.io/github/release/KillahPotatoes/KP-Liberation.svg)](https://github.com/KillahPotatoes/KP-Liberation/releases)
[![GitHub Release Date](https://img.shields.io/github/release-date/KillahPotatoes/KP-Liberation.svg)](https://github.com/KillahPotatoes/KP-Liberation/releases)
[![Github All Releases](https://img.shields.io/github/downloads/KillahPotatoes/KP-Liberation/total.svg)](https://github.com/KillahPotatoes/KP-Liberation)

[![GitHub issues](https://img.shields.io/github/issues-raw/KillahPotatoes/KP-Liberation.svg)](https://github.com/KillahPotatoes/KP-Liberation/issues)
[![GitHub closed issues](https://img.shields.io/github/issues-closed-raw/KillahPotatoes/KP-Liberation.svg)](https://github.com/KillahPotatoes/KP-Liberation/issues?q=is%3Aissue+is%3Aclosed)
[![GitHub pull requests](https://img.shields.io/github/issues-pr-raw/KillahPotatoes/KP-Liberation.svg)](https://github.com/KillahPotatoes/KP-Liberation/pulls)
[![GitHub closed pull requests](https://img.shields.io/github/issues-pr-closed-raw/KillahPotatoes/KP-Liberation.svg)](https://github.com/KillahPotatoes/KP-Liberation/pulls?q=is%3Apr+is%3Aclosed)

[BI Forum Thread](https://forums.bistudio.com/topic/202711-mpcti-coop-liberation-continued/)

[Steam Workshop](http://steamcommunity.com/id/wyqer/myworkshopfiles/?appid=107410)

[Discord](https://discord.gg/3HqWqVp)

This mission is a full rewrite of the original mission from [GreuhZbug](https://github.com/GreuhZbug).

[Original Liberation mission v0.924](https://github.com/GreuhZbug/greuh_liberation.Altis)

If you like the work and think it's worth a small donation, feel free to use the following link:

[Donate via paypal.me](https://www.paypal.me/wyqer)

## REFACTORING BRANCH
**!!Not meant to be used for playing at all!!**

As we use [ZenHub](https://github.com/marketplace/zenhub) for our workflow instead of the GitHub project board, you need this addon to have a look at the complete workflow. But we're trying to keep the labels on issues etc. always up to date, so you can briefly follow the workflow also without ZenHub.

**!TAKE ATTENTION TO THE LICENSE CHANGE FOR EVERYTHING IN THIS BRANCH!**

This will replace the current missioncode when it's finished.

Guess the hardest thing is to think "out of the box" for already working code. If you look through a code which works without any issues it's not that easy to really find "completely different" ways to realize the functionality in a possible more performance friendly or "better" way. Small tweaks and optimizations are common to find, but rewrite it in a completely different way would be the challenge (if even really needed in the particular file).

Many thanks in advance for all supporters and the Liberation community.

### Goal
* Modular and therefore much cleaner structure
* More streamlined code
* Performance improvements due to code optimizations
* Easier ways to debug
* Easier ways to add additional gameplay aspects due to the modular framework
* There should be no need to do any additions in any `mission.sqm` (removing would be ok)
* Personally: Using this project to get more familiar with SQF and the Liberation mission itself than before

### Conventions
* Global variable naming: `KPLIB_moduleName_variableName`
    * moduleName: The name of the module like `init` or if it is kind of a global category like `preset` or `param`
    * variableName: Name of the specific variable like `heavySquad` or `adaptiveEnemy`
    * Only some very rare variables have no moduleName, as they are not directly connected to a module.
* Function naming: `KPLIB_fnc_moduleName_functionName` (same rules like for the variables)
* CfgFunctions Framework
    * `KPLIB_functions.hpp` in missionroot as central fetching file
    * Each module has an own `functions.hpp` which is included by the `KPLIB_functions.hpp`
* Modular structure
    * Naming for modules: `loadOrderNumber_moduleName` like `00_init` or `01_core`
    * Each module will handle one aspect of the game. For example the initialization, core mechanics, enemy spawn, civil reputation, etc.
    * General structure:
        * `fnc` folder for functions and one-time-procedures
        * `scripts` folder for the scripts (so basically everything which runs a loop through the whole session)
            * Seperation (if even needed) with a `server`, `client`, `shared` folder
        * `ui` folder for all dialogs or ui defines which are brought or needed by that module
        * `functions.hpp` to define the functions of this module
        * `globals.sqf` to define all global variables which are brought or needed by that module and aren't defined before
        * `initModule.sqf` which is called by all machines and where possible seperation for clients/HCs/Server will happen
        * `ui.hpp` to define the ui elements and dialogs from this module (will be included by the `KPLIB_ui.hpp` in the mission root)

## Overview
The area has fallen to the enemy, and it is up to you to take it back. Embark on a persistent campaign with your teammates to liberate all the major cities of the area will most likely span several weeks of real time.
* Experience a massive “Capture the Island” campaign involving a large range of different settlements across the entire area.
* Cooperate with up to 34 players, including a Commanding role, two fire-team squads, a medevac and a logistical support squad as well as AI recruits to fill the gaps.
* Purchase both infantry and both ground and air vehicles using three different types of physical resources; supplies, ammunition and fuel.
* Build the FOB of your dreams with an in-game "what you see is what you get" system.
* Play within an immersive engine that not only punishes you for civilian casualty but diversely reacts in turn.
* Combat aggressive and cunning hostile forces who react and adapt to your actions.
* Monitor and work alongside, or against, independent guerrilla forces.
* Learn that every window is a threat thanks to the custom urban combat AI.
* Accomplish meaningful secondary objectives that will benefit your progression.
* Never lose your progress with the built-in server-side save system.

## Needed Mods

**Always required:** [CBA A3](http://steamcommunity.com/sharedfiles/filedetails/?id=450814997)

These mods are needed if you want to use the prepackaged missionfiles from the release tab or Steam Workshop.
You can play every map without any mods (only the maps themself) if you set the preset to custom in the file `kp_liberation_config`.
* Al Rayak
    * [CUP Terrains - Core](http://steamcommunity.com/sharedfiles/filedetails/?id=583496184)
    * [CUP Terrains - Maps](http://steamcommunity.com/sharedfiles/filedetails/?id=583544987)
    * [G.O.S Al Rayak](http://steamcommunity.com/sharedfiles/filedetails/?id=648172507)
    * [RHS: Armed Forces of the Russian Federation](http://steamcommunity.com/sharedfiles/filedetails/?id=843425103)
    * [RHS: United States Forces](http://steamcommunity.com/sharedfiles/filedetails/?id=843577117)
* Altis
    * None
* Chernarus
    * [CUP Terrains - Core](http://steamcommunity.com/sharedfiles/filedetails/?id=583496184)
    * [CUP Terrains - Maps](http://steamcommunity.com/sharedfiles/filedetails/?id=583544987)
    * [RHS: Armed Forces of the Russian Federation](http://steamcommunity.com/sharedfiles/filedetails/?id=843425103)
    * [RHS: United States Forces](http://steamcommunity.com/sharedfiles/filedetails/?id=843577117)
    * Recommended for more enterable buildings on Chernarus
        * [DonkeyPunch.INFO Open Chernarus Project](http://steamcommunity.com/sharedfiles/filedetails/?id=786777307)
* Lythium
    * [Jbad](http://steamcommunity.com/sharedfiles/filedetails/?id=520618345)
    * [Lythium](http://steamcommunity.com/sharedfiles/filedetails/?id=909547724)
    * [Project OPFOR](http://steamcommunity.com/sharedfiles/filedetails/?id=735566597)
    * [RHS: Armed Forces of the Russian Federation](http://steamcommunity.com/sharedfiles/filedetails/?id=843425103)
    * [RHS: United States Forces](http://steamcommunity.com/sharedfiles/filedetails/?id=843577117)
* Malden
    * None
* Sahrani
    * [CUP Terrains - Core](http://steamcommunity.com/sharedfiles/filedetails/?id=583496184)
    * [CUP Terrains - Maps](http://steamcommunity.com/sharedfiles/filedetails/?id=583544987)
    * [RHS: Armed Forces of the Russian Federation](http://steamcommunity.com/sharedfiles/filedetails/?id=843425103)
    * [RHS: United States Forces](http://steamcommunity.com/sharedfiles/filedetails/?id=843577117)
* Takistan
    * [CUP Terrains - Core](http://steamcommunity.com/sharedfiles/filedetails/?id=583496184)
    * [CUP Terrains - Maps](http://steamcommunity.com/sharedfiles/filedetails/?id=583544987)
    * [Project OPFOR](http://steamcommunity.com/sharedfiles/filedetails/?id=735566597)
    * [RHS: Armed Forces of the Russian Federation](http://steamcommunity.com/sharedfiles/filedetails/?id=843425103)
    * [RHS: United States Forces](http://steamcommunity.com/sharedfiles/filedetails/?id=843577117)
* Tanoa
    * None
* Taunus (very resource-intensive map)
    * [BWMod](http://steamcommunity.com/sharedfiles/filedetails/?id=1200127537)
    * [CUP Terrains - Core](http://steamcommunity.com/sharedfiles/filedetails/?id=583496184)
    * [CUP Terrains - Maps](http://steamcommunity.com/sharedfiles/filedetails/?id=583544987)
    * [RHS: Armed Forces of the Russian Federation](http://steamcommunity.com/sharedfiles/filedetails/?id=843425103)
    * [RHS: United States Forces](http://steamcommunity.com/sharedfiles/filedetails/?id=843577117)
    * [X-Cam-Taunus (Version 1.1)](http://steamcommunity.com/sharedfiles/filedetails/?id=836147398)

## Recommended Mods
These mods are recommended by us, as they are likely to increase your gaming experience:
* [ACE](http://steamcommunity.com/sharedfiles/filedetails/?id=463939057)
* [ACE Compat - RHS Armed Forces of the Russian Federation](http://steamcommunity.com/workshop/filedetails/?id=773131200)
* [ACE Compat - RHS United States Armed Forces](http://steamcommunity.com/workshop/filedetails/?id=773125288)
* [ACE3 - BWMOD Compatibility](http://steamcommunity.com/sharedfiles/filedetails/?id=870313336)
* [ACRE 2](http://steamcommunity.com/sharedfiles/filedetails/?id=751965892)
* [Advanced Urban Rappeling](http://steamcommunity.com/sharedfiles/filedetails/?id=730310357)
* [Enhanced Movement](http://steamcommunity.com/sharedfiles/filedetails/?id=333310405)
* [FA-18 Super Hornet](http://steamcommunity.com/sharedfiles/filedetails/?id=743099837)
* [Immerse](http://steamcommunity.com/sharedfiles/filedetails/?id=825172265)
* [JSRS SOUNDMOD](http://steamcommunity.com/sharedfiles/filedetails/?id=861133494)
* [JSRS SOUNDMOD - Additional](http://steamcommunity.com/sharedfiles/filedetails/?id=863393819)
* [KP Ranks](http://steamcommunity.com/sharedfiles/filedetails/?id=741621641)
* [LAxemann's Suppress](https://steamcommunity.com/sharedfiles/filedetails/?id=825174634)

Also you should think about using these mods as serverside mods: 
* [Advanced Rappeling](http://steamcommunity.com/sharedfiles/filedetails/?id=713709341)
* [Advanced Sling Loading](http://steamcommunity.com/sharedfiles/filedetails/?id=615007497)
* [Advanced Towing](http://steamcommunity.com/sharedfiles/filedetails/?id=639837898)

## Recommended Difficulty Settings
I recommend using the following difficulty settings for this mission (User profile of your server):
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

## Media
[![Gameplay](http://img.youtube.com/vi/ULSxjp8cIUM/0.jpg)](https://www.youtube.com/watch?v=ULSxjp8cIUM)

## License
Copyright (C) 2017 [Killah Potatoes Gaming Community](https://github.com/KillahPotatoes)

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.

### Short License Summary / Guideline
*This small summary does not replace the license text or validity in any way.*

* If you use the mission code within your community on a **non-public server** and with **no public access to the mission code** then you can freely edit the mission code for this purpose. The only condition is that you keep the same license and the copyright notice (this readme) within your mission file.

* If you want to edit the mission code and publish your derivative anywhere **public** or run a **public server** with an edited derivative of the original mission code, you are free to do so under these conditions: 
    * Your edited mission code must be published under the same license, with the original copyright notice.
    * The source code of the mission must be visible to the public (via a Github repository for example). The link to this source code repository must be linked somewhere in the description/readme of the published derivative.
    * You must state every change you have made to the source code at this public repository (via the commit history of your Github repository for example).
