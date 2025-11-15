/*
    File: fn_sector_update.sqf
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
PFH_GETPARAM(_pfh,_opforcount,PFH_PARAM_OPFORCOUNT)

PFH_GETVAR(_pfh,"_stageWorkerIndex_0",0)
PFH_GETVAR(_pfh,"_managed_units",[])
PFH_GETVAR(_pfh,"_sector_despawn_tickets",0)
PFH_GETVAR(_pfh,"_maximum_additional_tickets",0)
PFH_GETVAR(_pfh,"_activationTime",0)
PFH_GETVAR(_pfh,"_local_capture_size",0)

private _isStageFinished = false;
private _isFinished = false;

//Wait to update sector
if(_stageWorkerIndex_0 < SECTOR_TICK_TIME) then {
    ADD(_stageWorkerIndex_0,PFH_UPDATE_TIME);
} else {
    [format ["Sector update."], "SECTOR"] call KPLIB_fnc_debugLog;
    _stageWorkerIndex_0 = 0;

    if (([_sectorpos, _local_capture_size] call KPLIB_fnc_getSectorOwnership == GRLIB_side_friendly) && (GRLIB_endgame == 0)) then {
        _isStageFinished = true;
    } else {
        //Sector running logic
        if (([_sectorpos, (([_opforcount] call KPLIB_fnc_getSectorRange) + 300), GRLIB_side_friendly] call KPLIB_fnc_getUnitsCount) == 0) then {
            _sector_despawn_tickets = _sector_despawn_tickets - 1;
        } else {
            // start counting running minutes after ADDITIONAL_TICKETS_DELAY
            private _runningMinutes = (floor ((time - _activationTime) / 60)) - ADDITIONAL_TICKETS_DELAY;
            private _additionalTickets = (_runningMinutes * BASE_TICKETS);

            // clamp from 0 to "_maximum_additional_tickets"
            _additionalTickets = (_additionalTickets max 0) min _maximum_additional_tickets;

            _sector_despawn_tickets = BASE_TICKETS + _additionalTickets;
        };

        [format ["Tickets update. "], "SECTOR"] call KPLIB_fnc_debugLog;

        if (_sector_despawn_tickets <= 0) then {
            {
                if (_x isKindOf "Man") then {
                    deleteVehicle _x;
                } else {
                    if (!isNull _x) then {
                        [_x] call KPLIB_fnc_cleanOpforVehicle;
                    };
                };
            } forEach _managed_units;

            _isStageFinished = true;
            _isFinished = true;
            active_sectors = active_sectors - [_sectorMarker]; publicVariable "active_sectors";
        };
    };
};

[
    _isStageFinished,
    _stageWorkerIndex_0,
    _sector_despawn_tickets,
    _maximum_additional_tickets,
    _activationTime,
    _isFinished
]
