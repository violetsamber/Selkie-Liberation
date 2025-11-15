/*
    File: fn_sector_spawn_guerilla_attack.sqf
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

PFH_GETVAR(_pfh,"_guerilla",false)

if (_guerilla) then {
    [_sectorMarker] spawn KPLIB_server_fnc_sector_guerilla;
};

[
    true
]
