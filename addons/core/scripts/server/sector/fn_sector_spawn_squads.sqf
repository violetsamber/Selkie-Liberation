/*
    File: fn_sector_spawn_squads.sqf
    Authors: Violets
    Date: 2025-11-07
    Last Update: 2025-11-14
    License: GNU GENERAL PUBLIC LICENSE - https://www.gnu.org/licenses/gpl-3.0.en.html
    
    Description:
        No description added yet.
    
    Parameter(s):
        _localVariable - Description [DATATYPE, defaults to DEFAULTVALUE]
    
    Returns:
        Function reached the end [BOOL]
*/

private _managed_units = [];
private _sectorpos = [];
private _grp = grpNull;

// if (count _squad1 > 0) then {
//     _grp = [_sector, _squad1] call KPLIB_fnc_spawnRegularSquad;
//     [_grp, _sectorpos] spawn KPLIB_server_fnc_add_defense_waypoints;
//     _managed_units = _managed_units + (units _grp);
// };

// if (count _squad2 > 0) then {
//     _grp = [_sector, _squad2] call KPLIB_fnc_spawnRegularSquad;
//     [_grp, _sectorpos] spawn KPLIB_server_fnc_add_defense_waypoints;
//     _managed_units = _managed_units + (units _grp);
// };

// if (count _squad3 > 0) then {
//     _grp = [_sector, _squad3] call KPLIB_fnc_spawnRegularSquad;
//     [_grp, _sectorpos] spawn KPLIB_server_fnc_add_defense_waypoints;
//     _managed_units = _managed_units + (units _grp);
// };

// if (count _squad4 > 0) then {
//     _grp = [_sector, _squad4] call KPLIB_fnc_spawnRegularSquad;
//     [_grp, _sectorpos] spawn KPLIB_server_fnc_add_defense_waypoints;
//     _managed_units = _managed_units + (units _grp);
// };

// if (count _squad10 > 0) then {
//     _grp = [_sector, _squad10] call KPLIB_fnc_spawnRegularSquad;
//     [_grp, _sectorpos] spawn KPLIB_server_fnc_add_defense_waypoints;
//     _managed_units = _managed_units + (units _grp);
// };

// if (count _squad11 > 0) then {
//     _grp = [_sector, _squad11] call KPLIB_fnc_spawnRegularSquad;
//     [_grp, _sectorpos] spawn KPLIB_server_fnc_add_defense_waypoints;
//     _managed_units = _managed_units + (units _grp);
// };

// if (count _squad12 > 0) then {
//     _grp = [_sector, _squad12] call KPLIB_fnc_spawnRegularSquad;
//     [_grp, _sectorpos] spawn KPLIB_server_fnc_add_defense_waypoints;
//     _managed_units = _managed_units + (units _grp);
// };

// if (count _squad13 > 0) then {
//     _grp = [_sector, _squad13] call KPLIB_fnc_spawnRegularSquad;
//     [_grp, _sectorpos] spawn KPLIB_server_fnc_add_defense_waypoints;
//     _managed_units = _managed_units + (units _grp);
// };
