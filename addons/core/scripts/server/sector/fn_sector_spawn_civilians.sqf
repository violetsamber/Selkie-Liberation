/*
    File: fn_sector_spawn_civilians.sqf
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

PFH_GETPARAM(_pfh,_sectorMarker,PFH_PARAM_SECTOR_MARKER)
PFH_GETPARAM(_pfh,_sectorPos,PFH_PARAM_SECTOR_POS)

PFH_GETVAR(_pfh,"_stageWorkerIndex_0",0)
PFH_GETVAR(_pfh,"_spawnCivs",0)
PFH_GETVAR(_pfh,"_civsSpread",0)
PFH_GETVAR(_pfh,"_civsGroups",[])
PFH_GETVAR(_pfh,"_managed_units",[])

private _isStageFinished = false;
private _grp = grpNull;
private _unit = objNull;

if(_stageWorkerIndex_0 < _spawnCivs) then {
    
    _grp = createGroup [GRLIB_side_civilian, true];
    private _class = selectRandom civilians;

    [format ["Spawning civ.. %1", _class]] call KPLIB_fnc_debugLog;
    
    _unit = [ _class,
        [(((_sectorPos select 0) + (75 * _civsSpread)) - (random (150 * _civsSpread))), (((_sectorPos select 1) + (75 * _civsSpread)) - (random (150 * _civsSpread))), 0],
        _grp
    ] call KPLIB_fnc_createManagedUnit;
    
    [_grp] call KPLIB_server_fnc_add_civ_waypoints;
    
    _civsGroups pushBack _grp;
    _managed_units pushBack _unit;
    
    INC(_stageWorkerIndex_0);
} else {
    _isStageFinished = true; 
};

[
    _isStageFinished,
    _stageWorkerIndex_0,
    _managed_units,
    _civsGroups
]
