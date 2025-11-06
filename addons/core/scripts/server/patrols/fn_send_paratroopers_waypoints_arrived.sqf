/*
    File: fn_send_paratroopers_waypoints_arrived.sqf
    Authors: 
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

_waypoint = _pilot_group addWaypoint [markerPos _spawnsector, 200];
_waypoint setWaypointBehaviour "CARELESS";
_waypoint setWaypointCombatMode "BLUE";
_waypoint setWaypointType "MOVE";
_waypoint setWaypointStatements ["true", "[group this] call KPLIB_fnc_deleteGroup"];
_waypoint setWaypointCompletionRadius 250;    

_waypoint = _para_group addWaypoint [_targetPos, 100];
_waypoint setWaypointType "SAD";
_waypoint = _para_group addWaypoint [_targetPos, 100];
_waypoint setWaypointType "SAD";
_waypoint = _para_group addWaypoint [_targetPos, 100];
_waypoint setWaypointType "SAD";
_waypoint = _para_group addWaypoint [_targetPos, 100];
_waypoint setWaypointType "SAD";
_waypoint = _para_group addWaypoint [_targetPos, 100];
_waypoint setWaypointType "SAD";
_pilot_group setCurrentWaypoint [_para_group, 1];

[_para_group, 500, 15] spawn lambs_wp_fnc_taskRush;