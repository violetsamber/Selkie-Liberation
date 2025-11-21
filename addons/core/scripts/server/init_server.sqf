// Globals
active_sectors = []; publicVariable "active_sectors";

SLKLIB_sectors_under_attack = []; publicVariable "SLKLIB_sectors_under_attack";

SLKLIB_tasksData = [];
SLKLIB_activeTasks = []; publicVariable "SLKLIB_activeTasks";
SLKLIB_taskCount = 0; publicVariable "SLKLIB_taskCount";

//TODO Change the logic of the below sqf files so they are not using execVM
execVM "scripts\server\base\startgame.sqf";
execVM "scripts\server\base\huron_manager.sqf";
execVM "scripts\server\base\startvehicle_spawn.sqf";
[] call KPLIB_server_fnc_createSuppModules;
execVM "scripts\server\battlegroup\counter_battlegroup.sqf";
[] call KPLIB_server_fnc_random_battlegroups;
execVM "scripts\server\battlegroup\readiness_increase.sqf";
execVM "scripts\server\game\apply_default_permissions.sqf";
execVM "scripts\server\game\cleanup_vehicles.sqf";
if (!KP_liberation_fog_param) then {execVM "scripts\server\game\fucking_set_fog.sqf";};
execVM "scripts\server\game\manage_time.sqf";
execVM "scripts\server\game\manage_weather.sqf";
execVM "scripts\server\game\playtime.sqf";
execVM "scripts\server\game\save_manager.sqf";
execVM "scripts\server\game\spawn_radio_towers.sqf";
execVM "scripts\server\game\synchronise_vars.sqf";
execVM "scripts\server\game\synchronise_eco.sqf";
execVM "scripts\server\game\zeus_synchro.sqf";
execVM "scripts\server\offloading\show_fps.sqf";
execVM "scripts\server\patrols\civilian_patrols.sqf";
execVM "scripts\server\patrols\enemy_patrols.sqf";
execVM "scripts\server\patrols\manage_patrols.sqf";
execVM "scripts\server\patrols\reinforcements_resetter.sqf";
if (KP_liberation_ailogistics) then {execVM "scripts\server\resources\manage_logistics.sqf";};
execVM "scripts\server\resources\manage_resources.sqf";
execVM "scripts\server\resources\recalculate_resources.sqf";
execVM "scripts\server\resources\recalculate_timer.sqf";
execVM "scripts\server\resources\recalculate_timer_sector.sqf";
execVM "scripts\server\resources\unit_cap.sqf";
execVM "scripts\server\sector\lose_sectors.sqf";

KPLIB_fsm_sectorMonitor = [] call KPLIB_server_fnc_sectorMonitor;
if (KP_liberation_high_command) then {KPLIB_fsm_highcommand = [] call KPLIB_server_fnc_highcommand;};

// Select FOB templates
switch (KP_liberation_preset_opfor) do {
    case 1: {
        KPLIB_fob_templates = [
            "scripts\fob_templates\apex\template1.sqf",
            "scripts\fob_templates\apex\template2.sqf",
            "scripts\fob_templates\apex\template3.sqf",
            "scripts\fob_templates\apex\template4.sqf",
            "scripts\fob_templates\apex\template5.sqf"
        ];
    };
    case 12: {
        KPLIB_fob_templates = [
            "scripts\fob_templates\unsung\template1.sqf",
            "scripts\fob_templates\unsung\template2.sqf",
            "scripts\fob_templates\unsung\template3.sqf",
            "scripts\fob_templates\unsung\template4.sqf",
            "scripts\fob_templates\unsung\template5.sqf"
        ];
    };
    case 21: {
        KPLIB_fob_templates = [
            "scripts\fob_templates\vn\template1.sqf",
            "scripts\fob_templates\vn\template2.sqf",
            "scripts\fob_templates\vn\template3.sqf",
            "scripts\fob_templates\vn\template4.sqf",
            "scripts\fob_templates\vn\template5.sqf"
        ];
    };
    case 22: {
        KPLIB_fob_templates = [
             "scripts\fob_templates\optre\template1.sqf",
             "scripts\fob_templates\optre\template2.sqf",
             "scripts\fob_templates\optre\template3.sqf"

        ];
    };
    default {
        KPLIB_fob_templates = [
            "scripts\fob_templates\default\template1.sqf",
            "scripts\fob_templates\default\template2.sqf",
            "scripts\fob_templates\default\template3.sqf",
            "scripts\fob_templates\default\template4.sqf",
            "scripts\fob_templates\default\template5.sqf",
            "scripts\fob_templates\default\template6.sqf",
            "scripts\fob_templates\default\template7.sqf",
            "scripts\fob_templates\default\template8.sqf",
            "scripts\fob_templates\default\template9.sqf",
            "scripts\fob_templates\default\template10.sqf"
        ];
    };
};

// Civil Reputation
execVM "scripts\server\civrep\init_module.sqf";

// Civil Informant
execVM "scripts\server\civinformant\init_module.sqf";

// Asymmetric Threats
execVM "scripts\server\asymmetric\init_module.sqf";

// Groupcheck for deletion when empty
execVM "scripts\server\offloading\group_diag.sqf";

{
    if ((_x != player) && (_x distance (markerPos GRLIB_respawn_marker) < 200 )) then {
        deleteVehicle _x;
    };
} forEach allUnits;

// Server Restart Script from K4s0
if (KP_liberation_restart > 0) then {
    execVM "scripts\server\game\server_restart.sqf";
};

["KPLIB_ResetBattleGroups", {
    {
        if (_x getVariable ["KPLIB_isBattleGroup",false]) then {
            [_x] call KPLIB_server_fnc_battlegroup_ai;
        }
    } forEach allGroups;
}] call CBA_fnc_addEventHandler;
