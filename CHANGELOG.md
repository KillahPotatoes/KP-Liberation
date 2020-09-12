# Changelog

## 0.96.7a (2020-09-12)
* Added: Contact DLC static weapon backpacks to default blacklist.
* Added: Czech translation. Thanks to [MJVEVERUSKA](https://github.com/MJVEVERUSKA)
* Added: NATO MTP arsenal preset. Thanks to [lkvk](https://github.com/lkvk)
* Added: NATO Pacific arsenal preset. Thanks to [lkvk](https://github.com/lkvk)
* Added: NATO Woodland arsenal preset. Thanks to [lkvk](https://github.com/lkvk)
* Added: CSAT Hex arsenal preset. Thanks to [lkvk](https://github.com/lkvk)
* Added: CSAT Ghex arsenal preset. Thanks to [lkvk](https://github.com/lkvk)
* Added: AAF arsenal preset. Thanks to [lkvk](https://github.com/lkvk)
* Added: LDF arsenal preset. Thanks to [lkvk](https://github.com/lkvk)
* Added: Mission parameter for direct arsenal access without KPLIB Loadout Dialog.
* Added: Helicopters from GM Update to GM faction presets.
* Added: ACE, TFAR and ACRE items to GM West and East arsenal presets.
* Added: Config value for radio tower classnames.
* Added: Parameter to disable Zeus for commander.
* Added: Disable respawn on attacked FOBs (adjustable via parameter)
* Added: Zeus initialization via BIS scripted events. This makes the Eden placed zeus module (zm1) obsolete.
* Removed: T-14 from RHS AFRF preset.
* Tweaked: "FOB " removed from resource overlay, so it's just e.g. "ALPHA" again.
* Fixed: Sector monitor got stuck after sector cap was reached until restarting the server.
* Fixed: Civilian Informant side mission didn't worked due to script error.
* Fixed: AI didn't surrender correctly when ACE is loaded.
* Fixed: The commander couldn't build squads via the build menu.
* Fixed: Possible "Error: no unit" appearing in permission dialog.
* Fixed: POWs could get saved when near FOB and still in player group.
* Fixed: Civilian Reputation penalty got added to ambush chance, even if ambush chance was set to 0 in config.
* Fixed: When starting with a FOB already built, the FOB actions appeared only after a server restart.
* Fixed: Zeus available mods initialization (when not limited) wasn't reliable enough.

## 0.96.7 (2020-05-10)
* Added: CfgFunctions library created from `shared/functions` and all of these functions optimized.
* Added: Mines and explosives will be saved around FOBs.
* Added: Inheritance support to object inits. (3rd array element, bool)
* Added: USAF mod support for all US based preset. Thanks to [Eogos](https://github.com/Eogos)
* Added: Save interval setting in config file.
* Added: Steam UID whitelist in config to grant access to commander actions even if not in that slot.
* Added: Applied mission parameters are logged in server rpt.
* Added: [Chernarus 2020](https://steamcommunity.com/sharedfiles/filedetails/?id=1913961235) basefile. Thanks to [Eogos](https://github.com/Eogos)
* Added: [Chernarus 2020](https://steamcommunity.com/sharedfiles/filedetails/?id=1913961235) building ignore list. Thanks to [Eogos](https://github.com/Eogos)
* Added: Steam Workshop upload to build tools
* Added: [KP Player Menu](https://github.com/KillahPotatoes/KP-PLM) as optional (default enabled) replacement for the old GREUH extended options. GREUH still available via parameters or if no CBA loaded.
* Added: Locality change of slingloaded cargo to heli pilot to avoid breaking ropes while e.g. slingloading the FOB box.
* Added: Support and utilization of the [Discord Rich Presence Mod](https://steamcommunity.com/sharedfiles/filedetails/?id=1493485159) from [ConnorAU](https://github.com/ConnorAU).
* Added: Confirmation dialog for the "Create Clearance" action at the FOB.
* Added: Parameter (default deactivated) to enable editing of enemy units and vehicles in Zeus.
* Added: Zeus placed objects are now recognized for kill manager, object init and placed resource crates are also filled with 100 resources.
* Added: Auto save of the game state on last player disconnect or local hosted host exit.
* Added: A kind of playerNamespace which sets some widely used variables to the player instead of running same checks in several scripts.
* Added: `KPLIB_fnc_log` function to replace the usage of `diag_log` and apply prefix etc. at one place.
* Added: Arma 3 High Command for commander, toggleable via parameters.
* Added: Arma 3 support module (artillery) functionality with parameter settings and vehicle/player whitelist.
* Added: Visual indicators of the FOB range while in build mode.
* Added: Parameter to disable weapon sway.
* Added: Crates which are spawned upon sector activation are now saved near their sector, if the sector is taken by blufor. (Factories/Cities)
* Added: BWMod arsenal preset.
* Added: Interactive tutorial for the mission start. Deploying first FOB and conquering a factory with starting production.
* Added: Vehicle in Vehicle transport actions to Arsenal crate.
* Removed: `action_manager.sqf` file was removed, due to new action handling.
* Updated: Updated CUP presets to be inline with October 2019 stable build of CUP mods. Thanks to [Eogos](https://github.com/Eogos)
* Updated: Turkish translation. Thanks to [654wak654](https://github.com/654wak654)
* Updated: Russian localization. Thanks to [Dj_Haski](https://github.com/DjHaski)
* Updated: Spanish localization. Thanks to [amunoz20](https://github.com/amunoz20)
* Updated: Existing arsenal presets updated.
* Tweaked: Default blacklist now only holds the static and tent backpacks.
* Tweaked: Scripted server restart now automatically recognizes the OS of the server. More info in the [Wiki article](https://github.com/KillahPotatoes/KP-Liberation/wiki/EN_FAQ#how-does-the-scripted-server-restart-work)
* Tweaked: Infantry for battlegroup transport vehicles are now spawned closer to the objective.
* Tweaked: Transport helicopters in battlegroups are now correctly dropping paratroopers.
* Tweaked: Start vehicle/Potato 01/start resources spawn at mission start optimized.
* Tweaked: Explanation and formatting of `kp_objectInits.sqf`.
* Tweaked: Integer to bool conversion in fetch param macro.
* Tweaked: ObjectInit is now also called on spawned start vehicles.
* Tweaked: Usage of structured text for `diag_log`, so there are no quotes around the messages in the rpt.
* Tweaked: Collection arrays fetching in `init_presets.sqf`.
* Tweaked: Unit/vehicle collecting for adding to editable units in `zeus_synchro.sqf`.
* Tweaked: The save data is now stored as string which can result in ten times less space taken in vars file.
* Tweaked: Actions to deploy/repack a FOB are now bound to the box/truck/building.
* Tweaked: FOB container/truck/building specific commands are now in objectInits instead of having the same in several scripts.
* Tweaked: Arsenal initialization on mission start improved.
* Tweaked: `sector_manager.sqf` reworked as FSM.
* Tweaked: Improved handling of captured/seized vehicles. Should also fix the rare issue with vanishing of captured enemy vehicles.
* Tweaked: Set factory sectors range concerning storage areas to fix 100m instead of scaling with FOB build range.
* Tweaked: Civilians can now be treated with the elastic, basic, packing or QuickClot bandage instead of just the basic one.
* Tweaked: Enabled HALO function by default with 5 minutes cooldown and lowered default mobile respawn cooldown from 15 to 10 minutes.
* Tweaked: Array names for classname collections etc. from `init_presets.sqf`.
* Tweaked: `kp_objectInits.sqf` is now also applied to enemy vehicles.
* Tweaked: Added a chance that battlegroups are now just contain infantry units which spawn closer to target.
* Tweaked: Arrays for enemy rotary- or fixed-wings doesn't need to be filled anymore and can be set as empty `[]`.
* Tweaked: Victory condition parameter by default set to "Capitals and military bases" instead of just capitals.
* Tweaked: ui_manager script optimizations.
* Tweaked: HUD Overlay will auto hide in zeus.
* Tweaked: HUD Overlay with global resources will show on map.
* Tweaked: Shoot surrendering enemies now cause civilian reputation penalty like killing a civilian.
* Tweaked: Description.ext got much more comments and settings.
* Tweaked: Object inits will fire on units not only vehicles.
* Fixed: Some CUP presets had free buildable arsenals. Thanks to [Eogos](https://github.com/Eogos)
* Fixed: Wrong boat in CUP USMC Woodland preset. Thanks to [Eogos](https://github.com/Eogos)
* Fixed: Objects will be recyclable after being towed with Advanced Towing.
* Fixed: Flickering/disappearing of mobile respawn.
* Fixed: Error message when trying to build a sector storage on water didn't vanished.
* Fixed: RHS CH53 and RHS C130J transport configs after RHS 0.5.0 update. Thanks to [FatRefrigerator](https://github.com/FatRefrigerator)
* Fixed: Support for CBA disposable launchers. Thanks to [Dahlgren](https://github.com/Dahlgren)
* Fixed: ACE medical vehicle variable adjusted in `kp_objectInits` due to the recent ACE updates. [Reference](https://github.com/acemod/ACE3/commit/44050df98b00e579e5b5a79c0d76d4d1138b4baa#diff-31034297ef72d8a9855b601934510008)
* Fixed: Weapons could be shown as blacklisted, if a whitelisted weapon was combined with e.g. a whitelisted grip or other attachments.
* Fixed: Rare error message in `recycle_manager.sqf`, if last FOB was repacked to a truck/box.
* Fixed: `Bad conversion: bool` rpt messages in client logs at the beginning of the mission.
* Fixed: Boats weren't recognized for sector activation.

## 0.96.6 (2019-09-09)
* Added: [Swedish Forces Pack](https://steamcommunity.com/sharedfiles/filedetails/?id=826911897) transport configs. Thanks to [Dahlgren](https://github.com/Dahlgren)
* Added: Parameter to enable/disable the vanilla A3 dynamic fog behavior. Default enabled, so `fucking_set_fog.sqf` isn't running by default.
* Added: Parameter to enable/disable limitations on Zeus functionalities. Default enabled to keep old behaviour.
* Added: Parameter to decide to start the campaign with a FOB container (default, like before) or a FOB truck.
* Added: Parameter to allow enemies stay in immobile vehicles (default 50% chance).
* Added: Sector despawn scaling. The longer sector is activated the longer it de-activates. Configurable as parameter, 5min additional delay max by default.
* Added: Korean localization. Thanks to [PanzerKoLee](https://github.com/PanzerKoLee)
* Updated: Russian localization. Thanks to [DjHaski](https://github.com/DjHaski)
* Tweaked: Initial FOB box doesn't have equipment in the inventory anymore.
* Tweaked: Height check for mobile respawn now relies on `isTouchingGround` instead of z value of position.
* Tweaked: Transport config heights on M977 vehicles. Thanks to [FishAI](https://github.com/FishAI)
* Tweaked: AI in building now has a dynamic radius to look for enemies until they start moving again depending on blufor/opfor ratio in sector.
* Fixed: Potato 01 was created after server restart, even if there was one saved.
* Fixed: Missing variable `stats_blufor_teamkills_by_players`. Also no separation between by players or not by players for teamkills anymore.
* Fixed: Factory storages could disappear randomly on save load.
* Fixed: Some Presets had CUP Towing Tractor in the wrong place or duplicated. Thanks to [Eogos](https://github.com/Eogos)
* Fixed: CUP Presets still had the Nemmera in the support vehicle section. Thanks to [Eogos](https://github.com/Eogos)
* Fixed: FOB resources weren't updated in build dialog, when building infantry units.
* Fixed: Some missing parameter information in the map screens parameter overview.
* Fixed: After creating a clearance at a FOB some light sources could remain.

## 0.96.5 (2019-07-26)
* Added: Contact DLC LDF preset.
* Added: Contact DLC transport configs.
* Added: [The Unsung Vietnam War Mod](https://steamcommunity.com/sharedfiles/filedetails/?id=943001311) blufor preset.
* Added: [The Unsung Vietnam War Mod](https://steamcommunity.com/sharedfiles/filedetails/?id=943001311) opfor preset.
* Added: [The Unsung Vietnam War Mod](https://steamcommunity.com/sharedfiles/filedetails/?id=943001311) resistance preset. Thanks to [Bunnyhopps](https://github.com/Bunnyhopps147)
* Added: [The Unsung Vietnam War Mod](https://steamcommunity.com/sharedfiles/filedetails/?id=943001311) civilian preset.
* Added: [The Unsung Vietnam War Mod](https://steamcommunity.com/sharedfiles/filedetails/?id=943001311) arsenal preset. Thanks to [Bunnyhopps](https://github.com/Bunnyhopps147)
* Added: [The Unsung Vietnam War Mod](https://steamcommunity.com/sharedfiles/filedetails/?id=943001311) transport configs.
* Added: [Swedish Forces Pack](https://steamcommunity.com/sharedfiles/filedetails/?id=826911897) arsenal preset. Thanks to [Dahlgren](https://github.com/Dahlgren)
* Added: [Swedish Forces Pack](https://steamcommunity.com/sharedfiles/filedetails/?id=826911897) Desert blufor preset. Thanks to [Dahlgren](https://github.com/Dahlgren)
* Added: [Swedish Forces Pack](https://steamcommunity.com/sharedfiles/filedetails/?id=826911897) Woodland blufor preset. Thanks to [Dahlgren](https://github.com/Dahlgren)
* Added: Several CUP blufor presets. Thanks to [Eogos](https://github.com/Eogos)
* Added: Several CUP opfor presets. Thanks to [Eogos](https://github.com/Eogos)
* Added: Several CUP resistance presets. Thanks to [Eogos](https://github.com/Eogos)
* Added: Several CUP civilian presets. Thanks to [Eogos](https://github.com/Eogos)
* Added: Several CUP transport configs. Thanks to [Eogos](https://github.com/Eogos)
* Added: Statistic values for destroyed civilian buildings and vehicles.
* Added: Statistic values for total and friendly resistance kills.
* Added: Statistic values for spent/produced resources.
* Added: Statistics will be posted additionally in the server log after winning the campaign.
* Added: Encore Anti Air static to sensible presets.
* Added: Additional victory conditions, selectable in the mission parameters.
* Added: BI garbage collection via description.ext file.
* Added: Transport configs for the civil transporters (which came with Laws of War).
* Added: Livonia basefile.
* Added: Livonia building ignore list.
* Added: [Island Panthera](https://steamcommunity.com/sharedfiles/filedetails/?id=708278910) basefile. Thanks to [Eogos](https://github.com/Eogos)
* Added: [Island Panthera](https://steamcommunity.com/sharedfiles/filedetails/?id=708278910) building ignore list. Thanks to [Eogos](https://github.com/Eogos)
* Added: Song Bin Tanh basefile.
* Added: Song Bin Tanh building ignore list.
* Added: "Create Clearance" Action at FOB for Commander or logged in Admin. Clears all terrain objects (no built objects) in FOB radius.
* Added: FOB templates (FOB hunting) are now choosen in accordance with the selected opfor preset. Currently Unsung, Apex and "everything else" are separated. Thanks to [Bunnyhopps](https://github.com/Bunnyhopps147)
* Added: 15 new FOB templates for the FOB hunting side mission. Thanks to [Bunnyhopps](https://github.com/Bunnyhopps147)
* Removed: Vanilla player score saving.
* Removed: Old garbage collection script, as there are now engine solutions available.
* Tweaked: Changed default recycle building from carservice building to tanks repair depot building.
* Tweaked: Changed default air building from small radar dome to encore static radar.
* Tweaked: Vehicle in Vehicle action on FOB box is not displaying directly anymore when approaching the box.
* Tweaked: Added elite vehicles to CSAT presets.
* Tweaked: Formatting/Comments in the preset files.
* Tweaked: objectInit function and added comments to the array.
* Tweaked: Some smaller code optimizations in the whole framework.
* Tweaked: Changes in elite vehicles in presets are now also applied during a running campaign.
* Tweaked: Player lead squads are now also saved near FOBs. (but still needs to be reassigned via zeus after load, of course)
* Tweaked: Weather is now only handled by the server.
* Tweaked: Gear check after leaving the arsenal or load a loadout improved to not strip you completely. Thanks to [Zharf](https://github.com/zharf)
* Tweaked: Build tool now also adds the correct map name to the mission name, like in the release files.
* Tweaked: Sector defenders waypoint creation.
* Tweaked: Daytime parameter values.
* Tweaked: Shorter nights now multiplies the selected daytime time multiplier by 4 between 20:00 and 04:00. (3x between 21:00 and 03:00 before)
* Fixed: Intel value could get corrupted if leaving the secondary dialog directly after starting a mission.
* Fixed: "All is red" for first player after a server restart. (just a visual bug, doesn't affect gameplay)

## 0.96.4 (2019-05-10)
* Added: East Germany arsenal preset.
* Added: West Germany arsenal preset. Thanks to [Dahlgren](https://github.com/Dahlgren)
* Added: East Germany blufor and opfor preset.
* Added: East Germany Winter blufor and opfor preset.
* Added: West Germany blufor and opfor preset.
* Added: West Germany Winter blufor and opfor preset.
* Added: Germany (Global Mobilization) resistence preset.
* Added: Germany (Global Mobilization) civilian preset.
* Added: CSAT Vanilla blufor preset, CSAT Apex blufor preset and CSAT Arsenal preset. Thanks to [zandru](https://steamcommunity.com/id/radicalrabbit)
* Added: AAF and NATO opfor presets. Thanks to [zandru](https://steamcommunity.com/id/radicalrabbit)
* Added: Weferlingen Summer basefile.
* Added: Weferlingen Winter basefile.
* Added: Chernarus Winter basefile.
* Added: Weferlingen Summer and Winter building ignore list.
* Added: Rosche building ignore list. Thanks to [madpat3](https://github.com/madpat3)
* Added: Support for ACE arsenal. Can be enabled via mission parameter.
* Added: Fog removal script readded, as some people had issues with too much fog after some time.
* Added: Vehicle in Vehicle transport actions for FOB Box.
* Added: `kp_objectInits.sqf` for custom code on a vehicle after it has been loaded or built. No more changes in save_manager.sqf and do_build.sqf needed. [Explanation in the Wiki](https://github.com/KillahPotatoes/KP-Liberation/wiki/EN_ConfigFiles#kp_objectinitsqf-since-0964)
* Removed: `KP_liberation_guerilla_transports` array from resistance presets, as it isn't used in the legacy framework.
* Updated: Italian localization. Thanks to [k4s0](https://github.com/k4s0)
* Tweaked: Title of the mission to conform the Mission Name Standard from [BI Forums](https://forums.bohemia.net/forums/topic/217676-mission-name-standard/)
* Tweaked: Weather module is also loaded, even with ACE running. (ACE doesn't control weather completely anymore)
* Tweaked: Disabled script that switched locality of all blufor units to the commander machine. (should fix UAV issue)
* Tweaked: `allPlayers` replaced with `(allPlayers - entities "HeadlessClient_F")` for scripts which should pause when no players are online. (logistic, resources, battlegroups)
* Tweaked: Marker for civilian informant is an area now and not centered on the informants position anymore.
* Tweaked: Renamed Huron marker.
* Tweaked: If there isn't enough enemy territory left for a secondary mission to start, the player gets a small hint now.
* Tweaked: BWMod item classnames in KP_liberation_allowed_items_extension. Thanks to [madpat3](https://github.com/madpat3)
* Tweaked: Equalized all Eden attributes of the mission.sqm files.
* Tweaked: Replaced deprecated `BIS_fnc_conditionalSelect` function calls with sensible select statements.
* Tweaked: Versioning format from e.g. 0.964 to 0.96.4 for a better separation.
* Tweaked: Arsenal whitelist/blacklist classes are case insensitive.
* Tweaked: Vehicle permissions now via sensible event handlers instead of loop. Thanks to [ColinM9991](https://github.com/ColinM9991)
* Tweaked: Objects placed in Eden Editor won't be saved anymore. Fixes possible duplications on save/load.
* Tweaked: Whole in game date and time is now persistent, not only the daytime.
* Fixed: Annoying popup since A3 1.90 concerning missing entry for `widthRailWay`.
* Fixed: Blufor soldier losses weren't counted in statistics.
* Fixed: Missing `itemRadio` in some arsenal presets.

## 0.963a (2018-04-10)
* Added: Action to raise/lower object while building. Thanks to [darrell-aevum](https://github.com/darrell-aevum)
* Added: Some classnames to arsenal allowed extension list. Thanks to [madpat3](https://github.com/madpat3)
* Added: Functionality to save/load mission parameters. Thanks to [veteran29](https://github.com/veteran29)
* Added: Presets for: RDS Civilians, Project OPFOR SLA and Project OPFOR RACS. Thanks to [PSYKO-nz](https://github.com/PSYKO-nz)
* Added: Automatic mission pbo build tool (available on GitHub). Thanks to [Dahlgren](https://github.com/Dahlgren) and [veteran29](https://github.com/veteran29)
* Added: Tanks DLC classnames for presets.
* Added: Group diag output for serverlog.
* Added: Debug output for group count and amount of active scripts. Liberation starts with [13,70,0,1] and may rise to [70,70,0,1].
* Added: Notification for incoming guerilla forces when attacking a sector.
* Added: Vehicle chance for guerilla forces who approach a sector.
* Added: Traditional Chinese localization. Thanks to [KOEI5113](https://github.com/KOEI5113)
* Added: IDE editorconfig file.
* Added: Overview of actual applied mission parameters on the map screen as diary record.
* Removed: Some old scripts which aren't needed anymore.
* Removed: Always no fog.
* Tweaked: All `spawn compileFinal preprocessFileLineNumbers` replaced with `execVM`.
* Tweaked: All `createGroup` now with activated `deleteWhenEmpty`.
* Tweaked: All `BIS_fnc_relPos` replaced with `getPos`.
* Tweaked: Guerilla forces event chances, strength gain values and unit amounts.
* Tweaked: The Commander / Admin can now change the permissions of offline players.
* Tweaked: BI Revive is now automatically deactivated if ACE Medical is loaded.
* Tweaked: FPS map marker is now below the map and also shows count of local groups.
* Tweaked: Overview picture for loading and mission selection screen.
* Tweaked: Log output source name is now set at each run.
* Fixed: Placement of buildings after save/load. Thanks to [Cre8or](https://github.com/Cre8or)
* Fixed: Sometimes helicopters exploded when spawning on the deck of the USS Freedom.
* Fixed: Players couldn't ziptie the civilian informant, if playing with ACE.
* Fixed: File name instead of mission name in mission selection screen.
* Fixed: "Taking Command" spam from AI after players death.
* Fixed: Fixed range for recycling and start of building instead of using FOB range.
* Fixed: Some vehicles with dynamic loadout support lost their weapons when rearmed by Liberation rearm module.

## 0.963 (2018-01-05)
* Added: Some missing RHS vehicles for the ACE medical system.
* Removed: Provided ACE settings, as they are not used anymore since the last ACE update.
* Tweaked: Arsenal blacklist for more compatibility with 3cbBAF. Thanks to [Applejakerie](https://github.com/Applejakerie)
* Tweaked: Some small tweaks for the Lythium basefile.
* Tweaked: BWMod Classnames due to the last mod update. Thanks to [madpat3](https://github.com/madpat3)
* Fixed: There was a string key twice in the stringtable.
* Fixed: Lythium basefile was missing mission name and description in the lobby.
* Fixed: Issue with building premade squads.

## 0.962 (2017-12-10)
* Added: ACE carry interaction for resource crates. Thanks to [veteran29](https://github.com/veteran29)
* Added: Some additional debug outputs.
* Added: RHS AFRF Preset for the player side. Thanks to [veteran29](https://github.com/veteran29)
* Added: Lythium basefile. Thanks to [Enigma](http://steamcommunity.com/profiles/76561198052767508)
* Added: Portuguese localization. Thanks to [NomadRomeo](https://github.com/NomadRomeo)
* Added: BW Mod Tropentarn preset.
* Added: Project OPFOR Islamic State enemy preset and Project OPFOR resistance preset. Thanks to [Applejakerie](https://github.com/Applejakerie)
* Updated: RHS transport configs.
* Updated: RHS vehicles in presets.
* Updated: Devkit mission.sqm.
* Tweaked: Wounded civilians event. Thanks to [veteran29](https://github.com/veteran29)
* Tweaked: Extended allowed items extension list with some bwmod classnames. Thanks to [madpat3](https://github.com/madpat3)
* Tweaked: Detection of UAVs. Thanks to [veteran29](https://github.com/veteran29)
* Tweaked: Enemy vehicle crew spawning. Ensure that they'll be on the right side (important for red vs blue). Thanks to [veteran29](https://github.com/veteran29)
* Tweaked: If you enter the arsenal with a packed weapon or UAV backpack, it won't be identified as blacklisted anymore.
* Tweaked: FOB container mass now scales with the selected spartan helicopter maximum load. Thanks to [veteran29](https://github.com/veteran29)
* Tweaked: Removed clutter and AI from the USS Freedom on all maps.
* Tweaked: Cleaned all custom placed places on all maps some more and renamed the respawn marker from `respawn_west` to `respawn`.
* Tweaked: Increased the distance of the Little Bird spawnpoints on the USS Freedom and let them facing to the front.
* Tweaked: Some typos in the german stringtable. Thanks to [gqgunhed](https://github.com/gqgunhed)
* Tweaked: The US Army woodland troops got the new OCP and were able to throw away their old UCP.
* Fixed: Wounded civilian animation in dedicated server environment. Thanks to [veteran29](https://github.com/veteran29)
* Fixed: With ACE you could take unconscious AI as POW.
* Fixed: You couldn't handcuff surrendered AI with ACE zipties.
* Fixed: Guerilla could spawn as neutral combatants.
* Fixed: Unloading crates from vehicles could let them sink into the ground since the last ArmA Update.

## 0.961 (2017-11-06)
* Added: ACE auto detection. (BI Revive still has to be disabled manually)
* Added: Parameter to decide if vehicles should have cleared cargo or not. Thanks to [veteran29](https://github.com/veteran29)
* Removed: ACE compatibility parameter.
* Updated: ACE settings from our community due to the new pylons system in ACE.
* Updated: Italian localization. Thanks to [k4s0](https://github.com/k4s0)
* Updated: Chinese Simplified localization. Thanks to [nercon](https://github.com/nercon)
* Updated: List of ignored buildings for the civil reputation.
* Tweaked: Logistic convoy ambush chance balancing.
* Fixed: SMAW optic placed in wrong array in RHS presets.

### 0.96 (2017-10-12)
* Added: BI Support System functionality. (Currently deactivated, as there are still issues in MP)
    * Added: Parameter for access to the Support System -> Disabled, Commander, Whitelist, Everyone.
    * Added: BI Artillery support for artillery vehicles and mortars (if built manned or AI ordered to get in as crew).
    * Added: Players can request artillery support from players (generates task).
* Added: Civil Reputation.
    * Added: Config variables in `kp_liberation_config.sqf`.
    * Added: Reputation penalty for killing civilians.
    * Added: Reputation penalty for killing allied resistance fighters.
    * Added: Reputation penalty for seizing civil vehicles.
    * Added: Reputation penalty for destroyed/damaged civil buildings. (evaluated only on capture a sector event)
    * Added: Mission parameter to choose building penalty for damaged or only destroyed buildings.
    * Added: Reputation gain for liberated sectors.
    * Added: After capturing a sector you might find wounded civilians. You can also gain reputation for offering medical support.
* Added: Civil informant.
    * Added: If you've a good reputation, a civil informant can rarely spawn at blufor sectors.
    * Added: Intel increase, if you capture the informant and bring him back to a FOB.
    * Added: There is a chance that an informant will reveal a time critical task to kill a HVT.
* Added: Asymmetric Threats.
    * Added: Possibility of IEDs in blufor sectors, if you have a bad civil reputation.
    * Added: Own logistic convoys can be ambushed by guerilla forces.
    * Added: Value for guerilla strength which will be affected by the events connected to guerilla forces.
    * Added: Guerilla forces presets.
    * Added: Dynamic guerilla forces equipment depending on their strength value.
    * Added: Chance that guerilla forces will join the fight at a sector as friend or foe. (depends on reputation)
    * Added: Possibility of a guerilla ambush in blufor sectors (additional to IEDs).
* Added: Chinese Simplified localization. Thanks to [nercon](https://github.com/nercon)
* Added: Automatic server restart script for dedicated servers. Thanks to [k4s0](https://github.com/k4s0)
* Added: Settings in the mission parameters for particular debug messages.
* Added: Factory map markers now indicate which production facilities are available there.
* Added: LoW Civilians.
* Added: LoW UAV backpacks to the default blacklist.
* Added: LoW AL-6 Pelican UAV.
* Added: Some of the new RHS vehicles.
* Added: Turkish localization. Thanks to [Carbneth](https://github.com/Carbneth)
* Added: Parameter to set a cooldown for using mobile respawns.
* Updated: English ingame tutorial texts in stringtable. Thanks to [FatRefrigerator](https://github.com/FatRefrigerator)
* Removed: Liberation skill handling of AI units, as BI do this good enough now concerning wounds, etc.
* Removed: Vehicle explosion chance script for convoy ambush.
* Removed: Old debug messages.
* Tweaked: Terrain alignment will be persistent during repeat building of objects (like walls). Thanks to [veteran29](https://github.com/veteran29)
* Tweaked: Some reordering of UI elements.
* Tweaked: Localization support for the extended options menu. Thanks to [nercon](https://github.com/nercon)
* Tweaked: Highlight color in production list changed to blue instead of misleading green.
* Tweaked: Amounts of resources on each FOB and production site is now visible in logistic dropdown menu as `(Supplies/Ammo/Fuel)`.
* Tweaked: Removed the logistic convoy cap of 26 (which was due to the alphabet).
* Tweaked: Captured enemy vehicles are now also listed in the commanders zeus interface.
* Tweaked: Cities won't be able to produce resources anymore.
* Tweaked: IED count in cities, capitals and factories is now dependend on the civil reputation.
* Tweaked: Corrected some strings in the stringtable.
* Tweaked: Factories don't have all facilities from the start anymore. The facility they start with is set at campaign start.
* Tweaked: Replaced all deprecated `BIS_fnc_selectRandom` with the engine solution `selectRandom`.
* Tweaked: Server log will now contain the `[STATS]` message of all clients. (players and HCs)
* Tweaked: Preset system split to select blufor, opfor, resistance and civilians independently. Thanks to [Applejakerie](https://github.com/Applejakerie)
* Tweaked: Capitals, cities and factories are now basically guarded by "militia" forces. Switching to regular army if the enemy combat readiness is increased.
* Tweaked: Static weapons array missed some weapons.
* Tweaked: Civil vehicles are now saved at a FOB after they were seized by players.
* Tweaked: Some small code optimizations and format corrections.
* Fixed: Player got custom recoil and aiming coefficients on respawn.
* Fixed: Rare script error on closing respawn screen directly after joining the mission.
* Fixed: Players could deploy multiple FOBs when they selected deploy fast enough on the same container.
* Fixed: It was possible to disassemble a mortar in preview.
* Fixed: Preview vehicles could get saved if you shut down the mission right after canceling the build process or if you'd still the preview in front you.
* Fixed: Small issues due to the default "hold fire" combat mode for AI.
* Fixed: Single Infantry units weren't saved sometimes.
* Fixed: Paratroopers got sometimes an attack helicopter instead of a transport helicopter.
* Fixed: Rescue helipad blocked building in their near vicinity.
* Fixed: MPKill Eventhandler issue when using ACE.
* Fixed: Function to buy a logistic truck worked but caused an error in dedicated server environment.
* Fixed: Couldn't build under powerlines.
* Fixed: Items in backpack weren't checked by arsenal blacklist crawler.

## 0.955 (2017-06-24)
* Added: Some small aesthetic things for the buildlist
* Added: Exception for TFAR items from the 1.0 Beta (it's TFAR_ and not tf_ in the classnames there)
* Added: Malden missionfile. Thanks to [Applejakerie](https://github.com/Applejakerie)
* Updated: German tutorial texts. Thanks to [madpat3](https://github.com/madpat3)
* Tweaked: Jets removed from battlegroups, so they won't spawn on the ground. But they still appear on high awareness
* Tweaked: Recycle action code, changed from `distance` to `distance2D` to prevent issues with buildings like the airport lamp
* Tweaked: Helipads are now added to Zeus, so the commander can delete them, as they can't be recycled normally
* Fixed: Production and Logistic Overview wasn't usable in normal UI scale
* Fixed: The RHS "Mk.V SOC" boat got no recycle action due to the mounted static weapons

## 0.954 (2017-06-19)
* Added: Some small aesthetic things for the buildlist
* Added: Transport configs for the unarmed Blackfish variants (can hold 5 crates). Thanks to [Applejakerie](https://github.com/Applejakerie)
* Tweaked: Production dialog list entries are now color coded depending on the actual production
* Tweaked: Small changes in the save_manager.sqf concerning object placement
* Tweaked: Raised the default production interval a little bit
* Tweaked: Updated ACE serverside settings
* Fixed: UAVs counted to heli / plane count concerning used slots
* Fixed: SDV was missing in the boats array to be able to place it on water
* Fixed: H-Barrier classname changed from the protected to the public one

## 0.953 (2017-06-12)
* Added: Action to stack and sort resources in storage areas
* Updated: Italian localization. Thanks to [k4s0](https://github.com/k4s0)
* Updated: German localization. (umlauts)
* Tweaked: Statics can now be placed inside buildings
* Tweaked: Recycle of objects which won't give any resources is now always possible
* Tweaked: Debug messages
* Tweaked: Added the blackfish to all presets, as it was already listed to be unlockable
* Tweaked: Again a small change at the placement of objects from the savegame
* Fixed: Error in production dialog due to wrong global variable
* Fixed: Last two supply_vehicle elements weren't shown in the build menu

## 0.952 (2017-06-04)
* Added: Action to push resource crates
* Added: More transport configs for various vehicles. Thanks to [ChiefOwens](https://github.com/ChiefOwens)
* Added: Some more vehicles from RHS to the presets
* Added: More buildable lights for the FOB. Thanks to [Reckulation](https://www.killahpotatoes.de/index.php?user/130-reckulation/)
* Added: [A devkit mission.sqm](https://github.com/Wyqer/kp_liberation/wiki/EN:Devkit) for people who want to port Liberation to other maps
* Added: [GitHub Wiki](https://github.com/Wyqer/kp_liberation/wiki) (will be expanded step by step in the future)
* Removed: Some clutter of the custom enemy bases on each map. Could maybe increase performance a little bit
* Tweaked: Starting times of the maps were not equal
* Tweaked: Syncing times for production when resources are stored or unstored in sector storages
* Tweaked: Moved ACE compatibility and Debug setting from `kp_liberation_config.sqf` to parameters
* Fixed: SDV and armed boat recycle caused a script error
* Fixed: AI Squads weren't saved
* Fixed: Start vehicles were spawning with items in the inventory
* Fixed: Sometimes you couldn't slingload crates which were unloaded from a storage

## 0.951 (2017-05-28)
* Added: Boats at the stern of the Freedom for amphibious insertion
* Added: Transport configs for guerilla offroad and van
* Added: Mission parameter to choose between arsenal with no restrictions at all or using the defined preset from `kp_liberation_config.sqf` (no restriction not recommended)
* Added: Al Rayak missionfile
* Updated: Italian localization. Thanks to [k4s0](https://github.com/k4s0)
* Updated: Russian localization. Thanks to [_KOC_](mailto:Constantin.rogozin@ya.ru)
* Tweaked: Syncing between server and clients after building a sector storage
* Tweaked: Debug info output for sector production and logistic management
* Tweaked: Small things on each mission.sqm. Thanks to [Applejakerie](https://github.com/Applejakerie)
* Tweaked: Factories will directly start producing supplies, as soon as a storage area is built
* Tweaked: General syncing of production and logistic data between client and server
* Tweaked: Resource amount is now also being displayed in the production dialog, not only crates count
* Tweaked: Production menu is now also available if near a production sector
* Tweaked: Checking the content of a crate now also checks if `ropeAttachEnabled` is true and set it to true if not
* Tweaked: Improved logistics algorithm concerning behaviour of loading resources
* Tweaked: Removed unarmed vehicles from sector defender vehicles. They are still transports for battlegroups
* Fixed: Hostile map markers on Sahrani had a little offset from the map grid
* Fixed: No intelobjects spawned at military bases
* Fixed: Missing vehicles because of classname changes due to the ArmA 3 update. Thanks to [madpat3](https://github.com/madpat3) for an overview of all changes
* Fixed: Production menu showed timer even if nothing is produced
* Fixed: Production timer displayed as float if using a resource multiplier
* Fixed: Sahrani mission name wasn't displayed in the server browser, even after mission start
* Fixed: FOB Box won't respawn if fallen into the water
* Fixed: It was possible to create a logistic mission without defining a A or B destination
* Fixed: Logistic dialog didn't update when buying or selling a truck
* Fixed: Error in serverlog concerning loading control CaptureFrames BLUFOR and OPFOR
* Fixed: Boat recycle caused a script error
* Fixed: Exploit of build menu if UI was set to show global resources
* Fixed: Build menu reloads constantly

## 0.95 (2017-05-22)
* Added: New resource system
* Added: Italian localization. Thanks to [k4s0](https://github.com/k4s0)
* Added: Action to change alignment (up or terrain aligned) during placement of buildings
* Added: Action to reassign the commander to the zeus module (only shows if the commander has no access to zeus)
* Added: Paradrop of a resource package when first FOB is built
* Added: Action to switch between displaying global or local FOB resources
* Added: Air vehicle slot system (need a Flight Control to build helipads, hangars and air vehicles)
* Added: Blacklist / Whitelist filtering for saved loadouts
* Added: Recycling of enemy vehicles
* Added: Recycle value now depends on vehicle damage, remaining ammo and fuel
* Added: Production system for factories and cities (not capitals). Accessable for the commander if near a FOB
* Added: Ability to build storage areas at sectors, where produced resources will be stored
* Added: Ability to unlock resource facilities in cities, so you can produce that resource there
* Added: RHS transport configs. Thanks to [Applejakerie](https://github.com/Applejakerie)
* Added: Civilian transport configs. Thanks to [Applejakerie](https://github.com/Applejakerie)
* Added: Optional logistics module for smaller groups to enable a automatic logistics system for the commander
* Added: Mission parameter to enable or disable the logistics system
* Added: [3cb BAF](https://3cbmod.wordpress.com) unit and arsenal preset. Thanks to [ChiefOwens](https://github.com/ChiefOwens)
* Added: DLC Jets to most presets
* Added: Sahrani missionfile. Thanks to [Applejakerie](https://github.com/Applejakerie) for helping with OPFOR Points
* Added: Debug messages for the server.rpt. Default disabled and can be enabled in the `kp_liberation_config.sqf`
* Removed: Resource caps system
* Removed: Old vanilla unit preset (custom.sqf already provides a vanilla setting)
* Removed: Passive Income (due to new resource system)
* Removed: Ammo Bounties (due to new resource system)
* Removed: Civilian Penalties (due to new resource system)
* Removed: Overwrite functionality for `classnames.sqf`, as it is no longer needed due to the preset system
* Removed: `gameplay_constants.sqf`
* Removed: Crate spawn at military bases
* Removed: Chimera Base on maps with a suitable amount of ocean for supporting the Freedom
* Merged: `gameplay_constants.sqf` settings into `kp_liberation_config.sqf` and added descriptions to the variables
* Updated: Spanish localization. Thanks to [regiregi22](https://github.com/regiregi22)
* Updated: English InGame Tutorial text with the latest informations for resource, production and logistic system. Thanks to [Applejakerie](https://github.com/Applejakerie)
* Replaced: Manpower icon with supplies icon. Thanks to [jus61](https://github.com/jus61)
* Replaced: Every deprecated `BIS_fnc_MP` with `remoteExec`
* Replaced: ATLAS LHD with USS Freedom. Thanks to [Applejakerie](https://github.com/Applejakerie) for the immersive clutter on the carrier
* Tweaked: Arsenal blacklist filtering. Thanks to [veteran29](https://github.com/veteran29)
* Tweaked: Initialization of the arsenal, which should increase the performance for blacklist using
* Tweaked: Save manager -> helicopters from the Freedom or Chimera won't be saved, as they spawn on every mission start/load
* Tweaked: Name for savegame namespace -> adapts automaticly to worldName
* Tweaked: Revive settings: BI Revive is enabled by default. Disable it, when you use ACE
* Tweaked: Config, as some apex classnames were missing. Thanks to [Applejakerie](https://github.com/Applejakerie)
* Tweaked: If attacking a sector, a random amount of crates with random resources will spawn once.
* Tweaked: Better comments in the unit preset files. Thanks to [Applejakerie](https://github.com/Applejakerie)
* Tweaked: Vehicles with dead crew can now be recycled
* Tweaked: Altis mission.sqm. Thanks to [Applejakerie](https://github.com/Applejakerie)
* Tweaked: Chimera bases on Takistan and Taunus. Thanks to [Applejakerie](https://github.com/Applejakerie)
* Tweaked: Enemy infantry units will now spawn in initial safe state instead of be directly aware
* Tweaked: Chimera / Carrier spawn markers. Removed any dependency, using only invisible grasscutter objects. Makes porting etc. much easier
* Fixed: UAV unconnectable after player death. Thanks to [veteran29](https://github.com/veteran29)
* Fixed: Missing batteries with Apex laser designators. Thanks to [veteran29](https://github.com/veteran29)
* Fixed: Enemy weapon dance. Thanks to [k4s0](https://github.com/k4s0)
* Fixed: Non vanilla paratroopers don't have a parachute
* Fixed: Enemy jets sometimes spawn on the ground instead flying
* Fixed: ACE medical crate was empty and couldn't be recycled
* Fixed: Slingloading while transport crates inside a helicopter causes the helicopter to slingload the loaded crates inside
* Fixed: Some buildable paratroopers from some presets don't had a parachute

## 0.94 (2017-03-20)
* Added: Tanoa missionfile and vanilla apex preset
* Added: Custom made Chimera Base for Tanoa. Thanks to [jus61](https://github.com/jus61) for building it
* Added: X-Cam-Taunus missionfile
* Added: Custom made Chimera Base for X-Cam-Taunus. Thanks to [jus61](https://github.com/jus61) for building it
* Added: Custom made Chimera Base for Chernarus. Thanks to [Enigma](http://steamcommunity.com/profiles/76561198052767508) for building it
* Added: Arsenal whitelist preset system (change via `kp_liberation_config.sqf`)
    * Use blacklist from unit preset (default)
    * custom whitelist file
    * KP Community Selection
    * RHS USAF
    * RHS USAF with ACE3
    * RHS USAF with ACE3 and ACRE2
* Removed: Dependencies on Takistan missionfile
* Removed: Apex dependencies on Chernarus missionfile (custom chimera base had two apex rocks)
* Removed: Apex dependencies on Taunus missionfile
* Replaced: Old hostile markers (exclamation marks) with a unit count sensitive area marking system
* Tweaked: Presets
    * custom.sqf is now default (vanilla is a kind of legacy now)
    * Vehicle ammo prices are raised to make them more valuable
    * Provided custom.sqf now adapt automaticly to installed mods
* Fixed: Falling Little Birds on LHD
* Fixed: Custom flag texture not applied after savegame load
* Fixed: Mapmarker disable won't work

## 0.931 (2017-03-10)
* Added: Takistan Missionfile
* Added: Chernarus Missionfile
* Added: RHS Takistan Classnames Preset (desert camo)
* Added: RHS Classnames Preset (woodland camo)
* Added: RHS / BW Mod Classnames Preset (woodland camo)
* Fixed: BI Revive Error
* Fixed: Starting game with a prebuild FOB caused errors on Takistan

## 0.93 (2017-03-07)
* Added: `kp_liberation_config.sqf` with some additional config values
* Added: ACE support
* Added: Fuel consumption script
* Added: Preset system (will grow with more maps) to choose between different classnames_extension presets
* Added: `custom.sqf` in the preset system, where you can adjust everything to your liking (like editing the old `classnames_extension.sqf`)
* Added: BI Revive System. Activate it via Parameters in the MP Lobby if you don't use ACE
* Added: Option in the mission parameters to disable the whole mapmarkers and disable the function in the extended options for every player
* Added: Ability to blacklist arsenal items
* Removed: Farooq's Revive
* Tweaked: Player group organisation (group changing via extended options ingame still enabled)
* Tweaked: File organization (split scriptpart from missionpart, so it's easier to provide different maps)
