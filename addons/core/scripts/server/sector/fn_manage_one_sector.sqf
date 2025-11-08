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

params ["_sector"];

private _sectorpos = markerPos _sector;
private _isSectorActive = true;
private _spawncivs = false;
private _building_ai_max = 0;
private _infsquad = "army";
private _building_range = 50;
private _local_capture_size = GRLIB_capture_size;
private _iedcount = 0;

private _managed_units = [];

private _vehtospawn = [];

private _roamingSquads = [];
private _garrisonedSquads = [];

private _sector_despawn_tickets = BASE_TICKETS;
private _maximum_additional_tickets = (KP_liberation_delayDespawnMax * 60 / SECTOR_TICK_TIME);
private _popfactor = 1;
private _guerilla = false;

if (GRLIB_unitcap < 1) then {_popfactor = GRLIB_unitcap;};

//This should be initialized at the start now
// waitUntil {!isNil "SLKLIB_combat_readiness"};

//If already active dont activate again;
if (_sector in active_sectors) exitWith {
    [format ["Sector %1 (%2) WAS ALREADY ACTIVE - Managed on: %3", (markerText _sector), _sector, debug_source], "SECTORSPAWN"] remoteExecCall ["KPLIB_fnc_log", 2];
};

//Activate sector
active_sectors pushBack _sector; publicVariable "active_sectors";
[format ["Sector %1 (%2) activated - Managed on: %3", (markerText _sector), _sector, debug_source], "SECTORSPAWN"] remoteExecCall ["KPLIB_fnc_log", 2];


//Wait to spawn
private _opforcount = [] call KPLIB_fnc_getOpforCap;
[_sector, _opforcount] call KPLIB_server_fnc_wait_to_spawn_sector;


//Check if we can active
private _isSectorNotBlufor = !(_sector in blufor_sectors);
private _isThereAnyBlueforUnitsInSector = (([markerPos _sector, [_opforcount] call KPLIB_fnc_getSectorRange, GRLIB_side_friendly] call KPLIB_fnc_getUnitsCount) > 0);

if (_isSectorNotBlufor && _isThereAnyBlueforUnitsInSector) then 
{
    //Spawn
    //Run!

} else {
    //Deactivate!
    sleep 40;
    active_sectors = active_sectors - [_sector]; publicVariable "active_sectors";
};

[format ["Sector %1 (%2) deactivated - Was managed on: %3", (markerText _sector), _sector, debug_source], "SECTORSPAWN"] remoteExecCall ["KPLIB_fnc_log", 2];

    //Bigtown
    if (_sector in sectors_bigtown) then {

    };

    //Capture
    if (_sector in sectors_capture) then {

    };

    //Military
    if (_sector in sectors_military) then {

    };

    //Factory
    if (_sector in sectors_factory) then {

    };

    //Tower
    if (_sector in sectors_tower) then {

    };

    
    //DEBUG LOG
    //if (KP_liberation_sectorspawn_debug > 0) then {[format ["Sector %1 (%2) - manage_one_sector calculated -> _infsquad: %3 - _squad1: %4 - _squad2: %5 - _squad3: %6 - _squad4: %7 - _vehtospawn: %8 - _building_ai_max: %9 _squad10: %10 _squad11: %11 _squad12: %12 _squad13: %13 ", (markerText _sector), _sector, _infsquad, (count _squad1), (count _squad2), (count _squad3), (count _squad4), (count _vehtospawn), _building_ai_max, (count _squad10), (count _squad11), (count _squad12), (count _squad13)], "SECTORSPAWN"] remoteExecCall ["KPLIB_fnc_log", 2];};

    //Spawn Vehicles
    //Spawn garrisoned ai
    //Spawn special units in specific military buildings
    //Spawn Squads
    //Spawn Civilians
    //Spawn IEDs
    //Friendly Guerilla

    sleep 10;

    //Start reinforcement script


    //DEBUG LOG
    if (KP_liberation_sectorspawn_debug > 0) then {[format ["Sector %1 (%2) - populating done", (markerText _sector), _sector], "SECTORSPAWN"] remoteExecCall ["KPLIB_fnc_log", 2];};

    // private _activationTime = time;
    //Sector lifetime loop

