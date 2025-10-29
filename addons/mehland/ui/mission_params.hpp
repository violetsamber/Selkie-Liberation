class Params {
    class LoadSaveParams {
        title = QUOTE($STR_PARAMS_LOADSAVEPARAMS);
        values[] = {0, 1, 2};
        texts[] = {QUOTE($STR_PARAMS_LOADSAVEPARAMS_SAVE), QUOTE($STR_PARAMS_LOADSAVEPARAMS_LOAD), QUOTE($STR_PARAMS_LOADSAVEPARAMS_SELECTED)};
        default = 2; // If you want to set mission parameters via server.cfg or this file, then set this value to 2
    };
    class Spacer0 {
        title = "";
        values[] = {""};
        texts[] = {""};
        default = "";
    };
    class MissionOptions {
        title = QUOTE($STR_PARAMS_MISSIONOPTIONS);
        values[] = {""};
        texts[] = {""};
        default = "";
    };
    class Unitcap {
        title = QUOTE($STR_PARAMS_UNITCAP);
        values[] = {0, 1, 2, 3, 4, 5};
        texts[] = {QUOTE($STR_PARAMS_UNITCAP1), QUOTE($STR_PARAMS_UNITCAP2), QUOTE($STR_PARAMS_UNITCAP3), QUOTE($STR_PARAMS_UNITCAP4), QUOTE($STR_PARAMS_UNITCAP5), QUOTE($STR_PARAMS_UNITCAP6)};
        default = 5;
    };
    class Difficulty {
        title = QUOTE($STR_PARAMS_DIFFICULTY);
        values[] = {0, 1, 2, 3, 4, 5, 6, 7};
        texts[] = {QUOTE($STR_PARAMS_DIFFICULTY1), QUOTE($STR_PARAMS_DIFFICULTY2), QUOTE($STR_PARAMS_DIFFICULTY3), QUOTE($STR_PARAMS_DIFFICULTY4), QUOTE($STR_PARAMS_DIFFICULTY5), QUOTE($STR_PARAMS_DIFFICULTY6), QUOTE($STR_PARAMS_DIFFICULTY7), QUOTE($STR_PARAMS_DIFFICULTY8)};
        default = 6;
    };
    class Aggressivity {
        title = QUOTE($STR_AGGRESSIVITY_PARAM);
        values[] = {0, 1, 2, 3, 4};
        texts[] = {QUOTE($STR_AGGRESSIVITY_PARAM0), QUOTE($STR_AGGRESSIVITY_PARAM1), QUOTE($STR_AGGRESSIVITY_PARAM2), QUOTE($STR_AGGRESSIVITY_PARAM3), QUOTE($STR_AGGRESSIVITY_PARAM4)};
        default = 3;
    };
    class AdaptToPlayercount {
        title = QUOTE($STR_PARAM_ADAPT_TO_PLAYERCOUNT);
        values[] = {1, 0};
        texts[] = {QUOTE($STR_PARAMS_ENABLED), QUOTE($STR_PARAMS_DISABLED)};
        default = 0;
    };
    class Civilians {
        title = QUOTE($STR_PARAMS_CIVILIANS);
        values[] = {0, 1, 2, 3};
        texts[] = {QUOTE($STR_PARAMS_CIVILIANS1), QUOTE($STR_PARAMS_CIVILIANS2), QUOTE($STR_PARAMS_CIVILIANS3), QUOTE($STR_PARAMS_CIVILIANS4)};
        default = 2;
    };
    class FirstFob {
        title = QUOTE($STR_PARAMS_FIRSTFOB);
        values[] = {1, 0};
        texts[] = {QUOTE($STR_YES), QUOTE($STR_NO)};
        default = 0;
    };
    class FirstFobVehicle {
        title = QUOTE($STR_PARAMS_FIRSTFOBVEHICLE);
        values[] = {0, 1};
        texts[] = {QUOTE($STR_PARAMS_FIRSTFOBVEHICLE_CONTAINTER), QUOTE($STR_PARAMS_FIRSTFOBVEHICLE_TRUCK)};
        default = 0;
    };
    class MaximumFobs {
        title = QUOTE($STR_PARAM_FOBS_COUNT);
        values[] = {3, 5, 7, 10, 15, 20, 26};
        texts[] = {3, 5, 7, 10, 15, 20, 26};
        default = 10;
    };
    class MaxSquadSize {
        title = QUOTE($STR_PARAM_SQUAD_SIZE);
        values[] = {0, 1, 2, 4, 6, 8, 10, 12, 16, 20, 24, 30, 36};
        texts[] = {0, 1, 2, 4, 6, 8, 10, 12, 16, 20, 24, 30, 36};
        default = 12;
    };
    class BluforDefenders {
        title = QUOTE($STR_PARAM_BLUFOR_DEFENDERS);
        values[] = {1, 0};
        texts[] = {QUOTE($STR_PARAMS_ENABLED), QUOTE($STR_PARAMS_DISABLED)};
        default = 1;
    };
    class Autodanger {
        title = QUOTE($STR_PARAM_AUTODANGER);
        values[] = {1, 0};
        texts[] = {QUOTE($STR_PARAMS_ENABLED), QUOTE($STR_PARAMS_DISABLED)};
        default = 1;
    };
    class DayDuration {
        title = QUOTE($STR_PARAMS_DAYDURATION);
        values[] = {8, 6, 4, 3, 2, 1};
        texts[] = {"3","4","6","8","12","24"};
        default = 1;
    };
    class ShorterNights {
        title = QUOTE($STR_SHORTER_NIGHTS_PARAM);
        values[] = {1, 0};
        texts[] = {QUOTE($STR_PARAMS_ENABLED), QUOTE($STR_PARAMS_DISABLED)};
        default = 0;
    };
    class Weather {
        title = QUOTE($STR_WEATHER_PARAM);
        values[] = {1, 2, 3};
        texts[] = {QUOTE($STR_WEATHER_PARAM1), QUOTE($STR_WEATHER_PARAM2), QUOTE($STR_WEATHER_PARAM3)};
        default = 3;
    };
    class VanillaFog {
        title = QUOTE($STR_FOG_PARAM);
        values[] = {1, 0};
        texts[] = {QUOTE($STR_PARAMS_ENABLED), QUOTE($STR_PARAMS_DISABLED)};
        default = 1;
    };
    class ResourcesMultiplier {
        title = QUOTE($STR_PARAMS_RESOURCESMULTIPLIER);
        values[] = {0, 1, 2, 3, 4, 5, 6, 7};
        texts[] = {"x0.25", "x0.5", "x0.75", "x1", "x1.25","x1.5","x2","x3"};
        default = 3;
    };
    class ArsenalType {
        title = QUOTE($STR_PARAMS_ARSENAL);
        values[] = {0, 1};
        texts[] = {QUOTE($STR_PARAMS_ARSENAL_BI), QUOTE($STR_PARAMS_ARSENAL_ACE)};
        default = 1;
    };
    class DirectArsenal {
        title = QUOTE($STR_PARAMS_DIRECTARSENAL);
        values[] = {0, 1};
        texts[] = {QUOTE($STR_PARAMS_DISABLED), QUOTE($STR_PARAMS_ENABLED)};
        default = 1;
    };
    class PlayerMenu {
        title = QUOTE($STR_PARAMS_PLAYERMENU);
        values[] = {0, 1};
        texts[] = {QUOTE($STR_PARAMS_PLAYERMENU_GREUH), QUOTE($STR_PARAMS_PLAYERMENU_KP)};
        default = 1;
    };
    class VictoryCondition {
        title = QUOTE($STR_PARAMS_VICTORYCONDITION);
        values[] = {0, 1, 2, 3, 4};
        texts[] = {QUOTE($STR_PARAMS_VICTORYCONDITION_0), QUOTE($STR_PARAMS_VICTORYCONDITION_1), QUOTE($STR_PARAMS_VICTORYCONDITION_2), QUOTE($STR_PARAMS_VICTORYCONDITION_3), QUOTE($STR_PARAMS_VICTORYCONDITION_4)};
        default = 3;
    };
    class Spacer1 {
        title = "";
        values[] = {""};
        texts[] = {""};
        default = "";
    };
    class ReviveOptions {
        title = QUOTE($STR_PARAMS_REVIVEOPTIONS);
        values[] = {""};
        texts[] = {""};
        default = "";
    };
    class ReviveMode {
        title = QUOTE($STR_A3_ReviveMode);
        values[] = {0, 1};
        texts[] = {QUOTE($STR_A3_Disabled), QUOTE($STR_A3_EnabledForAllPlayers)};
        default = 0;
    };
    class ReviveDuration {
        title = QUOTE($STR_A3_ReviveDuration);
        values[] = {6, 8, 10,12, 15, 20, 25, 30};
        texts[] = {6, 8, 10, 12, 15, 20, 25, 30};
        default = 6;
    };
    class ReviveRequiredTrait {
        title = QUOTE($STR_A3_RequiredTrait);
        values[] = {0, 1};
        texts[] = {QUOTE($STR_A3_None), QUOTE($STR_A3_Medic)};
        default = 1;
    };
    class ReviveMedicSpeedMultiplier {
        title = QUOTE($STR_A3_RequiredTrait_MedicSpeedMultiplier);
        values[] = {1, 1.5, 2, 2.5, 3};
        texts[] = {"1x", "1.5x", "2x", "2.5x", "3x"};
        default = 1;
    };
    class ReviveRequiredItems {
        title = QUOTE($STR_A3_RequiredItems);
        values[] = {0, 1, 2};
        texts[] = {QUOTE($STR_A3_None), QUOTE($STR_A3_Medikit), QUOTE($STR_A3_FirstAidKitOrMedikit)};
        default = 1;
    };
    class UnconsciousStateMode {
        title = QUOTE($STR_A3_IncapacitationMode);
        values[] = {0, 1, 2};
        texts[] = {QUOTE($STR_A3_Basic), QUOTE($STR_A3_Advanced), QUOTE($STR_A3_Realistic)};
        default = 0;
    };
    class ReviveBleedOutDuration {
        title = QUOTE($STR_A3_BleedOutDuration);
        values[] = {10, 15, 20, 30, 45, 60, 90, 180};
        texts[] = {10, 15, 20, 30, 45, 60, 90, 180};
        default = 180;
    };
    class ReviveForceRespawnDuration {
        title = QUOTE($STR_A3_ForceRespawnDuration);
        values[] = {3, 4, 5, 6, 7, 8, 9, 10};
        texts[] = {3, 4, 5, 6, 7, 8, 9, 10};
        default = 10;
    };
    class Spacer2 {
        title = "";
        values[] = {""};
        texts[] = {""};
        default = "";
    };
    class GameplayOptions {
        title = QUOTE($STR_PARAMS_GAMEPLAYOPTIONS);
        values[] = {""};
        texts[] = {""};
        default = "";
    };
    class Fatigue {
        title = QUOTE($STR_PARAMS_FATIGUE);
        values[] = {0, 1};
        texts[] = {QUOTE($STR_PARAMS_DISABLED), QUOTE($STR_PARAMS_ENABLED)};
        default = 1;
    };
    class WeaponSway {
        title = QUOTE($STR_PARAM_WEAPSWAY);
        values[] = {0, 1};
        texts[] = {QUOTE($STR_PARAMS_DISABLED), QUOTE($STR_PARAMS_ENABLED)};
        default = 1;
    };
    class ArsenalUsePreset {
        title = QUOTE($STR_PARAMS_ARSENALUSEPRESET);
        values[] = {0, 1};
        texts[] = {QUOTE($STR_PARAMS_NORESTRICTIONS), QUOTE($STR_PARAMS_USEPRESET)};
        default = 0;
    };
    class MapMarkers {
        title = QUOTE($STR_PARAMS_MAPMARKERS);
        values[] = {0, 1};
        texts[] = {QUOTE($STR_PARAMS_DISABLED), QUOTE($STR_PARAMS_ENABLED)};
        default = 0;
    };
    class MobileRespawn {
        title = QUOTE($STR_PARAMS_MOBILERESPAWN);
        values[] = {0, 1};
        texts[] = {QUOTE($STR_PARAMS_DISABLED), QUOTE($STR_PARAMS_ENABLED)};
        default = 1;
    };
    class RespawnCooldown {
        title = QUOTE($STR_PARAM_RESPAWN_COOLDOWN);
        values[] = {0, 300, 600, 900, 1200, 1800, 3600};
        texts[] = {QUOTE($STR_PARAMS_DISABLED), 5, 10, 15, 20, 30, 60};
        default = 600;
    };
    class MobileArsenal {
        title = QUOTE($STR_PARAMS_MOBILEARSENAL);
        values[] = {0, 1};
        texts[] = {QUOTE($STR_PARAMS_DISABLED), QUOTE($STR_PARAMS_ENABLED)};
        default = 1;
    };
    class AttackedSectorRespawn {
        title = QUOTE($STR_PARAMS_ATTACKEDSECTORRESPAWN);
        values[] = {0, 1};
        texts[] = {QUOTE($STR_PARAMS_DISABLED), QUOTE($STR_PARAMS_ENABLED)};
        default = 0;
    };
    class AiLogistics {
        title = QUOTE($STR_PARAMS_AILOGISTICS);
        values[] = {0, 1};
        texts[] = {QUOTE($STR_PARAMS_DISABLED), QUOTE($STR_PARAMS_ENABLED)};
        default = 1;
    };
    class CR_Building {
        title = QUOTE($STR_PARAM_CR_BUILDING);
        values[] = {1, 0};
        texts[] = {QUOTE($STR_PARAM_CR_DAMAGED), QUOTE($STR_PARAM_CR_DESTROYED)};
        default = 0;
    };
    class HaloJump {
        title = QUOTE($STR_HALO_PARAM);
        values[] = {1, 5, 10, 15, 20, 30, 0};
        texts[] = {QUOTE($STR_HALO_PARAM1), QUOTE($STR_HALO_PARAM2), QUOTE($STR_HALO_PARAM3), QUOTE($STR_HALO_PARAM4), QUOTE($STR_HALO_PARAM5), QUOTE($STR_HALO_PARAM6), QUOTE($STR_PARAMS_DISABLED)};
        default = 1;
    };
    class ClearCargo {
        title = QUOTE($STR_PARAM_CLEAR_CARGO);
        values[] = {1, 0};
        texts[] = {QUOTE($STR_PARAMS_ENABLED), QUOTE($STR_PARAMS_DISABLED)};
        default = 1;
    };
    class AllowEnemiesInImmobile {
        title = QUOTE($STR_PARAM_ALLOW_ENEMIES_IN_IMMOBILE);
        values[] = {0, 25, 50, 75, 100};
        text[] = {QUOTE($STR_PARAMS_DISABLED), "25%", "50%", "75%", "100%"};
        default = 50;
    };
    class DelayDespawnMax {
        title = QUOTE($STR_PARAM_DELAY_DESPAWN_MAX);
        values[] = {0, 5, 10, 15, 20, 25, 30};
        texts[] = {QUOTE($STR_PARAMS_DISABLED), "5", "10", "15", "20", "25", "30"};
        default = 5;
    };
    class CommanderZeus {
        title = QUOTE($STR_PARAM_COMMANDERZEUS);
        values[] = {1, 0};
        texts[] = {QUOTE($STR_PARAMS_ENABLED), QUOTE($STR_PARAMS_DISABLED)};
        default = 0;
    };
    class LimitedZeus {
        title = QUOTE($STR_PARAM_LIMITEDZEUS);
        values[] = {1, 0};
        texts[] = {QUOTE($STR_PARAMS_ENABLED), QUOTE($STR_PARAMS_DISABLED)};
        default = 0;
    };
    class ZeusAddEnemies {
        title = QUOTE($STR_PARAM_ZEUSADDENEMIES);
        values[] = {1, 0};
        texts[] = {QUOTE($STR_PARAMS_ENABLED), QUOTE($STR_PARAMS_DISABLED)};
        default = 1;
    };
    class HighCommand {
        title = QUOTE($STR_PARAM_HIGHCOMMAND);
        values[] = {1, 0};
        texts[] = {QUOTE($STR_PARAMS_ENABLED), QUOTE($STR_PARAMS_DISABLED)};
        default = 1;
    };
    class SuppMod {
        title = QUOTE($STR_PARAM_SUPPMOD);
        values[] = {0, 1, 2};
        texts[] = {QUOTE($STR_PARAMS_DISABLED), QUOTE($STR_PARAM_SUPPMOD_CMDRANDWHITELIST), QUOTE($STR_PARAM_SUPPMOD_EVERYONE)};
        default = 1;
    };
    class Tutorial {
        title = QUOTE($STR_PARAM_TUTORIAL);
        values[] = {1, 0};
        texts[] = {QUOTE($STR_PARAMS_ENABLED), QUOTE($STR_PARAMS_DISABLED)};
        default = 0;
    };
    class Spacer3 {
        title = "";
        values[] = {""};
        texts[] = {""};
        default = "";
    };
    class TechnicalOptions {
        title = QUOTE($STR_PARAMS_TECHNICALOPTIONS);
        values[] = {""};
        texts[] = {""};
        default = "";
    };
    class Permissions {
        title = QUOTE($STR_PERMISSIONS_PARAM);
        values[] = {1, 0};
        texts[] = {QUOTE($STR_PARAMS_ENABLED), QUOTE($STR_PARAMS_DISABLED)};
        default = 0;
    };
    class CleanupVehicles {
        title = QUOTE($STR_CLEANUP_PARAM);
        values[] = {0, 1, 2, 4};
        texts[] = {QUOTE($STR_PARAMS_DISABLED), QUOTE($STR_CLEANUP_PARAM1), QUOTE($STR_CLEANUP_PARAM2), QUOTE($STR_CLEANUP_PARAM3)};
        default = 2;
    };
    class Introduction {
        title = QUOTE($STR_PARAMS_INTRO);
        values[] = {1, 0};
        texts[] = {QUOTE($STR_PARAMS_ENABLED), QUOTE($STR_PARAMS_DISABLED)};
        default = 0;
    };
    class DeploymentCinematic {
        title = QUOTE($STR_PARAMS_DEPLOYMENTCAMERA);
        values[] = {1, 0};
        texts[] = {QUOTE($STR_PARAMS_ENABLED), QUOTE($STR_PARAMS_DISABLED)};
        default = 0;
    };
    class Whitelist {
        title = QUOTE($STR_WHITELIST_PARAM);
        values[] = {1, 0};
        texts[] = {QUOTE($STR_WHITELIST_ENABLED), QUOTE($STR_PARAMS_DISABLED)};
        default = 0;
    };
    class ServerRestart {
        title = QUOTE($STR_RESTART_PARAM);
        values[] = {0, 1, 2, 3, 4, 5, 6};
        texts[] = {QUOTE($STR_PARAMS_DISABLED), "1", "2", "3", "4", "5", "6"};
        default = 0;
    };
    class WipeSave1 {
        title = QUOTE($STR_WIPE_TITLE);
        values[] = {0, 1};
        texts[] =  {QUOTE($STR_WIPE_NO), QUOTE($STR_WIPE_YES)};
        default = 0;
    };
    class WipeSave2 {
        title = QUOTE($STR_WIPE_TITLE_2);
        values[] = {0, 1};
        texts[] = {QUOTE($STR_WIPE_NO), QUOTE($STR_WIPE_YES)};
        default = 0;
    };
    class Spacer4 {
        title = "";
        values[] = {""};
        texts[] = {""};
        default = "";
    };
    class DebugOptions {
        title = QUOTE($STR_PARAMS_DEBUGOPTIONS);
        values[] = {""};
        texts[] = {""};
        default = "";
    };
    class DebugAsymmetric {
        title = QUOTE($STR_PARAMS_DEBUG_ASYMMETRIC);
        values[] = {0, 1};
        texts[] = {QUOTE($STR_PARAMS_DISABLED), QUOTE($STR_PARAMS_ENABLED)};
        default = 0;
    };
    class DebugCivInfo {
        title = QUOTE($STR_PARAMS_DEBUG_CIVINFO);
        values[] = {0, 1};
        texts[] = {QUOTE($STR_PARAMS_DISABLED), QUOTE($STR_PARAMS_ENABLED)};
        default = 0;
    };
    class DebugCivRep {
        title = QUOTE($STR_PARAMS_DEBUG_CIVREP);
        values[] = {0, 1};
        texts[] = {QUOTE($STR_PARAMS_DISABLED), QUOTE($STR_PARAMS_ENABLED)};
        default = 0;
    };
    class DebugHighCommand {
        title = QUOTE($STR_PARAM_DEBUG_HIGHCOMMAND);
        values[] = {0, 1};
        texts[] = {QUOTE($STR_PARAMS_DISABLED), QUOTE($STR_PARAMS_ENABLED)};
        default = 0;
    };
    class DebugKill {
        title = QUOTE($STR_PARAMS_DEBUG_KILL);
        values[] = {0, 1};
        texts[] = {QUOTE($STR_PARAMS_DISABLED), QUOTE($STR_PARAMS_ENABLED)};
        default = 0;
    };
    class DebugLogistic {
        title = QUOTE($STR_PARAMS_DEBUG_LOGISTIC);
        values[] = {0, 1};
        texts[] = {QUOTE($STR_PARAMS_DISABLED), QUOTE($STR_PARAMS_ENABLED)};
        default = 0;
    };
    class DebugProduction {
        title = QUOTE($STR_PARAMS_DEBUG_PRODUCTION);
        values[] = {0, 1};
        texts[] = {QUOTE($STR_PARAMS_DISABLED), QUOTE($STR_PARAMS_ENABLED)};
        default = 0;
    };
    class DebugSave {
        title = QUOTE($STR_PARAMS_DEBUG_SAVE);
        values[] = {0, 1};
        texts[] = {QUOTE($STR_PARAMS_DISABLED), QUOTE($STR_PARAMS_ENABLED)};
        default = 0;
    };
    class DebugSectorSpawn {
        title = QUOTE($STR_PARAMS_DEBUG_SECTORSPAWN);
        values[] = {0, 1};
        texts[] = {QUOTE($STR_PARAMS_DISABLED), QUOTE($STR_PARAMS_ENABLED)};
        default = 0;
    };
};
