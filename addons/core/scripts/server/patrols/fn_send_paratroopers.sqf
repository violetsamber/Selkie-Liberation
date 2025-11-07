/*
    File: fn_send_paratroopers.sqf
    Authors: Violets
    Date: 2025-11-01
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
    ["_targetsector", "", ["",[]]],
    ["_vehicle", objNull, [objNull]]
];

if (_targetsector isEqualTo "" || opfor_choppers isEqualTo []) exitWith {false};

private _targetPos = _targetsector;
if (_targetPos isEqualType "") then {
    _targetPos = markerPos _targetsector;
};

private _spawnSector = ([sectors_airspawn, [_targetPos], {(markerPos _x) distance _input0}, "ASCEND"] call BIS_fnc_sortBy) select 0;
private _spawnPos = markerPos _spawnsector;

_targetPos = [_targetPos, 100] call KPLIB_fnc_getRandomPointInCircle;

// private _newvehicle = objNull;
// private _pilot_group = grpNull;


/*
spawn_vehicle
spawn_troops

clear_waypoints para_group
clear_waypoints cargo_group

add_waypoints_flyTo
waitUntilAtTarget
cargoGetOut

clear_waypoints para_group
clear_waypoints cargo_group

add_waypoints_arrived
*/

[
    {
        //Update
        private _return = [];

        switch (_stageIndex) do
        {
            case 0: { 
                _return = [_this] call KPLIB_server_fnc_send_paratroopers_spawn_vehicle; 
                _vehicle = _return select 0;
                _pilot_group = _return select 1;
                INCREMENT(_stageIndex)
            };
            case 1: { 
                _return = [_this] call KPLIB_server_fnc_send_paratroopers_spawn_troops;  
                _stageIndex = _return select 0;
                _para_group = _return select 1;
            };
            case 2: {
                [_pilot_group] call KPLIB_server_fnc_clearGrpWaypoints;
                [_para_group]  call KPLIB_server_fnc_clearGrpWaypoints;
                _vehicle flyInHeight 100;
                INCREMENT(_stageIndex)
            };
            case 3: { 
                _return = [_this] call KPLIB_server_fnc_send_paratroopers_waypoints_flyTo;
                _stageIndex         = _return select 0;
                _stageWorkerIndex_0 = _return select 1;
            };
            case 4: { 
                _return = [_this] call KPLIB_server_fnc_send_paratroopers_waitUntilAtTarget;
                _stageIndex = _return select 0;
            };
            case 5: { 
                [_this] call KPLIB_server_fnc_send_paratroopers_cargoGetOut;
                INCREMENT(_stageIndex)
            };
            case 6: {
                [_pilot_group] call KPLIB_server_fnc_clearGrpWaypoints;
                [_para_group]  call KPLIB_server_fnc_clearGrpWaypoints;
                _vehicle flyInHeight 100;
                INCREMENT(_stageIndex)
            };
            case 7: {
                _return = [_this] call KPLIB_server_fnc_send_paratroopers_waypoints_arrived;
            };
        };

        if (_stageIndex >= 8) then {
            _isFinished = true;
        };
    },
    0.5,
    [_targetsector, _targetPos, _spawnSector, _spawnPos, _vehicle],
    {
        //Start
        _isFinished = false;
        _isStageFinished = false;
        _stageIndex = 0;
        _stageWorkerIndex_0 = 0;
        _vehicle = _this getVariable "params" select 4;
        _pilot_group = grpNull;
        _para_group = grpNull;
        _maxCargo = 0;

    },
    {
        //End
    },
    {
        //Can Run 
        !_isFinished 
    },
    {
        //Can Exit
        _isFinished 
    },
    ["_isFinished", "_stageIndex", "_isStageFinished", "_stageWorkerIndex_0", "_vehicle", "_pilot_group", "_para_group", "_maxCargo"]
] call CBA_fnc_createPerFrameHandlerObject;

// //Spawn Vehicle
// if (isNull _chopper_type) then {
//     //Get Vehicle to spawn
//     _chopper_type = selectRandom opfor_troup_transports_air;

//     while {!(_chopper_type in opfor_troup_transports)} do {
//         _chopper_type = selectRandom opfor_troup_transports_air;
//     };

//     //Spawn Vehicle
//     _newvehicle = createVehicle [_chopper_type, markerPos _spawnsector, [], 0, "FLY"];
//     createVehicleCrew _newvehicle;
//     sleep 0.1;

//     _pilot_group = createGroup [GRLIB_side_enemy, true];
//     (crew _newvehicle) joinSilent _pilot_group;

//     _newvehicle addMPEventHandler ["MPKilled", {_this spawn KPLIB_shared_fnc_kill_manager}];
//     {_x addMPEventHandler ["MPKilled", {_this spawn KPLIB_shared_fnc_kill_manager}];} forEach (crew _newvehicle);

// } else {

//     //Use Existing Vehicle
//     _newvehicle = _chopper_type;
//     _pilot_group = group _newvehicle;
// };

// //Create paratroopers
// private _para_group = createGroup [GRLIB_side_enemy, true];
// private _maxCargo = count fullCrew [_newvehicle, "cargo", true];

// while {(count (units _para_group)) < _maxCargo} do {
//     [opfor_paratrooper, markerPos _spawnsector, _para_group] call KPLIB_fnc_createManagedUnit;
// };

// {removeBackpack _x; _x addBackpack "B_parachute"; _x moveInCargo _newvehicle;} forEach (units _para_group);

// //Delete waypoints
// //fn_send_paratroopers_deleteWaypoints

// while {waypoints _pilot_group isNotEqualTo []} do {deleteWaypoint ((waypoints _pilot_group) select 0);};
// while {waypoints _para_group isNotEqualTo []} do {deleteWaypoint ((waypoints _para_group) select 0);};
// {_x doFollow leader _pilot_group} forEach units _pilot_group;
// {_x doFollow leader _para_group} forEach units _para_group;
// _newvehicle flyInHeight 100;

// //Create waypoints
// _waypoint = _pilot_group addWaypoint [_targetPos, 25];
// _waypoint setWaypointType "MOVE";
// _waypoint setWaypointSpeed "FULL";
// _waypoint setWaypointBehaviour "CARELESS";
// _waypoint setWaypointCombatMode "BLUE";
// _waypoint setWaypointCompletionRadius 100;
// _waypoint = _pilot_group addWaypoint [_targetPos, 25];
// _waypoint setWaypointType "MOVE";
// _waypoint setWaypointSpeed "FULL";
// _waypoint setWaypointBehaviour "CARELESS";
// _waypoint setWaypointCombatMode "BLUE";
// _waypoint setWaypointCompletionRadius 100;
// _waypoint = _pilot_group addWaypoint [_targetPos, 700];
// _waypoint setWaypointType "MOVE";
// _waypoint setWaypointCompletionRadius 100;
// _waypoint = _pilot_group addWaypoint [_targetPos, 700];
// _waypoint setWaypointType "MOVE";
// _waypoint setWaypointCompletionRadius 100;
// _waypoint = _pilot_group addWaypoint [_targetPos, 700];
// _waypoint setWaypointType "MOVE";
// _waypoint setWaypointCompletionRadius 100;
// _pilot_group setCurrentWaypoint [_pilot_group, 1];

// _waypoint = _para_group addWaypoint [_targetPos, 100];
// _waypoint setWaypointType "MOVE";
// _waypoint setWaypointSpeed "NORMAL";
// _waypoint setWaypointBehaviour "COMBAT";
// _waypoint setWaypointCombatMode "YELLOW";
// _waypoint setWaypointCompletionRadius 50;
// _waypoint = _para_group addWaypoint [_targetPos, 100];
// _waypoint setWaypointType "MOVE";
// _waypoint setWaypointCompletionRadius 50;
// _pilot_group setCurrentWaypoint [_para_group, 1];

// _newvehicle flyInHeight 100;

// //Wait until at the objective or damaged
// waitUntil {sleep 1;
//     !(alive _newvehicle) || (damage _newvehicle > 0.4 ) || (_newvehicle distance _targetPos < 400)
// };

// _newvehicle flyInHeight 100;

// {
//     unassignVehicle _x;
//     moveOut _x;
//     sleep 0.5;
// } forEach (units _para_group);

// _newvehicle flyInHeight 100;

// //Clear Waypoints
// //fn_send_paratroopers_deleteWaypoints

// while {waypoints _pilot_group isNotEqualTo []} do {deleteWaypoint ((waypoints _pilot_group) select 0);};
// while {waypoints _para_group isNotEqualTo []} do {deleteWaypoint ((waypoints _para_group) select 0);};
// {_x doFollow leader _pilot_group} forEach units _pilot_group;
// {_x doFollow leader _para_group} forEach units _para_group;

// _newvehicle flyInHeight 100;

// // [_pilot_group, markerPos _spawnsector, 200, "MOVE", "CARELESS", "FULL", "STAG COLUMN", "this spawn "]

// //Add Waypoints
// _waypoint = _pilot_group addWaypoint [markerPos _spawnsector, 200];
// _waypoint setWaypointBehaviour "CARELESS";
// _waypoint setWaypointCombatMode "BLUE";
// _waypoint setWaypointType "MOVE";
// _waypoint setWaypointStatements ["true", "[group this] call KPLIB_fnc_deleteGroup"];
// _waypoint setWaypointCompletionRadius 250;    

// _waypoint = _para_group addWaypoint [_targetPos, 100];
// _waypoint setWaypointType "SAD";
// _waypoint = _para_group addWaypoint [_targetPos, 100];
// _waypoint setWaypointType "SAD";
// _waypoint = _para_group addWaypoint [_targetPos, 100];
// _waypoint setWaypointType "SAD";
// _waypoint = _para_group addWaypoint [_targetPos, 100];
// _waypoint setWaypointType "SAD";
// _waypoint = _para_group addWaypoint [_targetPos, 100];
// _waypoint setWaypointType "SAD";
// _pilot_group setCurrentWaypoint [_para_group, 1];

// [_para_group, 500, 15] spawn lambs_wp_fnc_taskRush;
