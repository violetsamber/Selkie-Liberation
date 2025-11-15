/*
    File: fn_sector_wait_to_spawn.sqf
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

//TODO REFACTOR THIS MESS
params ["_pfh"];

PFH_GETPARAM(_pfh,_sectorMarker,PFH_PARAM_SECTOR_MARKER)

PFH_GETVAR(_pfh,"_stageWorkerIndex_0",0)

private _isStageFinished = false;

private _timer = (PFH_UPDATE_TIME * _stageWorkerIndex_0);

if(_stageWorkerIndex_0 == 0) then {
    [format ["Sector %1 (%2) - Waiting to spawn sector... %3 till.. %4 ", (markerText _sectorMarker), _sectorMarker, _timer, TIME_TO_WAIT], "SECTORSPAWN"] remoteExecCall ["KPLIB_fnc_log", 2];
};

if(_timer < TIME_TO_WAIT) then {
    INCREMENT(_stageWorkerIndex_0)
};

if(_timer >= TIME_TO_WAIT) then {
    [format ["Sector %1 (%2) - Waiting done - Time needed: %3 seconds", (markerText _sectorMarker), _sectorMarker, _timer], "SECTORSPAWN"] remoteExecCall ["KPLIB_fnc_log", 2];
    _isStageFinished = true;
};

[
    _isStageFinished,
    _stageWorkerIndex_0
]
