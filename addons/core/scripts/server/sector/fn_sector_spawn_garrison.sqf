/*
    File: fn_sector_spawn_garrison.sqf
    Authors: Violets
    Date: 2025-11-07
    Last Update: 2025-11-14
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
PFH_GETPARAM(_pfh,_sectorMarker,PFH_PARAM_SECTOR_MARKER)

PFH_GETVAR(_pfh,"_stageWorkerIndex_0",0)
PFH_GETVAR(_pfh,"_stageWorkerIndex_1",0)
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
        } forEach _spawnBuildings;

        _spawnBuildings = _newPositions;

        [format ["Sector %1 (%2) - Spawn garrison found %3 buildings. ", (markerText _sectorMarker), _sectorMarker, (count _spawnBuildings)], "SECTORSPAWN"] call KPLIB_fnc_log;
    };

    //Nowhere to spawn so skip spawning
    if(_building_ai_max <= 0 && count _spawnBuildings <= 0) then {
        [format ["Sector %1 (%2) - No buildings found to spawn in. ", (markerText _sectorMarker), _sectorMarker], "SECTORSPAWN"] call KPLIB_fnc_log;
        _isStageFinished = true;
    }
};

//Spawn Units
if(_stageWorkerIndex_0 >= 1) then {

    //Check to see if there are any building postions left or and units left to spawn, if not exit;

    private _totalBuildingPositions = 0;
    {
        ADD(_totalBuildingPositions,count _x);
    } forEach _spawnBuildings;

    //No More positions
    if(_stageWorkerIndex_1 >= _building_ai_max || _totalBuildingPositions <= 0) exitWith {
        [format ["Sector %1 (%2) - Finished spawning.", (markerText _sectorMarker), _sectorMarker], "SECTORSPAWN"] call KPLIB_fnc_log;
        _isStageFinished = true;
    };

    private _classnames = [_infsquad] call KPLIB_fnc_getSquadComp;
    private _grp = grpNull;
    private _unit = objNull;
    private _pos = [];
    private _building = 0;
    private _currentBuildingPositions = [];

    {
        private _unitCount = count (units _x);
        private _posCount = count (_spawnBuildings select _forEachIndex);
        
        [format["Checking grp: %1 UnitCount: %2 PosCount: %3", _x,_unitCount,_posCount], "SECTORSPAWN"] call KPLIB_fnc_debugLog;

        if(_unitCount < BUILDING_SQUAD_MAX && _posCount > 0) then {
            _grp = _x;
            _building = _forEachIndex;
            [format ["Sector %1 (%2) - Picking group %3 Picking building: %4", (markerText _sectorMarker), _sectorMarker, _grp, _spawnBuildings select _building], "SECTORSPAWN"] call KPLIB_fnc_debugLog;
        };
    } forEach _garrisonedGroups;

    if(isNull _grp) then {
        _grp = createGroup [GRLIB_side_enemy, true];
        _garrisonedGroups pushBack _grp;
        [format ["Sector %1 (%2) - Creating group %3", (markerText _sectorMarker), _sectorMarker, _grp], "SECTORSPAWN"] call KPLIB_fnc_log;
    };
    
    //Get a position to spawn at and remove it
    _building = ((count _garrisonedGroups) - 1);
    _currentBuildingPositions = _spawnBuildings select _building;
    {
        if((count _x) > 0) exitWith {
            [format ["Sector %1 (%2) - Picking position: %3 in building %4", (markerText _sectorMarker), _sectorMarker, _x, _currentBuildingPositions], "SECTORSPAWN"] call KPLIB_fnc_debugLog;
            _pos = _x;
            _currentBuildingPositions deleteAt 0;
        };
    } forEach (_currentBuildingPositions);
    
    private _class = selectRandom _classnames;
    _unit = [_class, _pos, _grp] call KPLIB_fnc_createManagedUnit;
    _unit setDir (random 360);
    _unit setPos (_pos);
    [_unit, _sectorMarker] spawn KPLIB_server_fnc_building_defence_ai;
    _managed_units pushBack _unit;

    INC(_stageWorkerIndex_1);

    [format ["Sector %1 (%2) - %3 spawned at %4 into %5", (markerText _sectorMarker), _sectorMarker, _class, _pos, _grp], "SECTORSPAWN"] call KPLIB_fnc_debugLog;
};

INCREMENT(_stageWorkerIndex_0)

[
_isStageFinished,
_stageWorkerIndex_0,
_stageWorkerIndex_1,
_spawnBuildings,
_managed_units,
_garrisonedGroups,
_building_ai_max
]
