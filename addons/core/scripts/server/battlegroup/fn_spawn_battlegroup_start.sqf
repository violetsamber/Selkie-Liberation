/*
    File: fn_spawn_battlegroup_start.sqf
    Authors: Violets
    Date: 2025-11-05
    Last Update: 2025-11-05
    License: MIT License - http://www.opensource.org/licenses/MIT
    
    Description:
        No description added yet.
    
    Parameter(s):
        _localVariable - Description [DATATYPE, defaults to DEFAULTVALUE]
    
    Returns:
        Function reached the end [BOOL]
*/

params [
    ["_pfh", objNull]
];

["[BATTLEGROUP] Starting battlegroup spawn."] call KPLIB_fnc_log;
private _infOnly =     _pfh getVariable "params" select 0;
private _target_size = _pfh getVariable "params" select 3;

private _battlegroup_vehicles = [];
private _battlegroup_infantry = [];

GRLIB_last_battlegroup_time = diag_tickTime;

if (_infOnly) then {
    // Infantry units to choose from
    private _infClasses = [KPLIB_o_inf_classes, militia_squad] select (SLKLIB_combat_readiness < 50);

    // Adjust target size for infantry
    _target_size = 12 max (_target_size * 4);
    private _squadNumber = round (_target_size/8);

    for "_i" from 1 to _squadNumber do {
        private _grpList = [];
        for "_i" from 0 to 7 do {
            _grpList pushBack selectRandom _infClasses;
        };
        _battlegroup_infantry pushBack _grpList;
    };

    _battlegroup_vehicles = [
        "Selkie_UNSC_Marines_Pelican_Unarmed_Halo3",
        "Selkie_UNSC_Marines_Pelican_Unarmed_Halo3",
        "Selkie_UNSC_Marines_Pelican_Unarmed_Halo3",
        "Selkie_UNSC_Marines_Pelican_Unarmed_Halo3"
    ];

} else {

    _battlegroup_vehicles = [
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


    //TODO Handle diffrently
    // [_spawn_marker] spawn
    // {
    //     params ["_spawn_marker"];
    //     [_spawn_marker, [markerPos _spawn_marker] call KPLIB_fnc_getNearestBluforObjective, 3] call KPLIB_server_fnc_odstDrop; 
    // };

    //TODO Handle diffrently
    // if (GRLIB_csat_aggressivity > 0.5) then {
    //     [[markerPos _spawn_marker] call KPLIB_fnc_getNearestBluforObjective] spawn KPLIB_server_fnc_spawn_boat;
    // };

    //TODO Handle diffrently
    // if (GRLIB_csat_aggressivity > 0.9) then {
    //     [[markerPos _spawn_marker] call KPLIB_fnc_getNearestBluforObjective] spawn KPLIB_server_fnc_spawn_air;
    // };
};
["[BATTLEGROUP] Finished fn_spawn_battlegroup_start"] call KPLIB_fnc_log;

[_battlegroup_vehicles, _battlegroup_infantry]
