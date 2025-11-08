/*
    File: fn_sector_setup_bigtown.sqf
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

#define SECTOR_MIN_SQUAD_COUNT 6
#define SECTOR_MIN_VIC_COUNT 2

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

//PFH_GETPARAM(_pfh,_spawnPos,PARA_VAR_SPAWN_POS)

//Squads
if (SLKLIB_combat_readiness < 30) then {_infsquad = "militia";};

private _squadCount = SECTOR_MIN_SQUAD_COUNT; 

if (GRLIB_unitcap >= 1) then { INCREMENT(_squadCount) };
if (GRLIB_unitcap >= 1.5) then { INCREMENT(_squadCount) };

for "_i" from 1 to _squadCount do {
    private _squadComp = [_infsquad] call KPLIB_fnc_getSquadComp;
    _roamingToSpawn pushBack _squadComp;
};

//Vehicles

private _vehCount = SECTOR_MIN_VIC_COUNT;

if ((random 100) > (66 / GRLIB_difficulty_modifier)) then { INCREMENT(_vehCount) };
if ((random 100) > (50 / GRLIB_difficulty_modifier)) then { INCREMENT(_vehCount) };

for "_i" from 1 to _squadCount do {
    private _vehicleType = selectRandom militia_vehicles;
    _vehToSpawn pushBack _vehicleType;
};

if (_infsquad == "army") then {
    _vehToSpawn pushBack ([] call KPLIB_fnc_getAdaptiveVehicle);
    _vehToSpawn pushBack ([] call KPLIB_fnc_getAdaptiveVehicle);
    if ((random 100) > (33 / GRLIB_difficulty_modifier)) then {_vehToSpawn pushBack ([] call KPLIB_fnc_getAdaptiveVehicle);};
};

//Civs
_spawnCivs = true;

//Gurilla
if (((random 100) <= KP_liberation_resistance_sector_chance) && (([] call KPLIB_fnc_crGetMulti) > 0)) then {
    _guerilla = true;
};

//Garrison
_building_ai_max = round (50 * _popfactor);
_building_range = MAX_BUILDING_RANGE_LARGE;

//Other Settings
_local_capture_size = _local_capture_size * 1.4;

//IED Count
if (KP_liberation_civ_rep < 0) then {
    _iedcount = round (2 + (ceil (random 4)) * (round ((KP_liberation_civ_rep * -1) / 33)) * GRLIB_difficulty_modifier);
} else {
    _iedcount = 0;
};
if (_iedcount > 16) then {_iedcount = 16};


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