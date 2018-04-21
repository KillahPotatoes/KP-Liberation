class Params
{
	class LoadSaveParams {
		title = $STR_PARAMS_LOADSAVEPARAMS;
		values[] = { 0, 1, 2 };
		texts[] = { $STR_PARAMS_LOADSAVEPARAMS_SAVE, $STR_PARAMS_LOADSAVEPARAMS_LOAD, $STR_PARAMS_LOADSAVEPARAMS_SELECTED };
		default = 1;
	};
	class Spacer0 {
		title = "";
		values[] = { "" };
		texts[] = { "" };
		default = "";
	};
	class MissionOptions {
		title = $STR_PARAMS_MISSIONOPTIONS;
		values[] = { "" };
		texts[] = { "" };
		default = "";
	};
	class Unitcap {
		title = $STR_PARAMS_UNITCAP;
		values[] = {0,1,2,3,4,5};
		texts[] = {$STR_PARAMS_UNITCAP1,$STR_PARAMS_UNITCAP2,$STR_PARAMS_UNITCAP3,$STR_PARAMS_UNITCAP4,$STR_PARAMS_UNITCAP5,$STR_PARAMS_UNITCAP6};
		default = 2;
	};
	class Difficulty {
		title = $STR_PARAMS_DIFFICULTY;
		values[] = { 0, 1, 2, 3, 4, 5, 6, 7 };
		texts[] = { $STR_PARAMS_DIFFICULTY1, $STR_PARAMS_DIFFICULTY2, $STR_PARAMS_DIFFICULTY3, $STR_PARAMS_DIFFICULTY4, $STR_PARAMS_DIFFICULTY5, $STR_PARAMS_DIFFICULTY6, $STR_PARAMS_DIFFICULTY7, $STR_PARAMS_DIFFICULTY8 };
		default = 2;
	};
	class Aggressivity {
		title = $STR_AGGRESSIVITY_PARAM;
		values[] = {0,1,2,3,4};
		texts[] = {$STR_AGGRESSIVITY_PARAM0, $STR_AGGRESSIVITY_PARAM1,$STR_AGGRESSIVITY_PARAM2,$STR_AGGRESSIVITY_PARAM3,$STR_AGGRESSIVITY_PARAM4};
		default = 2;
	};
	class AdaptToPlayercount {
		title = $STR_PARAM_ADAPT_TO_PLAYERCOUNT;
		values[] = {1,0};
		texts[] = {$STR_PARAMS_ENABLED,$STR_PARAMS_DISABLED};
		default = 1;
	};
	class Civilians {
		title = $STR_PARAMS_CIVILIANS;
		values[] = {0,1,2,3};
		texts[] = {$STR_PARAMS_CIVILIANS1,$STR_PARAMS_CIVILIANS2,$STR_PARAMS_CIVILIANS3,$STR_PARAMS_CIVILIANS4};
		default = 2;
	};
	class FirstFob {
		title = $STR_PARAMS_FIRSTFOB;
		values[] = { 1, 0 };
		texts[] = { $STR_YES, $STR_NO };
		default = 0;
	};
	class MaximumFobs {
		title = $STR_PARAM_FOBS_COUNT;
		values[] = {3,5,7,10,15,20,26};
		texts[] = {3,5,7,10,15,20,26};
		default = 10;
	};
	class MaxSquadSize {
		title = $STR_PARAM_SQUAD_SIZE;
		values[] = {0,1,2,4,6,8,10,12,16,20,24,30,36};
		texts[] = {0,1,2,4,6,8,10,12,16,20,24,30,36};
		default = 12;
	};
	class BluforDefenders {
		title = $STR_PARAM_BLUFOR_DEFENDERS;
		values[] = {1,0};
		texts[] = { $STR_PARAMS_ENABLED, $STR_PARAMS_DISABLED };
		default = 1;
	};
	class Autodanger {
		title = $STR_PARAM_AUTODANGER;
		values[] = {1,0};
		texts[] = { $STR_PARAMS_ENABLED, $STR_PARAMS_DISABLED };
		default = 1;
	};
	class DayDuration {
		title = $STR_PARAMS_DAYDURATION;
		values[] = {48, 24, 16, 12, 8, 6, 4, 3, 2, 1};
		texts[] = {"0.5","1","1.5","2","3","4","6","8","12","24"};
		default = 4;
	};
	class ShorterNights {
		title = $STR_SHORTER_NIGHTS_PARAM;
		values[] = {1,0};
		texts[] = { $STR_PARAMS_ENABLED, $STR_PARAMS_DISABLED };
		default = 0;
	};
	class Weather {
		title = $STR_WEATHER_PARAM;
		values[] = { 1,2,3 };
		texts[] = { $STR_WEATHER_PARAM1, $STR_WEATHER_PARAM2, $STR_WEATHER_PARAM3 };
		default = 3;
	};
	class ResourcesMultiplier {
		title = $STR_PARAMS_RESOURCESMULTIPLIER;
		values[] = { 0, 1, 2, 3, 4, 5, 6, 7 };
		texts[] = { "x0.25", "x0.5", "x0.75", "x1", "x1.25","x1.5","x2","x3" };
		default = 3;
	};
	class Spacer1 {
		title = "";
		values[] = { "" };
		texts[] = { "" };
		default = "";
	};
	class ReviveOptions {
		title = $STR_PARAMS_REVIVEOPTIONS;
		values[] = { "" };
		texts[] = { "" };
		default = "";
	};
	class ReviveMode {
		title = $STR_A3_ReviveMode;
		values[] = {0,1};
		texts[] = {$STR_A3_Disabled, $STR_A3_EnabledForAllPlayers};
		default = 1;
	};
	class ReviveDuration {
		title = $STR_A3_ReviveDuration;
		values[] = {6,8,10,12,15,20,25,30};
		texts[] = {6,8,10,12,15,20,25,30};
		default = 6;
	};
	class ReviveRequiredTrait {
		title = $STR_A3_RequiredTrait;
		values[] = {0,1};
		texts[] = {$STR_A3_None,$STR_A3_Medic};
		default = 1;
	};
	class ReviveMedicSpeedMultiplier {
		title = $STR_A3_RequiredTrait_MedicSpeedMultiplier;
		values[] = {1,1.5,2,2.5,3};
		texts[] = {"1x","1.5x","2x","2.5x","3x"};
		default = 1;
	};
	class ReviveRequiredItems {
		title = $STR_A3_RequiredItems;
		values[] = {0,1,2};
		texts[] = {$STR_A3_None,$STR_A3_Medikit,$STR_A3_FirstAidKitOrMedikit};
		default = 1;
	};
	class UnconsciousStateMode {
		title = $STR_A3_IncapacitationMode;
		values[] = {0,1,2};
		texts[] = {$STR_A3_Basic,$STR_A3_Advanced,$STR_A3_Realistic};
		default = 0;
	};
	class ReviveBleedOutDuration {
		title = $STR_A3_BleedOutDuration;
		values[] = {10,15,20,30,45,60,90,180};
		texts[] = {10,15,20,30,45,60,90,180};
		default = 180;
	};
	class ReviveForceRespawnDuration {
		title = $STR_A3_ForceRespawnDuration;
		values[] = {3,4,5,6,7,8,9,10};
		texts[] = {3,4,5,6,7,8,9,10};
		default = 10;
	};
	class Spacer2 {
		title = "";
		values[] = { "" };
		texts[] = { "" };
		default = "";
	};
	class GameplayOptions {
		title = $STR_PARAMS_GAMEPLAYOPTIONS;
		values[] = { "" };
		texts[] = { "" };
		default = "";
	};
	class Fatigue {
		title = $STR_PARAMS_FATIGUE;
		values[] = { 0, 1 };
		texts[] = { $STR_PARAMS_DISABLED, $STR_PARAMS_ENABLED };
		default = 1;
	};
	class ArsenalUsePreset {
		title = $STR_PARAMS_ARSENALUSEPRESET;
		values[] = { 0, 1 };
		texts[] = { $STR_PARAMS_NORESTRICTIONS, $STR_PARAMS_USEPRESET };
		default = 1;
	};
	class MapMarkers {
		title = $STR_PARAMS_MAPMARKERS;
		values[] = { 0, 1 };
		texts[] = { $STR_PARAMS_DISABLED, $STR_PARAMS_ENABLED };
		default = 1;
	};
	class MobileRespawn {
		title = $STR_PARAMS_MOBILERESPAWN;
		values[] = { 0, 1 };
		texts[] = { $STR_PARAMS_DISABLED, $STR_PARAMS_ENABLED };
		default = 1;
	};
	class RespawnCooldown {
		title = $STR_PARAM_RESPAWN_COOLDOWN;
		values[] = {0, 300, 600, 900, 1200, 1800, 3600};
		texts[] = {$STR_PARAMS_DISABLED, 5, 10, 15, 20, 30, 60};
		default = 900;
	};
	class MobileArsenal {
		title = $STR_PARAMS_MOBILEARSENAL;
		values[] = { 0, 1 };
		texts[] = { $STR_PARAMS_DISABLED, $STR_PARAMS_ENABLED };
		default = 1;
	};
	class AiLogistics {
		title = $STR_PARAMS_AILOGISTICS;
		values[] = {0, 1};
		texts[] = {$STR_PARAMS_DISABLED, $STR_PARAMS_ENABLED};
		default = 1;
	};
	class TeamkillPenalty {
		title = $STR_PARAM_TEAMKILL_PENALTY;
		values[] = {1,0};
		texts[] = { $STR_PARAMS_ENABLED, $STR_PARAMS_DISABLED };
		default = 0;
	};
	class CR_Building {
		title = $STR_PARAM_CR_BUILDING;
		values[] = {1,0};
		texts[] = {$STR_PARAM_CR_DAMAGED, $STR_PARAM_CR_DESTROYED};
		default = 0;
	};
	class HaloJump {
		title = $STR_HALO_PARAM;
		values[] = {1,5,10,15,20,30,0};
		texts[] = { $STR_HALO_PARAM1, $STR_HALO_PARAM2, $STR_HALO_PARAM3, $STR_HALO_PARAM4, $STR_HALO_PARAM5, $STR_HALO_PARAM6, $STR_PARAMS_DISABLED };
		default = 0;
	};
	class ClearCargo {
		title = $STR_PARAM_CLEAR_CARGO;
		values[] = {1,0};
		texts[] = { $STR_PARAMS_ENABLED, $STR_PARAMS_DISABLED };
		default = 1;
	};
	class Spacer3 {
		title = "";
		values[] = { "" };
		texts[] = { "" };
		default = "";
	};
	class TechnicalOptions {
		title = $STR_PARAMS_TECHNICALOPTIONS;
		values[] = { "" };
		texts[] = { "" };
		default = "";
	};
	class Permissions {
		title = $STR_PERMISSIONS_PARAM;
		values[] = {1,0};
		texts[] = { $STR_PARAMS_ENABLED, $STR_PARAMS_DISABLED };
		default = 1;
	};
	class CleanupVehicles {
		title = $STR_CLEANUP_PARAM;
		values[] = { 0,1,2,4 };
		texts[] = { $STR_PARAMS_DISABLED, $STR_CLEANUP_PARAM1, $STR_CLEANUP_PARAM2, $STR_CLEANUP_PARAM3 };
		default = 2;
	};
	class Introduction {
		title = $STR_PARAMS_INTRO;
		values[] = { 1, 0 };
		texts[] = { $STR_PARAMS_ENABLED, $STR_PARAMS_DISABLED };
		default = 1;
	};
	class DeploymentCinematic {
		title = $STR_PARAMS_DEPLOYMENTCAMERA;
		values[] = { 1, 0 };
		texts[] = { $STR_PARAMS_ENABLED, $STR_PARAMS_DISABLED };
		default = 1;
	};
	class Whitelist {
		title = $STR_WHITELIST_PARAM;
		values[] = { 1, 0 };
		texts[] = { $STR_WHITELIST_ENABLED, $STR_PARAMS_DISABLED };
		default = 0;
	};
	class ServerRestart {
		title = $STR_RESTART_PARAM;
		values[] = {0,1,2,3,4,5,6};
		texts[] = {$STR_PARAMS_DISABLED,"1","2","3","4","5","6"};
		default = 0;
	};
	class WipeSave1 {
		title = $STR_WIPE_TITLE;
		values[] = {0,1};
		texts[] =  {$STR_WIPE_NO,$STR_WIPE_YES};
		default = 0;
	};
	class WipeSave2 {
		title = $STR_WIPE_TITLE_2;
		values[] = {0,1};
		texts[] = {$STR_WIPE_NO,$STR_WIPE_YES};
		default = 0;
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
	class DebugAsymmetric {
		title = $STR_PARAMS_DEBUG_ASYMMETRIC;
		values[] = {0, 1};
		texts[] = {$STR_PARAMS_DISABLED, $STR_PARAMS_ENABLED};
		default = 0;
	};
	class DebugCivInfo {
		title = $STR_PARAMS_DEBUG_CIVINFO;
		values[] = {0, 1};
		texts[] = {$STR_PARAMS_DISABLED, $STR_PARAMS_ENABLED};
		default = 0;
	};
	class DebugCivRep {
		title = $STR_PARAMS_DEBUG_CIVREP;
		values[] = {0, 1};
		texts[] = {$STR_PARAMS_DISABLED, $STR_PARAMS_ENABLED};
		default = 0;
	};
	class DebugKill {
		title = $STR_PARAMS_DEBUG_KILL;
		values[] = {0, 1};
		texts[] = {$STR_PARAMS_DISABLED, $STR_PARAMS_ENABLED};
		default = 0;
	};
	class DebugLogistic {
		title = $STR_PARAMS_DEBUG_LOGISTIC;
		values[] = {0, 1};
		texts[] = {$STR_PARAMS_DISABLED, $STR_PARAMS_ENABLED};
		default = 0;
	};
	class DebugProduction {
		title = $STR_PARAMS_DEBUG_PRODUCTION;
		values[] = {0, 1};
		texts[] = {$STR_PARAMS_DISABLED, $STR_PARAMS_ENABLED};
		default = 0;
	};
	class DebugSave {
		title = $STR_PARAMS_DEBUG_SAVE;
		values[] = {0, 1};
		texts[] = {$STR_PARAMS_DISABLED, $STR_PARAMS_ENABLED};
		default = 0;
	};
	class DebugSectorSpawn {
		title = $STR_PARAMS_DEBUG_SECTORSPAWN;
		values[] = {0, 1};
		texts[] = {$STR_PARAMS_DISABLED, $STR_PARAMS_ENABLED};
		default = 0;
	};
};
