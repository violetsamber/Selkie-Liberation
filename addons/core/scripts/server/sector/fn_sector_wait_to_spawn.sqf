/*
    File: fn_sector_wait_to_spawn.sqf
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

/*
    File: fn_wait_to_spawn_sector.sqf
    Authors: Violets
    Date: 2025-11-01
    Last Update: 2025-11-07
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

#define TIME_TO_WAIT 60

//TODO REFACTOR THIS MESS
params ["_sector"];

PFH_GETPARAM(_pfh,_sectorMarker,PFH_PARAM_SECTOR_MARKER)

PFH_GETVAR(_pfh,"_vehicle",objNull)
PFH_GETVAR(_pfh,"_stageWorkerIndex_0",0)

if(_stageWorkerIndex_0 == 0) then {
    [format ["Sector %1 (%2) - Waiting to spawn sector...", (markerText _sectorMarker), _sectorMarker], "SECTORSPAWN"] remoteExecCall ["KPLIB_fnc_log", 2];
};

//Origional script tried to prevent the spawning a of sector if someone was passing through it
if(TIME_TO_WAIT <= PFH_UPDATE_TIME * _stageWorkerIndex_0) then {
    INCREMENT(_stageWorkerIndex_0)
};

if(TIME_TO_WAIT >= PFH_UPDATE_TIME * _stageWorkerIndex_0) then {
    [format ["Sector %1 (%2) - Waiting done - Time needed: %3 seconds", (markerText _sectorMarker), _sectorMarker, PFH_UPDATE_TIME * _stageWorkerIndex_0], "SECTORSPAWN"] remoteExecCall ["KPLIB_fnc_log", 2];
};

[_isStageFinished,_stageWorkerIndex_0]
