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

params [
    ["_pfh", objNull]
];

[_pfh getVariable "_vehicle"] params [["_vehicle", objNull, [objNull]]];

//Spawn Vehicle
if (isNull _chopper_type) then {
    //Get Vehicle to spawn
    _chopper_type = selectRandom opfor_troup_transports_air;

    while {!(_chopper_type in opfor_troup_transports)} do {
        _chopper_type = selectRandom opfor_troup_transports_air;
    };

    //Spawn Vehicle
    _vehicle = createVehicle [_chopper_type, markerPos _spawnsector, [], 0, "FLY"];
    createVehicleCrew _vehicle;
    sleep 0.1;

    _pilot_group = createGroup [GRLIB_side_enemy, true];
    (crew _vehicle) joinSilent _pilot_group;

    _vehicle addMPEventHandler ["MPKilled", {_this spawn KPLIB_shared_fnc_kill_manager}];
    {_x addMPEventHandler ["MPKilled", {_this spawn KPLIB_shared_fnc_kill_manager}];} forEach (crew _vehicle);

} else {

    //Use Existing Vehicle
    _vehicle = _chopper_type;
    _pilot_group = group _vehicle;
};

[ _vehicle, _pilot_group]