/*
    File: fn_sector_spawn_vehicles.sqf
    Authors: Violets
    Date: 2025-11-07
    Last Update: 2025-11-15
    License: GNU GENERAL PUBLIC LICENSE - https://www.gnu.org/licenses/gpl-3.0.en.html
    
    Description:
        No description added yet.
    
    Parameter(s):
        _localVariable - Description [DATATYPE, defaults to DEFAULTVALUE]
    
    Returns:
        Function reached the end [BOOL]
*/

#include "../FunctionsInclude.hpp"
#include "sector_macros.hpp"

params [
    ["_pfh", objNull]
];

PFH_GETPARAM(_pfh,_sectorPos,PFH_PARAM_SECTOR_POS)
PFH_GETPARAM(_pfh,_sectorMarker,PFH_PARAM_SECTOR_MARKER)

PFH_GETVAR(_pfh,"_stageWorkerIndex_0",0)
PFH_GETVAR(_pfh,"_managed_units",[])
PFH_GETVAR(_pfh,"_vehGroups",[])
PFH_GETVAR(_pfh,"_vehToSpawn",[])

private _isStageFinished = false;

if(_stageWorkerIndex_0 < count _vehToSpawn)then{
    _vehtospawn = _vehtospawn select _stageWorkerIndex_0;
    _vehicle = [_sectorpos, _vehtospawn] call KPLIB_fnc_spawnVehicle;
    [[_vehicle] call CBA_fnc_getGroup,_sectorpos] spawn KPLIB_server_fnc_add_defense_waypoints;
    _vehGroups pushBack _vehicle;

    [format["Spawning Vehicle %1", _vehtospawn], "SECTOR"] call KPLIB_fnc_debugLog;

    _managed_units pushBack _vehicle;
    {_managed_units pushBack _x;} forEach (crew _vehicle);
    INC(_stageWorkerIndex_0);
} else {
    _isStageFinished = true;
};

[
    _isStageFinished,
    _stageWorkerIndex_0,
    _managed_units,
    _vehGroups
]
