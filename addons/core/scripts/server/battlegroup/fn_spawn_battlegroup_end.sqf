/*
    File: fn_spawn_battlegroup_end.sqf
    Authors: Violets
    Date: 2025-11-05
    Last Update: 2025-11-17
    License: GNU GENERAL PUBLIC LICENSE - https://www.gnu.org/licenses/gpl-3.0.en.html
    
    Description:
        No description added yet.
    
    Parameter(s):
        _localVariable - Description [DATATYPE, defaults to DEFAULTVALUE]
    
    Returns:
        Function reached the end [BOOL]
*/
#include "../FunctionsInclude.hpp"
#include "battlegroup_macros.hpp"

params [
    ["_pfh", objNull]
];

PFH_GETVAR(_pfh,"_bg_groups",[])
PFH_GETPARAM(_pfh,_battlegroupSize,PFH_PARAM_BATTLEGROUP_SIZE)
PFH_GETPARAM(_pfh,_spawnMarkerPos,PFH_PARAM_SPAWN_POS)

//systemChat format ["start! params: %1", _this getVariable "params"]; _test = 127;
[ format ["[BATTLEGROUP] Finishing battlegroup spawn. %1", _spawnMarkerPos] ] call KPLIB_fnc_log;

//Reduce combat readiness
[-(round (count _bg_groups + random (count _bg_groups)))] call KPLIB_fnc_addCombatReadiness;
stats_hostile_battlegroups = stats_hostile_battlegroups + 1;
{
    if (local _x) then {
        _headless_client = [] call KPLIB_fnc_getLessLoadedHC;
        if (!isNull _headless_client) then {
            _x setGroupOwner (owner _headless_client);
        };
    };
    //sleep 1;
} forEach _bg_groups;
