/*
    File: fn_sector_spawn_garrison.sqf
    Authors: Violets
    Date: 2025-11-07
    Last Update: 2025-11-08
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

#define SQUAD_MAX 8

params [
    ["_pfh", objNull]
];

PFH_GETPARAM(_pfh,_sectorPos,PFH_PARAM_SECTOR_POS)

PFH_GETVAR(_pfh,"_stageWorkerIndex_0",0)
PFH_GETVAR(_pfh,"_building_ai_max",0)
PFH_GETVAR(_pfh,"_infsquad","")
PFH_GETVAR(_pfh,"_managed_units",[])
PFH_GETVAR(_pfh,"_spawnBuildings",[])
PFH_GETVAR(_pfh,"_garrisonedGroups",[])

private _isStageFinished = false;

//Get Buildings and thier array of positions
if(_stageWorkerIndex_0 == 0) then {

    if (_building_ai_max > 0 && GRLIB_adaptive_opfor) then {
        _building_ai_max = round (_building_ai_max * ([] call KPLIB_fnc_getOpforFactor));
    };

    if (_building_ai_max > 0) then {
        _spawnBuildings = [] call KPLIB_fnc_getBuildings;

        //Randomize positions
        private newPositions = [];
        {
            private _positionArray = _x call BIS_fnc_arrayShuffle;
            newPositions pushBack _positionArray;
        } foreach _spawnBuildings;

        _spawnBuildings = newPositions;

        [format ["Sector %1 (%2) - manage_one_sector found %3 building positions", (markerText _sector), _sector, (count _spawnBuildings)], "SECTORSPAWN"] remoteExecCall ["KPLIB_fnc_log", 2];
    };

    //Nowhere to spawn so skip spawning
    if(_building_ai_max <= 0 && count _spawnBuildings <= 0) then {
        _isStageFinished = true;
    }
};

//Spawn Units
if(_stageWorkerIndex_0 >= 1) then {

    private _classnames = [_infsquad] call KPLIB_fnc_getSquadComp;
    private _unitCount = 0;
    {
        _unitCount = _unitCount + (count units _x);
    } foreach _garrisonedGroups;

    if (_unitCount < _building_ai_max) then {
    
        //Get First group that their building is not full or squad maxed or create a new one
        private _grp = grpNull;
        private _unit = objNull;
        private _pos = [];
        {
            private _unitCount = count (units _x);
            private _posCount = count (_spawnBuildings select _forEachIndex);

            if(_unitCount <= SQUAD_MAX || _unitCount <= _posCount) then {
                _grp = _x;
            };
        } foreach _garrisonedGroups;

        if(_grp == grpNull) then {
            _grp = createGroup [GRLIB_side_enemy, true];
        };

        //Get a position to spawn at and remove it
        {
            if(count _x > 0) exitWith {
                _pos = _x select 0;
                _x deleteAt 0;
            };
        } foreach _spawnBuildings;

        //No More positions
        if(_pos isEqualTo []) exitWith {
            _isStageFinished = true;
        };

        _unit = [selectRandom _classnames, _pos, _grp] call KPLIB_fnc_createManagedUnit;
        _managed_units pushBack _unit;

    } else {
        _isStageFinished = true;
    };
};



INCREMENT(_stageWorkerIndex_0)

[
_isStageFinished,
_stageWorkerIndex_0,
_spawnBuildings,
_managed_units,
_garrisonedGroups,
_building_ai_max
]
