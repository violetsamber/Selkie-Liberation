/*
    File: fn_manage_one_sector.sqf
    Authors: Violets, KP Liberation Dev Team
    Date: 2025-11-01
    Last Update: 2025-11-08
    License: MIT License - http://www.opensource.org/licenses/MIT
    
    Description:
        No description added yet.
    
    Parameter(s):
        _localVariable - Description [DATATYPE, defaults to DEFAULTVALUE]
    
    Returns:
        Function reached the end [BOOL]
*/

#include "../FunctionsInclude.hpp"
#include "sector_macros.hpp"

params ["_sectorMarker"];

private _sectorPos = markerPos _sectorMarker;


private _sector_despawn_tickets = BASE_TICKETS;
private _maximum_additional_tickets = (KP_liberation_delayDespawnMax * 60 / SECTOR_TICK_TIME);
private _popfactor = 1;

if (GRLIB_unitcap < 1) then {_popfactor = GRLIB_unitcap;};

//This should be initialized at the start now
// waitUntil {!isNil "SLKLIB_combat_readiness"};

//If already active dont activate again;
if (_sector in active_sectors) exitWith {
    [format ["Sector %1 (%2) WAS ALREADY ACTIVE - Managed on: %3", (markerText _sector), _sector, debug_source], "SECTORSPAWN"] remoteExecCall ["KPLIB_fnc_log", 2];
};

//Activate sector
active_sectors pushBack _sector; publicVariable "active_sectors"; //TODO Change this to a function call
[format ["Sector %1 (%2) activated - Managed on: %3", (markerText _sector), _sector, debug_source], "SECTORSPAWN"] remoteExecCall ["KPLIB_fnc_log", 2];

//Check if we can active
private _opforcount = [] call KPLIB_fnc_getOpforCap;
private _isSectorNotBlufor = !(_sector in blufor_sectors);
private _isThereAnyBlueforUnitsInSector = (([markerPos _sector, [_opforcount] call KPLIB_fnc_getSectorRange, GRLIB_side_friendly] call KPLIB_fnc_getUnitsCount) > 0);

if (_isSectorNotBlufor && _isThereAnyBlueforUnitsInSector) then 
{
    //Spawn
    //Run!
} else {
    //Deactivate!
    sleep 40;
    
};

[
    {
        //Update
        private _return = [];

        switch (_stageIndex) do
        {
            case 0: {
                //Wait To Spawn
                _return = [_sectorMarker, _opforcount] call KPLIB_server_fnc_sector_wait_to_spawn;

                if(_isStageFinished) then {
                    _stageWorkerIndex_0 = 0;
                    _stageWorkerIndex_1 = 0;
                    _isStageFinished = false;
                    INCREMENT(_stageIndex)
                }
            };
            case 1: {
                //Bigtown
                if (_sectorMarker in sectors_bigtown) then {
                    _return = [_this] call KPLIB_server_fnc_sector_setup_bigtown;
                };

                //Smalltown
                if (_sectorMarker in sectors_capture) then {
                    _return = [_this] call KPLIB_server_fnc_sector_setup_town;
                };

                //Military
                if (_sectorMarker in sectors_military) then {
                    _return = [_this] call KPLIB_server_fnc_sector_setup_military;
                };

                //Factory
                if (_sectorMarker in sectors_factory) then {
                    _return = [_this] call KPLIB_server_fnc_sector_setup_factory;
                };

                //Tower
                if (_sectorMarker in sectors_tower) then {
                    _return = [_this] call KPLIB_server_fnc_sector_setup_tower;
                };

                _roamingToSpawn =     _return select 0;
                _vehToSpawn =         _return select 1;
                _spawnCivs =          _return select 2;
                _guerilla =           _return select 3;
                _infsquad=            _return select 4;
                _building_ai_max =    _return select 5;
                _building_range =     _return select 6;
                _local_capture_size = _return select 7;
                _iedcount =           _return select 8;

                INCREMENT(_stageIndex)
            };
            case 2: {
                //Spawn garrisoned ai

                _return = [_this] call KPLIB_server_fnc_sector_spawn_garrison;

                _isStageFinished = _return select 0;
                _stageWorkerIndex_0 = _return select 1;
                _spawnBuildings = _return select 2;
                _managed_units = _return select 3;
                _garrisonedGroups = _return select 4;
                _building_ai_max = _return select 5;

                if(_isStageFinished) then {
                    _stageWorkerIndex_0 = 0;
                    _stageWorkerIndex_1 = 0;
                    _isStageFinished = false;
                    INCREMENT(_stageIndex)
                };
            };
            case 3: {
                //Spawn Squads
                INCREMENT(_stageIndex)
            };
            case 4: {
                //Spawn Vehicles
                INCREMENT(_stageIndex)
            };
            case 5: {
                //Spawn special units in specific military buildings
                INCREMENT(_stageIndex)
            };
            case 6: {
                //Spawn Civilians
                INCREMENT(_stageIndex)
            };
            case 7: {
                //Spawn IEDs
                INCREMENT(_stageIndex)
            };
            case 8: {
                //Friendly Guerilla
                INCREMENT(_stageIndex) 
            };
            case 9: {
                //Start reinforcement script
                INCREMENT(_stageIndex)
            };
            case 10: {
                //Spawn IEDs
                INCREMENT(_stageIndex)
            };
            case 11: {
                //Sector lifetime loop
                INCREMENT(_stageIndex)
            };
            case 12: {
                //Sector Taken
                INCREMENT(_stageIndex)
            };
            case 13: {
                //Sector Despawning
                INCREMENT(_stageIndex)
            };
            default {
                _isFinished = true;
            };
        };
        
    },
    PFH_UPDATE_TIME,
    [_sectorMarker, _sectorPos],
    {
        //Start
        _isFinished = false;
        _isStageFinished = false;
        _stageIndex = 0;
        _stageWorkerIndex_0 = 0;
        _stageWorkerIndex_1 = 0;

        _roamingToSpawn = []; 
        _vehToSpawn = [];
        _spawnCivs = false;
        _guerilla = false;
        _infsquad = "army";
        _building_ai_max = 0;
        _building_range = 50;
        _local_capture_size = GRLIB_capture_size;
        _iedcount = 0;

        _spawnBuildings = [];
        _managed_units = [];

        //Spawned
        _roamingGroups = [];
        _garrisonedGroups = [];
        _civsGroups = [];
        _vehGroups = [];
    },
    {
        //End
        [format ["Sector %1 (%2) deactivated - Was managed on: %3", (markerText _sector), _sector, debug_source], "SECTORSPAWN"] remoteExecCall ["KPLIB_fnc_log", 2];
        active_sectors = active_sectors - [_sector]; publicVariable "active_sectors";
    },
    {
        //Can Run 
        !_isFinished 
    },
    {
        //Can Exit
        _isFinished 
    },
    [
        "_isFinished", 
        "_isStageFinished", 
        "_stageIndex",
        "_stageWorkerIndex_0",
        "_stageWorkerIndex_1",
        "_roamingToSpawn", 
        "_vehToSpawn",
        "_spawnCivs",
        "_guerilla",
        "_infsquad",
        "_building_ai_max",
        "_building_range",
        "_local_capture_size",
        "_iedcount",
        "_spawnBuildings",
        "_managed_units"
    ]
] call CBA_fnc_createPerFrameHandlerObject;
