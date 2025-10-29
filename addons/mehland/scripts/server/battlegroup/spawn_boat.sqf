params ["_first_objective"];

if (opfor_boat isEqualTo []) exitWith {false};

private _boats_number = ((floor linearConversion [40, 100, combat_readiness, 1, 3]) min 3) max 0;

if (_boats_number < 1) exitWith {};

private _class = selectRandom opfor_boat;
private _spawnPoint = ([sectors_boatspawn, [_first_objective], {(markerPos _x) distance _input0}, "ASCEND"] call BIS_fnc_sortBy) select 0;
private _spawnPos = [];
private _boat = objNull;
private _grp = createGroup [GRLIB_side_enemy, true];

for "_i" from 1 to _boats_number do {
    _spawnPos = markerPos _spawnPoint;
    _spawnPos = [(((_spawnPos select 0) + 5) - random 1), (((_spawnPos select 1) + 5) - random 1), 2];
    _boat = createVehicle [_class, _spawnPos, [], 0, "NONE"];
    createVehicleCrew _boat;
    _boat addMPEventHandler ["MPKilled", {_this spawn kill_manager}];
    [_boat] call KPLIB_fnc_addObjectInit;
    {_x addMPEventHandler ["MPKilled", {_this spawn kill_manager}];} forEach (crew _boat);
    (crew _boat) joinSilent _grp;
    sleep 1;
};

while {!((waypoints _grp) isEqualTo [])} do {deleteWaypoint ((waypoints _grp) select 0);};
sleep 1;
{_x doFollow leader _grp} forEach (units _grp);
sleep 1;

private _waypoint = _grp addWaypoint [_first_objective, 500];
_waypoint setWaypointType "MOVE";
_waypoint setWaypointSpeed "FULL";
_waypoint setWaypointBehaviour "AWARE";
_waypoint setWaypointCombatMode "RED";

_waypoint = _grp addWaypoint [_first_objective, 500];
_waypoint setWaypointType "MOVE";
_waypoint setWaypointSpeed "FULL";
_waypoint setWaypointBehaviour "AWARE";
_waypoint setWaypointCombatMode "RED";

_waypoint = _grp addWaypoint [_first_objective, 500];
_waypoint setWaypointType "MOVE";
_waypoint setWaypointSpeed "FULL";
_waypoint setWaypointBehaviour "AWARE";
_waypoint setWaypointCombatMode "RED";

for "_i" from 1 to 6 do {
    _waypoint = _grp addWaypoint [_first_objective, 500];
    _waypoint setWaypointType "SAD";
};

_waypoint = _grp addWaypoint [_first_objective, 500];
_waypoint setWaypointType "CYCLE";

_grp setCurrentWaypoint [_grp, 2];
