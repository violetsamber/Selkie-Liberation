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

#include "../FunctionsInclude.hpp"
#include "sector_macros.hpp"

params [
    ["_pfh", objNull]
];

PFH_GETPARAM(_pfh,_sectorPos,PFH_PARAM_SECTOR_POS)
PFH_GETPARAM(_pfh,_sectorMarker,PFH_PARAM_SECTOR_MARKER)

PFH_GETVAR(_pfh,"_stageWorkerIndex_0",0)
PFH_GETVAR(_pfh,"_managed_units",[])
PFH_GETVAR(_pfh,"_roamingToSpawn",[])
PFH_GETVAR(_pfh,"_roamingGroups",[])
PFH_GETVAR(_pfh,"_squadToSpawn",[])
PFH_GETVAR(_pfh,"_infsquad","")
// PFH_GETVAR(_pfh,"_stageWorkerIndex_1",0)
private _isStageFinished = false;

//[format ["Trying to spawn... _stageWorkerIndex_0: %1",_stageWorkerIndex_0], "SECTOR"] call KPLIB_fnc_debugLog;
if(_stageWorkerIndex_0 < (count _roamingToSpawn)) then {
    //Get a squad or spawn a squad
    

    private _grp = grpNull;
    private _unit = objNull;
    private _class = "";

    if((count _roamingGroups) >= (_stageWorkerIndex_0 + 1)) then {
        _grp = _roamingGroups select _stageWorkerIndex_0;
        [format ["Selected grp: %1",_grp], "SECTOR"] call KPLIB_fnc_debugLog;
    } else {
        _grp = createGroup [GRLIB_side_enemy, true];
        _squadToSpawn =  +(_roamingToSpawn select _stageWorkerIndex_0);
        _roamingGroups pushBack _grp;
        [format ["Created grp: %1",_grp], "SECTOR"] call KPLIB_fnc_debugLog;
    };

    _class = _squadToSpawn select 0;
    _squadToSpawn deleteAt 0;

    _unit = [_class, _sectorPos, _grp] call KPLIB_fnc_createManagedUnit;
    _managed_units pushBack _unit;

    [format ["Spawned unit: %1", _class], "SECTOR"] call KPLIB_fnc_debugLog;

    if((count units _grp) >= ROAMING_SQUAD_MAX)then{
        INC(_stageWorkerIndex_0);
        [_grp, _sectorPos] spawn KPLIB_server_fnc_add_defense_waypoints;
        [format ["Grp full: %1", _grp], "SECTOR"] call KPLIB_fnc_debugLog;
    };
} else {
    _isStageFinished = true;
    ["Squads finished spawning", "SECTOR"] call KPLIB_fnc_log;
};

[
    _isStageFinished,
    _stageWorkerIndex_0,
    _managed_units,
    _roamingGroups,
    _squadToSpawn
]
