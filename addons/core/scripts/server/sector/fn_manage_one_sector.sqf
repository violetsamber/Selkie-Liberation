/*
    File: fn_manage_one_sector.sqf
    Authors: Violets, KP Liberation Dev Team
    Date: 2025-11-01
    Last Update: 2025-11-07
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

private _managed_units = [];

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
            case 0: {
                //Spawn garrisoned ai
            };
            case 0: {
                //Spawn Squads
            };
            case 0: {
                //Spawn Vehicles
            };
            case 0: {
                //Spawn special units in specific military buildings
            };
            case 0: {
                //Spawn Civilians
            };
            case 0: {
                //Spawn IEDs
            };
            case 0: {
                //Friendly Guerilla 
            };
            case 0: {
                //Start reinforcement script
            };
            case 0: {
                //Spawn IEDs
            };
            case 0: {
                //Sector lifetime loop
            };
            case 0: {
                //Sector Taken
            };
            case 0: {
                //Sector Despawning
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

        _roamingToSpawn = []; 
        _vehToSpawn = [];
        _spawnCivs = false;
        _guerilla = false;
        _infsquad = "army";
        _building_ai_max = 0;
        _building_range = 50;
        _local_capture_size = GRLIB_capture_size;
        _iedcount = 0;

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
        "_roamingToSpawn", 
        "_vehToSpawn",
        "_spawnCivs",
        "_guerilla",
        "_infsquad",
        "_building_ai_max",
        "_building_range",
        "_local_capture_size",
        "_iedcount"
    ]
] call CBA_fnc_createPerFrameHandlerObject;
