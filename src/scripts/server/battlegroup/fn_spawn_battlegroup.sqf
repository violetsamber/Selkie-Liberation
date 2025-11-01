// TODO Refactor and create function
params [
    ["_spawn_marker", "", [""]],
    ["_infOnly", false, [false]]
];

if (GRLIB_endgame == 1) exitWith {};

_spawn_marker = [[2000, 1000] select _infOnly, 3000, false, markerPos _spawn_marker] call KPLIB_fnc_getOpforSpawnPoint;

if (_spawn_marker isNotEqualTo "") then {
    GRLIB_last_battlegroup_time = diag_tickTime;

    private _bg_groups = [];
    private _selected_opfor_battlegroup = [];
    private _target_size = (round (GRLIB_battlegroup_size * ([] call KPLIB_fnc_getOpforFactor) * (sqrt GRLIB_csat_aggressivity))) min 16;
    if (combat_readiness < 60) then {_target_size = round (_target_size * 0.65);};

    [_spawn_marker] remoteExec ["KPLIB_shared_fnc_remote_call_battlegroup"];

    if (worldName in KP_liberation_battlegroup_clearance) then {
        [markerPos _spawn_marker, 30] call KPLIB_fnc_createClearance;
    };

    if (_infOnly) then {
        // Infantry units to choose from
        private _infClasses = [KPLIB_o_inf_classes, militia_squad] select (combat_readiness < 50);

        // Adjust target size for infantry
        _target_size = 12 max (_target_size * 4);
        private _squadNumber = round (_target_size/8);

        for "_i" from 1 to _squadNumber do {
        // Create infantry groups with up to 8 units per squad
        private _grp = createGroup [GRLIB_side_enemy, true];
        for "_i" from 0 to 7 do {
            [selectRandom _infClasses, markerPos _spawn_marker, _grp] call KPLIB_fnc_createManagedUnit;
        };
        [_grp] call KPLIB_fnc_LAMBS_enableReinforcements;
        [_grp] call KPLIB_server_fnc_battlegroup_ai;
        _grp setVariable ["KPLIB_isBattleGroup",true];
        };

        _selected_opfor_battlegroup = [
            "Selkie_UNSC_Marines_Pelican_Unarmed_Halo3",
            "Selkie_UNSC_Marines_Pelican_Unarmed_Halo3",
            "Selkie_UNSC_Marines_Pelican_Unarmed_Halo3",
            "Selkie_UNSC_Marines_Pelican_Unarmed_Halo3"
        ];
        _target_size = count _selected_opfor_battlegroup;

    } else {
        // private _vehicle_pool = [opfor_battlegroup_vehicles, opfor_battlegroup_vehicles_low_intensity] select (combat_readiness < 50);
        // while {count _selected_opfor_battlegroup < _target_size} do {
        //     _selected_opfor_battlegroup pushBack (selectRandom _vehicle_pool);
        // };

        _selected_opfor_battlegroup = [
            "OPTRE_M808B_UNSC",
            "Selkie_UNSC_Marines_Pelican_Unarmed_Halo3",
            "Selkie_UNSC_Marines_Pelican_Unarmed_Halo3",
            "Selkie_UNSC_Marines_Pelican_Unarmed_Halo3",
            "Selkie_UNSC_Marines_Pelican_Unarmed_Halo3",
            "Selkie_UNSC_Marines_Hornet_Halo3",
            "Selkie_UNSC_Marines_Hornet_Halo3",
            "Selkie_UNSC_Marines_Bison_105mm_Halo3",
            "Selkie_UNSC_Marines_Hog_Gauss_Halo3",
            "Selkie_UNSC_Marines_Hog_LAAG_Halo3",
            "Selkie_UNSC_Marines_Hog_LAAG_Halo3",
            "Selkie_UNSC_Marines_Bison_Unarmed_Halo3",
            "OPTRE_m1087_stallion_cover_unsc",
            "OPTRE_m1087_stallion_cover_unsc",
            "OPTRE_m1087_stallion_unsc",
            "OPTRE_m1087_stallion_unsc"
        ];
        _target_size = count _selected_opfor_battlegroup;

        [_spawn_marker] spawn
        {
            params ["_spawn_marker"];
            [_spawn_marker, [markerPos _spawn_marker] call KPLIB_fnc_getNearestBluforObjective, 3] call KPLIB_server_fnc_odstDrop; 
        };

        if (GRLIB_csat_aggressivity > 0.5) then {
            [[markerPos _spawn_marker] call KPLIB_fnc_getNearestBluforObjective] spawn KPLIB_server_fnc_spawn_boat;
        };

        // if (GRLIB_csat_aggressivity > 0.9) then {
        //     [[markerPos _spawn_marker] call KPLIB_fnc_getNearestBluforObjective] spawn KPLIB_server_fnc_spawn_air;
        // };
    };

    private ["_nextgrp", "_vehicle"];
    {
            _nextgrp = createGroup [GRLIB_side_enemy, true];
            _vehicle = [markerPos _spawn_marker, _x] call KPLIB_fnc_spawnVehicle;

            sleep 0.5;

            (crew _vehicle) joinSilent _nextgrp;
            [_nextgrp] call KPLIB_server_fnc_battlegroup_ai;
            _nextgrp setVariable ["KPLIB_isBattleGroup",true];

            if ((_x in opfor_troup_transports) && ([] call KPLIB_fnc_getOpforCap < GRLIB_battlegroup_cap)) then {
                if (_vehicle isKindOf "Air") then {
                    [[markerPos _spawn_marker] call KPLIB_fnc_getNearestBluforObjective, _vehicle] spawn KPLIB_server_fnc_send_paratroopers;
                } else {
                    [_vehicle] spawn KPLIB_server_fnc_troup_transport;
                };
            };
    } forEach _selected_opfor_battlegroup;

    sleep 3;

    //Reduce combat readiness
    [-(round (count _bg_groups + random (count _bg_groups)))] call KPLIB_fnc_addCombatReadiness;
    stats_hostile_battlegroups = stats_hostile_battlegroups + 1;

    {
        if (local _x) then {
            _headless_client = [] call KPLIB_fnc_getLessLoadedHC;
            if (!isNull _headless_client) then {
                _x setGroupOwner (owner _headless_client);
            };
        };
        sleep 1;
    } forEach _bg_groups;
};
