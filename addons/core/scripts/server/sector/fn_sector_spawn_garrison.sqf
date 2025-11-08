/*
    File: fn_sector_spawn_garrison.sqf
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

if (_building_ai_max > 0 && GRLIB_adaptive_opfor) then {
    _building_ai_max = round (_building_ai_max * ([] call KPLIB_fnc_getOpforFactor));
};

if (_building_ai_max > 0) then {
    //Get all buildings withing _building_range
    _allbuildings = (nearestObjects [_sectorpos, ["House"], _building_range]) select {alive _x};
    //For each of the buildings get their positions
    _buildingpositions = [];
    {
        _buildingpositions = _buildingpositions + [([_x] call BIS_fnc_buildingPositions)];
    } forEach _allbuildings;

    _largestBuildings = [_buildingpositions,[],{count _x},"DESCEND", {count _x > 4}] call BIS_fnc_sortBy;

    if (KP_liberation_sectorspawn_debug > 0) then {[format ["Sector %1 (%2) - manage_one_sector found %3 building positions", (markerText _sector), _sector, (count _largestBuildings)], "SECTORSPAWN"] remoteExecCall ["KPLIB_fnc_log", 2];};
    if (count _largestBuildings > 1) then {
        _managed_units = _managed_units + ([_infsquad, MAX_BUILDING_UNITS, _largestBuildings, _sector] call KPLIB_fnc_spawnBuildingSquadModified);
    };
};