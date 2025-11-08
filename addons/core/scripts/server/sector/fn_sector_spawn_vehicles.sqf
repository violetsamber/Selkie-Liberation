/*
    File: fn_sector_spawn_vehicles.sqf
    Authors: Violets
    Date: 2025-11-07
    Last Update: 2025-11-07
    License: GNU GENERAL PUBLIC LICENSE - https://www.gnu.org/licenses/gpl-3.0.en.html
    
    Description:
        No description added yet.
    
    Parameter(s):
        _localVariable - Description [DATATYPE, defaults to DEFAULTVALUE]
    
    Returns:
        Function reached the end [BOOL]
*/

_vehtospawn = _vehtospawn select {!(isNil "_x")};
{
    _vehicle = [_sectorpos, _x] call KPLIB_fnc_spawnVehicle;
    [group ((crew _vehicle) select 0),_sectorpos] spawn KPLIB_server_fnc_add_defense_waypoints;
    _managed_units pushBack _vehicle;
    {_managed_units pushBack _x;} forEach (crew _vehicle);
    sleep 0.25;
} forEach _vehtospawn;