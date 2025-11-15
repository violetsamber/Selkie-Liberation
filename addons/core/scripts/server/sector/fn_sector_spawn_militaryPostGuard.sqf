/*
    File: fn_sector_spawn_militaryPostGuard.sqf
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

PFH_GETVAR(_pfh,"_managed_units",[])

_managed_units = _managed_units + ([_sectorpos] call KPLIB_fnc_spawnMilitaryPostSquad);

private _isStageFinished = true;

[
    _isStageFinished,
    _managed_units
]
