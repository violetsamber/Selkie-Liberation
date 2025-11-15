/*
    File: fn_sector_spawn_ieds.sqf
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

PFH_GETVAR(_pfh,"_building_range",0)
PFH_GETVAR(_pfh,"_iedcount",0)

if (KP_liberation_asymmetric_debug > 0) then {[format ["Sector %1 (%2) - Range: %3 - Count: %4", (markerText _sectorMarker), _sectorMarker, _building_range, _iedcount], "ASYMMETRIC"] remoteExecCall ["KPLIB_fnc_log", 2];};
[_sectorMarker, _building_range, _iedcount] spawn KPLIB_server_fnc_ied_manager;

[
    true
]
