/*
    File: fn_send_paratroopers_waypoints_fly.sqf
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
#include "send_paratroopers_macros.hpp"

params [
    ["_pfh", objNull]
];

PFH_GETVAR(_pfh,"_para_group",grpNull)
PFH_GETVAR(_pfh,"_pilot_group",grpNull)

PFH_GETPARAM(_pfh,_targetPos,PARA_VAR_TARGET_POS)

_waypoint = _pilot_group addWaypoint [_targetPos, 25];
_waypoint setWaypointType "MOVE";
_waypoint setWaypointSpeed "FULL";
_waypoint setWaypointBehaviour "CARELESS";
_waypoint setWaypointCombatMode "BLUE";
_waypoint setWaypointCompletionRadius 100;

_waypoint = _pilot_group addWaypoint [_targetPos, 25];
_waypoint setWaypointType "MOVE";
_waypoint setWaypointSpeed "FULL";
_waypoint setWaypointBehaviour "CARELESS";
_waypoint setWaypointCombatMode "BLUE";
_waypoint setWaypointCompletionRadius 100;

_waypoint = _pilot_group addWaypoint [_targetPos, 700];
_waypoint setWaypointType "MOVE";
_waypoint setWaypointCompletionRadius 100;

_waypoint = _pilot_group addWaypoint [_targetPos, 700];
_waypoint setWaypointType "MOVE";
_waypoint setWaypointCompletionRadius 100;

_waypoint = _pilot_group addWaypoint [_targetPos, 700];
_waypoint setWaypointType "MOVE";
_waypoint setWaypointCompletionRadius 100;

_pilot_group setCurrentWaypoint [_pilot_group, 1];

_waypoint = _para_group addWaypoint [_targetPos, 100];
_waypoint setWaypointType "MOVE";
_waypoint setWaypointSpeed "NORMAL";
_waypoint setWaypointBehaviour "COMBAT";
_waypoint setWaypointCombatMode "YELLOW";
_waypoint setWaypointCompletionRadius 50;
_waypoint = _para_group addWaypoint [_targetPos, 100];
_waypoint setWaypointType "MOVE";
_waypoint setWaypointCompletionRadius 50;
_pilot_group setCurrentWaypoint [_para_group, 1];

_vehicle flyInHeight 100;
