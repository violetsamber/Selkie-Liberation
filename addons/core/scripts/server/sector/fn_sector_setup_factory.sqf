/*
    File: fn_sector_setup_factory.sqf
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

#define SECTOR_MIN_SQUAD_COUNT 5
#define SECTOR_MIN_VIC_COUNT 0

#define READINESS_FOR_ARMY 40

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

if (SLKLIB_combat_readiness < 40) then {_infsquad = "militia";};

//Squads

private _squadCount = SECTOR_MIN_SQUAD_COUNT; 

if (GRLIB_unitcap >= 1.25) then { INCREMENT(_squadCount) };

for "_i" from 1 to _squadCount do {
    _roamingToSpawn pushBack [_infsquad] call KPLIB_fnc_getSquadComp;
};


//Vehicles

private _vehCount = SECTOR_MIN_VIC_COUNT;

if ((random 100) > 66) then { INCREMENT(_vehCount) };
if ((random 100) > 33) then { INCREMENT(_vehCount) };
if ((random 100) > 33) then { INCREMENT(_vehCount) };

for "_i" from 1 to _vehCount do {
    _vehToSpawn pushBack selectRandom militia_vehicles;
};

//Civs
//TODO have a lower civ pop at night and have them be indoors
_spawnCivs = [SECTOR_TYPE_FACTORY] call KPLIB_fnc_getCivCount;

//Gurilla
_guerilla = [] call KPLIB_server_fnc_sector_willGuerillaSpawn;

//Garrison
//TODO Change whatever the fuck this calculation is 
_building_ai_max = round ((floor (18 + (round (SLKLIB_combat_readiness / 10 )))) * _popfactor);
_building_range = MAX_BUILDING_RANGE_STANDARD;

//IED Count
_iedCount = [1,8,0,3] call KPLIB_server_fnc_sector_getMaxIEDCount;

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
