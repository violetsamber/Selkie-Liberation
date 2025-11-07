/*
    File: fn_send_paratroopers_spawn_vehicle.sqf
    Authors: Violets
    Date: 2025-11-06
    Last Update: 2025-11-06
    License: MIT License - http://www.opensource.org/licenses/MIT
    
    Description:
        No description added yet.
    
    Parameter(s):
        _localVariable - Description [DATATYPE, defaults to DEFAULTVALUE]
    
    Returns:
        Function reached the end [BOOL]
*/

#include "../FunctionsInclude.hpp"

params [
    ["_pfh", objNull]
];

PFH_GETVAR(_pfh,"_vehicle",objNull)

private _pilot_group = grpNull;

if (isNull _vehicle) then {
    
    //Get Vehicle to spawn
    private _vehicleType = selectRandom opfor_troup_transports_air;

    //Spawn Vehicle
    _vehicle = createVehicle [_vehicleType, markerPos _spawnsector, [], 0, "FLY"];
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
