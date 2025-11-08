/*
    File: fn_getBuildings.sqf
    Authors: 
    Date: 2025-11-08
    Last Update: 2025-11-08
    License: GNU GENERAL PUBLIC LICENSE - https://www.gnu.org/licenses/gpl-3.0.en.html
    
    Description:
        No description added yet.
    
    Parameter(s):
        _localVariable - Description [DATATYPE, defaults to DEFAULTVALUE]
    
    Returns:
        Function reached the end [BOOL]
*/

params [
    ["_sectorpos", []],
    ["_building_range", 0],
    ["_minPositions", 4]
];

//Get all buildings withing _building_range
private _allbuildings = (nearestObjects [_sectorpos, ["House"], _building_range]) select {alive _x};
//For each of the buildings get their positions
private _buildingPositions = [];
{
    _buildingPositions = _buildingPositions + [([_x] call BIS_fnc_buildingPositions)];
} forEach _allbuildings;

_buildings = [_buildingPositions,[],{count _x},"DESCEND", {count _x > _minPositions}] call BIS_fnc_sortBy;

_buildings