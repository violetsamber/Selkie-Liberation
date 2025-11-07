/*
    File: fn_send_paratroopers_spawn_vehicle.sqf
    Authors: Violets
    Date: 2025-11-06
    Last Update: 2025-11-06
    License: GNU GENERAL PUBLIC LICENSE - https://www.gnu.org/licenses/gpl-3.0.en.html
    
    Description:
        No description added yet.
    
    Parameter(s):
        _localVariable - Description [DATATYPE, defaults to DEFAULTVALUE]
    
    Returns:
        Function reached the end [BOOL]
*/

#include "../FunctionsInclude.hpp"
#include "send_paratroopers_macros.hpp"

params [
    ["_pfh", objNull]
];

PFH_GETVAR(_pfh,"_vehicle",objNull)

PFH_GETPARAM(_pfh,_spawnPos,PARA_VAR_SPAWN_POS)

private _pilot_group = grpNull;

if (isNull _vehicle) then {
    
    //Get Vehicle to spawn
    private _vehicleType = selectRandom opfor_troup_transports_air;

    //Spawn Vehicle
    _vehicle = createVehicle [_vehicleType, _spawnPos, [], 0, "FLY"];
    createVehicleCrew _vehicle;

    //Get Pilot Group
    _pilot_group = createGroup [GRLIB_side_enemy, true];
    (crew _vehicle) joinSilent _pilot_group;

    _vehicle addMPEventHandler ["MPKilled", {_this spawn KPLIB_shared_fnc_kill_manager}];
    {_x addMPEventHandler ["MPKilled", {_this spawn KPLIB_shared_fnc_kill_manager}];} forEach (crew _vehicle);

} else {
    //Use Existing Vehicle
    _pilot_group = group _vehicle;
};

[ _vehicle, _pilot_group]
