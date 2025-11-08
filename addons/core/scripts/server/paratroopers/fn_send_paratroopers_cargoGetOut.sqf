/*
    File: fn_send_paratroopers_drop.sqf
    Authors: 
    Date: 2025-11-06
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

params [
    ["_pfh", objNull]
];

PFH_GETVAR(_pfh,"_para_group",grpNull)
PFH_GETVAR(_pfh,"_stageWorkerIndex_0",0)
PFH_GETVAR(_pfh,"_maxCargo",0)
PFH_GETVAR(_pfh,"_stageIndex",0)

[format ["[PARATROOPERS] GetOut _para_group: %1, _maxCargo %2, _stageWorkerIndex_0 %3", _para_group, _maxCargo, _stageWorkerIndex_0]] call KPLIB_fnc_log;

if(_stageWorkerIndex_0 <= _maxCargo) then {
    private _unit = ((units _para_group) select _stageWorkerIndex_0);
    unassignVehicle _unit;
    moveOut _unit;
    [_unit] orderGetIn false;
    [_unit] allowGetIn false;
    [format ["[PARATROOPERS] Ejected _unit: %1", _unit]] call KPLIB_fnc_log;
    INCREMENT(_stageWorkerIndex_0)
} else {
    _stageWorkerIndex_0 = 0;
    INCREMENT(_stageIndex);
    [format ["[PARATROOPERS] Finished Ejecting: %1", _para_group]] call KPLIB_fnc_log;
};

[_stageIndex, _stageWorkerIndex_0]
