
_defenders_amount = (15 * (sqrt (GRLIB_unitcap))) min 15;

_spawn_marker = [2000,999999,false] call KPLIB_fnc_getOpforSpawnPoint;
if (_spawn_marker == "") exitWith {["Could not find position for fob hunting mission", "ERROR"] call KPLIB_fnc_log;};

used_positions pushBack _spawn_marker;
_base_position = markerPos _spawn_marker;
_base_objects = [];
_base_objectives = [];
_base_defenders = [];
_base_turrets = [];
_base_object_number = 0;
_base_objective_number = 0;

([] call (compile preprocessFileLineNumbers (selectRandom KPLIB_fob_templates))) params [
    "_objects_to_build",
    "_objectives_to_build",
    "_defenders_to_build",
    "_base_corners"
];

[_base_position, 50] call KPLIB_fnc_createClearance;

private _nextobject = objNull;

{
    _x params [
        "_nextclass",
        "_nextpos",
        "_nextdir"
    ];

    _nextpos = [((_base_position select 0) + (_nextpos select 0)), ((_base_position select 1) + (_nextpos select 1)), 0];

    _nextobject = _nextclass createVehicle _nextpos;
    _nextobject allowDamage false;
    _nextobject setVectorUp [0, 0, 1];
    _nextobject setDir _nextdir;
    _nextobject setPos _nextpos;
    _nextobject setVectorUp [0, 0, 1];
    _nextobject setDir _nextdir;
    _nextobject setPos _nextpos;

    _base_objects pushBack _nextobject;
    
    if(_nextobject isKindOf "StaticWeapon") then {
        createVehicleCrew _nextobject;
    };

} forEach _objects_to_build;

sleep 1;

{
    _x params [
        "_nextclass",
        "_nextpos",
        "_nextdir"
    ];

    _nextpos = [((_base_position select 0) + (_nextpos select 0)), ((_base_position select 1) + (_nextpos select 1)), 0];

    _nextobject = _nextclass createVehicle _nextpos;
    _nextobject allowDamage false;
    _nextobject setVectorUp [0, 0, 1];
    _nextobject setPos _nextpos;
    _nextobject setDir _nextdir;
    _nextobject setVectorUp [0, 0, 1];
    _nextobject setPos _nextpos;
    _nextobject setDir _nextdir;
    _nextobject lock 2;

    _base_objectives pushBack _nextobject;

    if(_nextobject isKindOf "StaticWeapon") then {
        createVehicleCrew _nextobject;
    };

} forEach _objectives_to_build;

sleep 1;

{_x setDamage 0; _x allowDamage true;} forEach (_base_objectives + _base_objects);

_grpdefenders = createGroup [GRLIB_side_enemy, true];
_idxselected = [];

while {(count _idxselected) < _defenders_amount && (count _idxselected) < (count _defenders_to_build)} do {
    _idxselected pushBackUnique (floor (random (count _defenders_to_build)));
};

{
    (_defenders_to_build select _x) params [
        "_nextclass",
        "_nextpos",
        "_nextdir"
    ];

    _nextpos = [((_base_position select 0) + (_nextpos select 0)), ((_base_position select 1) + (_nextpos select 1)), (_nextpos select 2)];
    private _nextDefender = [_nextclass, _nextpos, _grpdefenders, "PRIVATE", 0.5] call KPLIB_fnc_createManagedUnit;
    _nextDefender setDir _nextdir;
    _nextDefender setPos _nextpos;
    [_nextDefender] spawn KPLIB_server_fnc_building_defence_ai;
} forEach _idxselected;

private _sentryMax = ceil ((3 + (floor (random 4))) * (sqrt (GRLIB_unitcap)));

_grpsentry = createGroup [GRLIB_side_enemy, true];
_base_sentry_pos = [(_base_position select 0) + ((_base_corners select 0) select 0), (_base_position select 1) + ((_base_corners select 0) select 1), 0];
for [{_idx=0}, {_idx < _sentryMax}, {_idx=_idx+1}] do {
    [opfor_sentry, _base_sentry_pos, _grpsentry, "PRIVATE", 0.5] call KPLIB_fnc_createManagedUnit;
};

while {waypoints _grpsentry isNotEqualTo []} do {deleteWaypoint ((waypoints _grpsentry) select 0);};
private _waypoint = [];
{
    _waypoint = _grpsentry addWaypoint [[((_base_position select 0) + (_x select 0)), ((_base_position select 1) + (_x select 1)), 0], -1];
    _waypoint setWaypointType "MOVE";
    _waypoint setWaypointSpeed "LIMITED";
    _waypoint setWaypointBehaviour "SAFE";
    _waypoint setWaypointCompletionRadius 5;
} forEach _base_corners;

_waypoint = _grpsentry addWaypoint [[(_base_position select 0) + ((_base_corners select 0) select 0), (_base_position select 1) + ((_base_corners select 0) select 1), 0], -1];
_waypoint setWaypointType "CYCLE";

_objectives_alive = true;

secondary_objective_position = _base_position;
secondary_objective_position_marker = [(((secondary_objective_position select 0) + 800) - random 1600), (((secondary_objective_position select 1) + 800) - random 1600), 0];
publicVariable "secondary_objective_position_marker";
sleep 1;

GRLIB_secondary_in_progress = 0; publicVariable "GRLIB_secondary_in_progress";
[2] remoteExec ["remote_call_intel"];

waitUntil {
    sleep 5;
    (_base_objectives select {alive _x}) isEqualTo []
};

[round(combat_readiness * 0.85)] call KPLIB_fnc_setCombatReadiness;

stats_secondary_objectives = stats_secondary_objectives + 1;
sleep 1;
[] spawn KPLIB_fnc_doSave;
sleep 3;

[3] remoteExec ["remote_call_intel"];

GRLIB_secondary_in_progress = -1; publicVariable "GRLIB_secondary_in_progress";
