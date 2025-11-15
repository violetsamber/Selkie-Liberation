/*
    File: fn_sector_cleanup.sqf
    Authors: 
    Date: 2025-11-15
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
PFH_GETPARAM(_pfh,_opforcount,PFH_PARAM_OPFORCOUNT)

PFH_GETVAR(_pfh,"_stageWorkerIndex_0",0)
PFH_GETVAR(_pfh,"_stageWorkerIndex_1",0)
PFH_GETVAR(_pfh,"_local_capture_size",0)
PFH_GETVAR(_pfh,"_managed_units",[])

private _isStageFinished = false;

if (([_sectorPos, _local_capture_size] call KPLIB_fnc_getSectorOwnership == GRLIB_side_friendly) && (GRLIB_endgame == 0)) then {
    switch (_stageWorkerIndex_0) do {
        case 0: {
            [format ["Calling capture."], "SECTOR"] call KPLIB_fnc_debugLog;
            if (isServer) then {
                [_sectorMarker] spawn KPLIB_shared_fnc_sector_liberated_remote_call;
            } else {
                [_sectorMarker] remoteExec ["KPLIB_shared_fnc_sector_liberated_remote_call",2];
            };
            {[_x] spawn KPLIB_server_fnc_prisonner_ai;} forEach ((markerPos _sectorMarker) nearEntities [["Man"], _local_capture_size * 1.2]);
            INC(_stageWorkerIndex_0);
        };
        case 1: {
            if(_stageWorkerIndex_1 < 60) then {
                ADD(_stageWorkerIndex_1,PFH_UPDATE_TIME);
            } else {
                [format ["Remove from active sectors."], "SECTOR"] call KPLIB_fnc_debugLog;
                active_sectors = active_sectors - [_sectorMarker]; publicVariable "active_sectors";
                _stageWorkerIndex_1 = 0;
                INC(_stageWorkerIndex_0);
            }
        };
        case 2: {
            if(_stageWorkerIndex_1 < 60) then {
                ADD(_stageWorkerIndex_1,PFH_UPDATE_TIME);
                _stageWorkerIndex_1 = 0;
            } else {
                [format ["Cleaning up all managed units."], "SECTOR"] call KPLIB_fnc_debugLog;
                //TODO This should be handled by a garbage collector script
                //TODO optimize
                {
                    if (_x isKindOf "Man") then {
                        if (side group _x != GRLIB_side_friendly) then {
                            deleteVehicle _x;
                        };
                    } else {
                        if (!isNull _x) then {
                            [_x] call KPLIB_fnc_cleanOpforVehicle;
                        };
                    };
                } forEach _managed_units;
                INC(_stageWorkerIndex_0);
            };
        };
        default {
            _isStageFinished = true;
        }
    };
};

[
    _isStageFinished,
    _stageWorkerIndex_0,
    _stageWorkerIndex_1
]
