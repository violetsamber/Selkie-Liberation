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

params [
    ["_pfh", objNull]
];

PFH_GETPARAM(_pfh,_sectorPos,PFH_PARAM_SECTOR_POS)

PFH_GETVAR(_pfh,"_sectorMarker","")
PFH_GETVAR(_pfh,"_stageWorkerIndex_0",0)
PFH_GETVAR(_pfh,"_building_ai_max",0)
PFH_GETVAR(_pfh,"_infsquad","")
PFH_GETVAR(_pfh,"_managed_units",[])
PFH_GETVAR(_pfh,"_spawnBuildings",[])
PFH_GETVAR(_pfh,"_garrisonedGroups",[])
PFH_GETVAR(_pfh,"_building_range",0)

private _isStageFinished = false;

//Get Buildings and thier array of positions
if(_stageWorkerIndex_0 == 0) then {

    if (_building_ai_max > 0 && GRLIB_adaptive_opfor) then {
        _building_ai_max = round (_building_ai_max * ([] call KPLIB_fnc_getOpforFactor));
    };

    if (_building_ai_max > 0) then {
        _spawnBuildings = [_sectorPos,_building_range] call KPLIB_fnc_getBuildings;

        //Randomize positions
        private _newPositions = [];
        {
            private _positionArray = _x call BIS_fnc_arrayShuffle;
            _newPositions pushBack _positionArray;
        } foreach _spawnBuildings;

        _spawnBuildings = _newPositions;

        [format ["Sector %1 (%2) - Spawn garrison found %3 buildings. ", (markerText _sectorMarker), _sectorMarker, (count _spawnBuildings)], "SECTORSPAWN"] remoteExecCall ["KPLIB_fnc_log", 2];
    };

    //Nowhere to spawn so skip spawning
    if(_building_ai_max <= 0 && count _spawnBuildings <= 0) then {
        [format ["Sector %1 (%2) - No buildings found to spawn in. ", (markerText _sectorMarker), _sectorMarker], "SECTORSPAWN"] remoteExecCall ["KPLIB_fnc_log", 2];
        _isStageFinished = true;
    }
};

//Spawn Units
if(_stageWorkerIndex_0 >= 1) then {

    private _classnames = [_infsquad] call KPLIB_fnc_getSquadComp;
    private _allUnitCount = 0;
    {
        _allUnitCount = _allUnitCount + (count units _x);
    } foreach _garrisonedGroups;

    if (_allUnitCount < _building_ai_max) then {
        //Get First group that their building is not full or squad maxed or create a new one
        private _grp = grpNull;
        private _unit = objNull;
        private _pos = [];
        {
            
            private _unitCount = count (units _x);
            private _posCount = count (_spawnBuildings select _forEachIndex);
            
            [format["Checking grp: %1 UnitCount: %2 PosCount: %3", _x,_unitCount,_posCount], "SECTORSPAWN"] call KPLIB_fnc_log;

            if(_unitCount <= BUILDING_SQUAD_MAX || _unitCount <= _posCount) then {
                _grp = _x;
                [format ["Sector %1 (%2) - Picking group %3", (markerText _sectorMarker), _sectorMarker, _grp], "SECTORSPAWN"] remoteExecCall ["KPLIB_fnc_log", 2];
            };
        } foreach _garrisonedGroups;

        if(isNull _grp) then {
            _grp = createGroup [GRLIB_side_enemy, true];
            _garrisonedGroups pushBack _grp;
            [format ["Sector %1 (%2) - Creating group %3", (markerText _sectorMarker), _sectorMarker, _grp], "SECTORSPAWN"] remoteExecCall ["KPLIB_fnc_log", 2];
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

        
        private _class = selectRandom _classnames;
        _unit = [_class, _pos, _grp] call KPLIB_fnc_createManagedUnit;
        _managed_units pushBack _unit;

        [format ["Sector %1 (%2) - %3 spawned at %4 into %5", (markerText _sectorMarker), _sectorMarker, _class, _pos, _grp], "SECTORSPAWN"] remoteExecCall ["KPLIB_fnc_log", 2];

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
