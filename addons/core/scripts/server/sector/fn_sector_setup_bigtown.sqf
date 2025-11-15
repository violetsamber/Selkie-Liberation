/*
    File: fn_sector_setup_bigtown.sqf
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

#define SECTOR_MIN_SQUAD_COUNT 6
#define SECTOR_MIN_VIC_COUNT 2

#define READINESS_FOR_ARMY 30

params [
    ["_pfh", objNull]
];

PFH_GETVAR(_pfh,"_roamingToSpawn",[[]])
PFH_GETVAR(_pfh,"_vehToSpawn",[])
PFH_GETVAR(_pfh,"_spawnCivs",0)
PFH_GETVAR(_pfh,"_civsSpread",0)
PFH_GETVAR(_pfh,"_guerilla",false)
PFH_GETVAR(_pfh,"_infsquad","")
PFH_GETVAR(_pfh,"_building_ai_max",0)
PFH_GETVAR(_pfh,"_building_range",0)
PFH_GETVAR(_pfh,"_local_capture_size",0)
PFH_GETVAR(_pfh,"_iedcount",0)

PFH_GETPARAM(_pfh,_popfactor,PFH_PARAM_POP_FACTOR)

//Squads
if (SLKLIB_combat_readiness < READINESS_FOR_ARMY) then {_infsquad = "militia";};

private _squadCount = SECTOR_MIN_SQUAD_COUNT; 

if (GRLIB_unitcap >= 1) then { INCREMENT(_squadCount) };
if (GRLIB_unitcap >= 1.5) then { INCREMENT(_squadCount) };

for "_i" from 1 to _squadCount do {
    _roamingToSpawn pushBack ([_infsquad] call KPLIB_fnc_getSquadComp);
};

//Vehicles

private _vehCount = SECTOR_MIN_VIC_COUNT;

if ((random 100) > (66 / GRLIB_difficulty_modifier)) then { INCREMENT(_vehCount) };
if ((random 100) > (50 / GRLIB_difficulty_modifier)) then { INCREMENT(_vehCount) };

for "_i" from 1 to _vehCount do {
    _vehToSpawn pushBack (selectRandom militia_vehicles);
};

if (_infsquad == "army") then {
    _vehToSpawn pushBack ([] call KPLIB_fnc_getAdaptiveVehicle);
    _vehToSpawn pushBack ([] call KPLIB_fnc_getAdaptiveVehicle);
    if ((random 100) > (33 / GRLIB_difficulty_modifier)) then {_vehToSpawn pushBack ([] call KPLIB_fnc_getAdaptiveVehicle);};
};

//Civs
_spawnCivs = [SECTOR_TYPE_BIGTOWN] call KPLIB_fnc_getCivCount;

_civsSpread = 2.5;

//Gurilla
_guerilla = [] call KPLIB_server_fnc_sector_willGuerillaSpawn;

//Garrison
_building_ai_max = round (50 * _popfactor);
_building_range = MAX_BUILDING_RANGE_LARGE;

//Other Settings
_local_capture_size = _local_capture_size * 1.4;

//IED Count
_iedCount = [2,16,2,4] call KPLIB_server_fnc_sector_getMaxIEDCount;

[
_roamingToSpawn,
_vehToSpawn,
_spawnCivs,
_guerilla,
_infsquad,
_building_ai_max,
_building_range,
_local_capture_size,
_iedcount,
_civsSpread
]
