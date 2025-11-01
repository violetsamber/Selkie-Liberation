//add_civ_waypoints.sqf

private _grp = _this select 0;
private _basepos = getPos (leader _grp);

while {waypoints _grp isNotEqualTo []} do {deleteWaypoint ((waypoints _grp) select 0);};
{_x doFollow leader _grp} forEach units _grp;

private _wpPositions = [
    _basepos getPos [random 150, random 360],
    _basepos getPos [random 150, random 360],
    _basepos getPos [random 150, random 360],
    _basepos getPos [random 150, random 360],
    _basepos getPos [random 150, random 360]
];

private _waypoint = _grp addWaypoint [_wpPositions select 0, 10];
_waypoint setWaypointType "MOVE";
_waypoint setWaypointBehaviour "SAFE";
_waypoint setWaypointSpeed "LIMITED";
_waypoint setWaypointCombatMode "BLUE";
_waypoint setWaypointCompletionRadius 5;

_waypoint = _grp addWaypoint [_wpPositions select 1, 10];
_waypoint setWaypointType "MOVE";
_waypoint setWaypointBehaviour "SAFE";
_waypoint setWaypointSpeed "LIMITED";
_waypoint setWaypointCombatMode "BLUE";
_waypoint setWaypointCompletionRadius 5;

_waypoint = _grp addWaypoint [_wpPositions select 2, 10];
_waypoint setWaypointType "MOVE";
_waypoint setWaypointBehaviour "SAFE";
_waypoint setWaypointSpeed "LIMITED";
_waypoint setWaypointCombatMode "BLUE";
_waypoint setWaypointCompletionRadius 5;

_waypoint = _grp addWaypoint [_wpPositions select 3, 10];
_waypoint setWaypointType "MOVE";
_waypoint setWaypointBehaviour "SAFE";
_waypoint setWaypointSpeed "LIMITED";
_waypoint setWaypointCombatMode "BLUE";
_waypoint setWaypointCompletionRadius 5;

_waypoint = _grp addWaypoint [_wpPositions select 4, 10];
_waypoint setWaypointType "CYCLE";
_waypoint setWaypointBehaviour "SAFE";
_waypoint setWaypointSpeed "LIMITED";
_waypoint setWaypointCombatMode "BLUE";
_waypoint setWaypointCompletionRadius 5;
