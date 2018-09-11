/*
    KP LIBERATION MISSION PARAMETER FILE

    File: KPLIB_params.hpp
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2017-10-16
    Last Update: 2018-09-11
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Definitions and default values for all mission parameters.
*/

class ParamsOptions {
    title = $STR_PARAMS_PARAMSOPTIONS;
    values[] = {""};
    texts[] = {""};
    default = "";
};

class LoadSaveParams {
    title = $STR_PARAMS_LOADSAVEPARAMS;
    values[] = {2,1,0,-1};
    texts[] = {$STR_PARAMS_LOADSAVEPARAMS_SAVE, $STR_PARAMS_LOADSAVEPARAMS_LOAD, $STR_PARAMS_LOADSAVEPARAMS_SELECTED, $STR_PARAMS_LOADSAVEPARAMS_WIPE};
    default = 1;
};

class Spacer0 {
    title = "";
    values[] = {""};
    texts[] = {""};
    default = "";
};

class MissionOptions {
    title = $STR_PARAMS_MISSIONOPTIONS;
    values[] = {""};
    texts[] = {""};
    default = "";
};

class Unitcap {
    title = $STR_PARAMS_UNITCAP;
    values[] = {0.5,0.75,1,1.25,1.5,2};
    texts[] = {$STR_PARAMS_UNITCAP1,$STR_PARAMS_UNITCAP2,$STR_PARAMS_UNITCAP3,$STR_PARAMS_UNITCAP4,$STR_PARAMS_UNITCAP5,$STR_PARAMS_UNITCAP6};
    default = 1; // Default value. Must be one from the values array above.
    persistent = 1;
};

class Difficulty {
    title = $STR_PARAMS_DIFFICULTY;
    values[] = {0.5,0.75,1,1.25,1.5,2,4,10};
    texts[] = {$STR_PARAMS_DIFFICULTY1,$STR_PARAMS_DIFFICULTY2,$STR_PARAMS_DIFFICULTY3,$STR_PARAMS_DIFFICULTY4,$STR_PARAMS_DIFFICULTY5,$STR_PARAMS_DIFFICULTY6,$STR_PARAMS_DIFFICULTY7,$STR_PARAMS_DIFFICULTY8};
    default = 1; // Default value. Must be one from the values array above.
    persistent = 1;
};

class Aggressivity {
    title = $STR_PARAMS_AGGRESSIVITY;
    values[] = {0.25,0.5,1,2,4};
    texts[] = {$STR_PARAMS_AGGRESSIVITY0,$STR_PARAMS_AGGRESSIVITY1,$STR_PARAMS_AGGRESSIVITY2,$STR_PARAMS_AGGRESSIVITY3,$STR_PARAMS_AGGRESSIVITY4};
    default = 1; // Default value. Must be one from the values array above.
    persistent = 1;
};

class AdaptiveEnemy {
    title = $STR_PARAMS_ADAPTIVEENEMY;
    values[] = {0,1};
    texts[] = {$STR_PARAMS_DISABLED,$STR_PARAMS_ENABLED};
    default = 1; // Default value. Must be one from the values array above.
    persistent = 1;
};

class Civilians {
    title = $STR_PARAMS_CIVILIANS;
    values[] = {0,0.5,1,2};
    texts[] = {$STR_PARAMS_CIVILIANS0,$STR_PARAMS_CIVILIANS1,$STR_PARAMS_CIVILIANS2,$STR_PARAMS_CIVILIANS3};
    default = 1; // Default value. Must be one from the values array above.
    persistent = 1;
};

class ClearVehicleCargo {
    title = $STR_PARAMS_CLEARVEHICLECARGO;
    values[] = {0,1};
    texts[] = {$STR_PARAMS_DISABLED,$STR_PARAMS_ENABLED};
    default = 1; // Default value. Must be one from the values array above.
    persistent = 1;
};

class FirstFob {
    title = $STR_PARAMS_FIRSTFOB;
    values[] = {0,1};
    texts[] = {$STR_NO,$STR_YES};
    default = 0; // Default value. Must be one from the values array above.
    persistent = 1;
};

class MaxFobs {
    title = $STR_PARAMS_MAXFOBS;
    values[] = {3,5,7,10,15,20,26};
    texts[] = {3,5,7,10,15,20,26};
    default = 10; // Default value. Must be one from the values array above.
    persistent = 1;
};

class MaxSquadSize {
    title = $STR_PARAMS_MAXSQUADSIZE;
    values[] = {0,1,2,4,6,8,10,12,16,20,24,30,36};
    texts[] = {0,1,2,4,6,8,10,12,16,20,24,30,36};
    default = 12; // Default value. Must be one from the values array above.
    persistent = 1;
};

class AiDefenders {
    title = $STR_PARAMS_AIDEFENDERS;
    values[] = {0,1};
    texts[] = {$STR_PARAMS_DISABLED,$STR_PARAMS_ENABLED};
    default = 1; // Default value. Must be one from the values array above.
    persistent = 1;
};

class Autodanger {
    title = $STR_PARAMS_AUTODANGER;
    values[] = {0,1};
    texts[] = {$STR_PARAMS_DISABLED,$STR_PARAMS_ENABLED};
    default = 1; // Default value. Must be one from the values array above.
    persistent = 1;
};

class TimeMulti {
    title = $STR_PARAMS_TIMEMULTI;
    values[] = {48,24,16,12,8,6,4,3,2,1};
    texts[] = {"0.5","1","1.5","2","3","4","6","8","12","24"};
    default = 6; // Default value. Must be one from the values array above.
    persistent = 1;
};

class ShortNight {
    title = $STR_PARAMS_SHORTNIGHT;
    values[] = {0,1};
    texts[] = {$STR_PARAMS_DISABLED,$STR_PARAMS_ENABLED};
    default = 0; // Default value. Must be one from the values array above.
    persistent = 1;
};

class Weather {
    title = $STR_PARAMS_WEATHER;
    values[] = {0,1,2};
    texts[] = {$STR_PARAMS_WEATHER0,$STR_PARAMS_WEATHER1,$STR_PARAMS_WEATHER2};
    default = 2; // Default value. Must be one from the values array above.
    persistent = 1;
};

class ResMulti {
    title = $STR_PARAMS_RESMULTI;
    values[] = {0.25,0.5,0.75,1,1.25,1.5,2,3};
    texts[] = {"x0.25","x0.5","x0.75","x1","x1.25","x1.5","x2","x3"};
    default = 1; // Default value. Must be one from the values array above.
    persistent = 1;
};

class Spacer1 {
    title = "";
    values[] = {""};
    texts[] = {""};
    default = "";
};

class ReviveOptions {
    title = $STR_PARAMS_REVIVEOPTIONS;
    values[] = {""};
    texts[] = {""};
    default = "";
};

class ReviveMode {
    title = $STR_A3_ReviveMode;
    values[] = {0,1};
    texts[] = {$STR_A3_Disabled,$STR_A3_EnabledForAllPlayers};
    default = 1; // Default value. Must be one from the values array above.
    persistent = 1;
};

class ReviveDuration {
    title = $STR_A3_ReviveDuration;
    values[] = {6,8,10,12,15,20,25,30};
    texts[] = {6,8,10,12,15,20,25,30};
    default = 6; // Default value. Must be one from the values array above.
    persistent = 1;
};

class ReviveRequiredTrait {
    title = $STR_A3_RequiredTrait;
    values[] = {0,1};
    texts[] = {$STR_A3_None,$STR_A3_Medic};
    default = 1; // Default value. Must be one from the values array above.
    persistent = 1;
};

class ReviveMedicSpeedMultiplier {
    title = $STR_A3_RequiredTrait_MedicSpeedMultiplier;
    values[] = {1,1.5,2,2.5,3};
    texts[] = {"1x","1.5x","2x","2.5x","3x"};
    default = 1; // Default value. Must be one from the values array above.
    persistent = 1;
};

class ReviveRequiredItems {
    title = $STR_A3_RequiredItems;
    values[] = {0,1,2};
    texts[] = {$STR_A3_None,$STR_A3_Medikit,$STR_A3_FirstAidKitOrMedikit};
    default = 1; // Default value. Must be one from the values array above.
    persistent = 1;
};

class ReviveUnconsciousStateMode {
    title = $STR_A3_IncapacitationMode;
    values[] = {0,1,2};
    texts[] = {$STR_A3_Basic,$STR_A3_Advanced,$STR_A3_Realistic};
    default = 0; // Default value. Must be one from the values array above.
    persistent = 1;
};

class ReviveBleedOutDuration {
    title = $STR_A3_BleedOutDuration;
    values[] = {10,15,20,30,45,60,90,180};
    texts[] = {10,15,20,30,45,60,90,180};
    default = 180; // Default value. Must be one from the values array above.
    persistent = 1;
};

class ReviveForceRespawnDuration {
    title = $STR_A3_ForceRespawnDuration;
    values[] = {3,4,5,6,7,8,9,10};
    texts[] = {3,4,5,6,7,8,9,10};
    default = 10; // Default value. Must be one from the values array above.
    persistent = 1;
};

class Spacer2 {
    title = "";
    values[] = {""};
    texts[] = {""};
    default = "";
};

class GameplayOptions {
    title = $STR_PARAMS_GAMEPLAYOPTIONS;
    values[] = {""};
    texts[] = {""};
    default = "";
};

class Fatigue {
    title = $STR_PARAMS_FATIGUE;
    values[] = {0,1};
    texts[] = {$STR_PARAMS_DISABLED,$STR_PARAMS_ENABLED};
    default = 1; // Default value. Must be one from the values array above.
    persistent = 1;
};

class ArsenalPreset {
    title = $STR_PARAMS_ARSENALPRESET;
    values[] = {0,1};
    texts[] = {$STR_PARAMS_ARSENALPRESETFREE,$STR_PARAMS_ARSENALPRESETUSE};
    default = 1; // Default value. Must be one from the values array above.
    persistent = 1;
};

class MapMarkers {
    title = $STR_PARAMS_MAPMARKERS;
    values[] = {0,1};
    texts[] = {$STR_PARAMS_DISABLED,$STR_PARAMS_ENABLED};
    default = 1; // Default value. Must be one from the values array above.
    persistent = 1;
};

class MobileRespawn {
    title = $STR_PARAMS_MOBILERESPAWN;
    values[] = {0,1};
    texts[] = {$STR_PARAMS_DISABLED,$STR_PARAMS_ENABLED};
    default = 1; // Default value. Must be one from the values array above.
    persistent = 1;
};

class RespawnCd {
    title = $STR_PARAM_RESPAWNCD;
    values[] = {0,300,600,900,1200,1800,3600};
    texts[] = {$STR_PARAMS_DISABLED,5,10,15,20,30,60};
    default = 900; // Default value. Must be one from the values array above.
    persistent = 1;
};

class MobileArsenal {
    title = $STR_PARAMS_MOBILEARSENAL;
    values[] = {0,1};
    texts[] = {$STR_PARAMS_DISABLED,$STR_PARAMS_ENABLED};
    default = 1; // Default value. Must be one from the values array above.
    persistent = 1;
};

class AiLogistics {
    title = $STR_PARAMS_AILOGISTICS;
    values[] = {0,1};
    texts[] = {$STR_PARAMS_DISABLED,$STR_PARAMS_ENABLED};
    default = 1; // Default value. Must be one from the values array above.
    persistent = 1;
};

class TeamkillPenalty {
    title = $STR_PARAMS_TEAMKILLPENALTY;
    values[] = {0,1};
    texts[] = {$STR_PARAMS_DISABLED,$STR_PARAMS_ENABLED};
    default = 0; // Default value. Must be one from the values array above.
    persistent = 1;
};

class CivRepBuilding {
    title = $STR_PARAMS_CIVREPBUILDING;
    values[] = {0,1};
    texts[] = {$STR_PARAMS_CIVREPBUILDINGDESTROYED,$STR_PARAMS_CIVREPBUILDINGDAMAGED};
    default = 0; // Default value. Must be one from the values array above.
    persistent = 1;
};

class Halo {
    title = $STR_PARAMS_HALO;
    values[] = {0,1,5,10,15,20,30};
    texts[] = {$STR_PARAMS_DISABLED,$STR_PARAMS_HALO1,$STR_PARAMS_HALO2,$STR_PARAMS_HALO3,$STR_PARAMS_HALO4,$STR_PARAMS_HALO5,$STR_PARAMS_HALO6};
    default = 0; // Default value. Must be one from the values array above.
    persistent = 1;
};

class Spacer3 {
    title = "";
    values[] = {""};
    texts[] = {""};
    default = "";
};

class TechnicalOptions {
    title = $STR_PARAMS_TECHNICALOPTIONS;
    values[] = {""};
    texts[] = {""};
    default = "";
};

class Permissions {
    title = $STR_PARAMS_PERMISSIONS;
    values[] = {0,1};
    texts[] = {$STR_PARAMS_DISABLED,$STR_PARAMS_ENABLED};
    default = 1; // Default value. Must be one from the values array above.
    persistent = 1;
};

class CleanupVeh {
    title = $STR_PARAMS_CLEANUPVEH;
    values[] = {0,1,2,4};
    texts[] = {$STR_PARAMS_DISABLED,$STR_PARAMS_CLEANUPVEH1,$STR_PARAMS_CLEANUPVEH2,$STR_PARAMS_CLEANUPVEH3};
    default = 2; // Default value. Must be one from the values array above.
    persistent = 1;
};

class Intro {
    title = $STR_PARAMS_INTRO;
    values[] = {0,1};
    texts[] = {$STR_PARAMS_DISABLED,$STR_PARAMS_ENABLED};
    default = 1; // Default value. Must be one from the values array above.
    persistent = 1;
};

class DeployCine {
    title = $STR_PARAMS_DEPLOYCINE;
    values[] = {0,1};
    texts[] = {$STR_PARAMS_DISABLED,$STR_PARAMS_ENABLED};
    default = 1; // Default value. Must be one from the values array above.
    persistent = 1;
};

class Whitelist {
    title = $STR_PARAMS_WHITELIST;
    values[] = {0,1};
    texts[] = {$STR_PARAMS_DISABLED,$STR_PARAMS_WHITELISTON};
    default = 0; // Default value. Must be one from the values array above.
    persistent = 1;
};

class ServerRestart {
    title = $STR_PARAMS_SERVERRESTART;
    values[] = {0,1,2,3,4,5,6};
    texts[] = {$STR_PARAMS_DISABLED,"1","2","3","4","5","6"};
    default = 0; // Default value. Must be one from the values array above.
    persistent = 1;
};

class WipeSave1 {
    title = $STR_PARAMS_WIPESAVE1;
    values[] = {0,1};
    texts[] = {$STR_NO,$STR_PARAMS_WIPESAVEYES};
    default = 0; // Default value. Must be one from the values array above.
};

class WipeSave2 {
    title = $STR_PARAMS_WIPESAVE2;
    values[] = {0,1};
    texts[] = {$STR_NO,$STR_PARAMS_WIPESAVEYES};
    default = 0; // Default value. Must be one from the values array above.
};

class Spacer4 {
    title = "";
    values[] = {""};
    texts[] = {""};
    default = "";
};

class DebugOptions {
    title = $STR_PARAMS_DEBUGOPTIONS;
    values[] = {""};
    texts[] = {""};
    default = "";
};

class DebugAsymm {
    title = $STR_PARAMS_DEBUGASYMM;
    values[] = {0,1};
    texts[] = {$STR_PARAMS_DISABLED,$STR_PARAMS_ENABLED};
    default = 0; // Default value. Must be one from the values array above.
};

class DebugCivInfo {
    title = $STR_PARAMS_DEBUGCIVINFO;
    values[] = {0,1};
    texts[] = {$STR_PARAMS_DISABLED,$STR_PARAMS_ENABLED};
    default = 0; // Default value. Must be one from the values array above.
};

class DebugCivRep {
    title = $STR_PARAMS_DEBUGCIVREP;
    values[] = {0,1};
    texts[] = {$STR_PARAMS_DISABLED,$STR_PARAMS_ENABLED};
    default = 0; // Default value. Must be one from the values array above.
};

class DebugKill {
    title = $STR_PARAMS_DEBUGKILL;
    values[] = {0,1};
    texts[] = {$STR_PARAMS_DISABLED,$STR_PARAMS_ENABLED};
    default = 0; // Default value. Must be one from the values array above.
};

class DebugLogi {
    title = $STR_PARAMS_DEBUGLOGI;
    values[] = {0,1};
    texts[] = {$STR_PARAMS_DISABLED,$STR_PARAMS_ENABLED};
    default = 0; // Default value. Must be one from the values array above.
};

class DebugProd {
    title = $STR_PARAMS_DEBUGPROD;
    values[] = {0,1};
    texts[] = {$STR_PARAMS_DISABLED,$STR_PARAMS_ENABLED};
    default = 0; // Default value. Must be one from the values array above.
};

class DebugSave {
    title = $STR_PARAMS_DEBUGSAVE;
    values[] = {0,1};
    texts[] = {$STR_PARAMS_DISABLED,$STR_PARAMS_ENABLED};
    default = 0; // Default value. Must be one from the values array above.
};

class DebugSectorSpawn {
    title = $STR_PARAMS_DEBUGSECTORSPAWN;
    values[] = {0,1};
    texts[] = {$STR_PARAMS_DISABLED,$STR_PARAMS_ENABLED};
    default = 0; // Default value. Must be one from the values array above.
};

class DebugConfigGuard {
    title = $STR_PARAM_CONFIGGUARD;
    values[] = {0,1};
    texts[] = {$STR_PARAMS_DISABLED,$STR_PARAMS_ENABLED};
    default = 1; // Default value. Must be one from the values array above.
};
