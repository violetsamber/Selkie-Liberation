/*
    File: fn_sector_setup_tower.sqf
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

#include "../FunctionsInclude.hpp"
#include "sector_macros.hpp"

#define SECTOR_MIN_SQUAD_COUNT 5
#define SECTOR_MIN_VIC_COUNT 0

#define READINESS_FOR_ARMY 30

params [
    ["_pfh", objNull]
];

PFH_GETVAR(_pfh,"_roamingToSpawn",[[]])
PFH_GETVAR(_pfh,"_vehToSpawn",[])
PFH_GETVAR(_pfh,"_spawnCivs",false)
PFH_GETVAR(_pfh,"_guerilla",false)
PFH_GETVAR(_pfh,"_infsquad","")
PFH_GETVAR(_pfh,"_building_ai_max",0)
PFH_GETVAR(_pfh,"_building_range",0)
PFH_GETVAR(_pfh,"_local_capture_size",0)
PFH_GETVAR(_pfh,"_iedcount",0)

//Squads and Vehicles
private _squadCount = SECTOR_MIN_SQUAD_COUNT;
private _vehCount = SECTOR_MIN_VIC_COUNT;

if (SLKLIB_combat_readiness > 30) then { INCREMENT(_squadCount) };
if (GRLIB_unitcap >= 1.5) then { INCREMENT(_squadCount) };

if((random 100) > 95) then { INCREMENT(_vehCount) };
if((random 100) > 95) then { INCREMENT(_vehCount) };

for "_i" from 1 to _squadCount do {
    _roamingToSpawn pushBack [_infsquad] call KPLIB_fnc_getSquadComp;
};

for "_i" from 1 to _vehCount do {
    _vehToSpawn pushBack [] call KPLIB_fnc_getAdaptiveVehicle;
};

//Civs
_spawncivs = false;

//Garrison
_building_ai_max = 32;

[
_roamingToSpawn,
_vehToSpawn,
_spawnCivs,
_guerilla,
_infsquad,
_building_ai_max,
_building_range,
_local_capture_size,
_iedcount
]
