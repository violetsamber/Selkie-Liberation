/*
    File: fn_sector_spawn_reinforcement_call.sqf
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
private _sector = "";


#include "../FunctionsInclude.hpp"
#include "sector_macros.hpp"

params [
    ["_pfh", objNull]
];

PFH_GETPARAM(_pfh,_sectorMarker,PFH_PARAM_SECTOR_MARKER)

private _sectorType = [_sectorMarker, SECTOR_HASHMAP_TYPE] call KPLIB_fnc_getSectorValue;

if ((_sectorType == SECTOR_TYPE_FACTORY) || 
    (_sectorType == SECTOR_TYPE_TOWN) || 
    (_sectorType == SECTOR_TYPE_BIGTOWN) || 
    (_sectorType == SECTOR_TYPE_MILITARY)) then {
    [_sector] remoteExec ["KPLIB_shared_fnc_reinforcements_remote_call",2];
};

[
    true
]
