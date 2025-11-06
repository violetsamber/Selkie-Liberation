/*
    File: fn_battlegroup_ai.sqf
    Authors: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2025-11-01
    Last Update: 2025-11-05
    License: MIT License - http://www.opensource.org/licenses/MIT
    
    Description:
        No description added yet.
    
    Parameter(s):
        _localVariable - Description [DATATYPE, defaults to DEFAULTVALUE]
    
    Returns:
        Function reached the end [BOOL]
*/


params [
    ["_grp", grpNull, [grpNull]]
];

if (isNull _grp) exitWith {};

private _objPos = [getPos (leader _grp)] call KPLIB_fnc_getNearestBluforObjective;
private _startpos = getPos (leader _grp);

private _waypoint = [];
{ deleteWaypoint _x } forEachReversed waypoints _grp;
{_x doFollow leader _grp} forEach units _grp;

_startpos = getPos (leader _grp);

_waypoint = _grp addWaypoint [_objPos, 100];
_waypoint setWaypointType "MOVE";
_waypoint setWaypointSpeed "NORMAL";
_waypoint setWaypointBehaviour "AWARE";
_waypoint setWaypointCombatMode "YELLOW";
_waypoint setWaypointCompletionRadius 30;

_waypoint = _grp addWaypoint [_objPos, 100];
_waypoint setWaypointType "SAD";
_waypoint = _grp addWaypoint [_objPos, 100];
_waypoint setWaypointType "SAD";
_waypoint = _grp addWaypoint [_objPos, 100];
_waypoint setWaypointType "SAD";
_waypoint = _grp addWaypoint [_objPos, 100];
_waypoint setWaypointType "CYCLE";
