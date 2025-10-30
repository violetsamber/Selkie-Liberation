private _grp = _this select 0;
private _waypoint = [];
if ( isNil "reinforcements_sector_under_attack" ) then { reinforcements_sector_under_attack = "" };

while { count (units _grp) > 0 } do {

    if ( reinforcements_sector_under_attack != "" ) then {

        while {(count (waypoints _grp)) != 0} do {deleteWaypoint ((waypoints _grp) select 0);};
        {_x doFollow leader _grp} forEach units _grp;

        _waypoint = _grp addWaypoint [markerPos reinforcements_sector_under_attack, 50];
        _waypoint setWaypointType "MOVE";
        _waypoint setWaypointSpeed "FULL";
        _waypoint setWaypointBehaviour "SAFE";
        _waypoint setWaypointCombatMode "YELLOW";
        _waypoint setWaypointCompletionRadius 30;
        _waypoint = _grp addWaypoint [markerPos reinforcements_sector_under_attack, 50];
        _waypoint setWaypointSpeed "LIMITED";
        _waypoint setWaypointType "SAD";
        _waypoint = _grp addWaypoint [markerPos reinforcements_sector_under_attack, 50];
        _waypoint setWaypointSpeed "LIMITED";
        _waypoint setWaypointType "SAD";
        _waypoint = _grp addWaypoint [markerPos reinforcements_sector_under_attack, 50];
        _waypoint setWaypointSpeed "LIMITED";
        _waypoint setWaypointType "CYCLE";

        sleep 300;
    };

    if ( reinforcements_sector_under_attack == "" ) then {
        private _sectors_patrol = [];
        private _patrol_startpos = getPos (leader _grp);
        {
            if ( _patrol_startpos distance (markerPos _x) < 2500) then {
                _sectors_patrol pushBack _x;
            };
        } forEach (sectors_allSectors - blufor_sectors);

        while {waypoints _grp isNotEqualTo []} do {deleteWaypoint ((waypoints _grp) select 0);};
        {_x doFollow leader _grp} forEach units _grp;

        {
            _waypoint = _grp addWaypoint [markerPos _x, 300];
            _waypoint setWaypointType "MOVE";
            _waypoint setWaypointSpeed "NORMAL";
            _waypoint setWaypointBehaviour "SAFE";
            _waypoint setWaypointCombatMode "YELLOW";
            _waypoint setWaypointCompletionRadius 30;
        } forEach _sectors_patrol;

        _waypoint = _grp addWaypoint [_patrol_startpos, 300];
        _waypoint setWaypointType "MOVE";
        _waypoint setWaypointCompletionRadius 100;
        _waypoint = _grp addWaypoint [_patrol_startpos , 300];
        _waypoint setWaypointType "CYCLE";
    };

    waitUntil { sleep 5;(units _grp isEqualTo []) || (reinforcements_sector_under_attack != "") };
};
