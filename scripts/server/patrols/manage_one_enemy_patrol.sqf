private [ "_spawnsector", "_grp", "_usable_sectors", "_spawntype", "_enemyNumber", "_vehdriver", "_spawnpos", "_spawnDir", "_enemyVic", "_sectors_patrol",
        "_patrol_startpos", "_waypoint", "_grpspeed", "_sectors_patrol_random", "_sectorcount", "_nextsector", "_nearestroad", "_seatCount", "_vicClassName", "_roadInfo", "_vicUnit", "_cargoIndex" ];

_enemyVic = objNull;

sleep (150 + (random 150));
_spawnsector = "";

if ( isNil "active_sectors" ) then { active_sectors = [] };

while { GRLIB_endgame == 0 } do {

    _spawnsector = "";
    _usable_sectors = [];
    {
        if ((([markerPos _x, 1000, GRLIB_side_enemy] call KPLIB_fnc_getUnitsCount) == 0) && (count ([markerPos _x, 3500] call KPLIB_fnc_getNearbyPlayers) > 0)) then {
            _usable_sectors pushback _x;
        }

    } foreach ((sectors_bigtown + sectors_capture + sectors_factory) - (active_sectors));

    if ( count _usable_sectors > 0 ) then {
        _spawnsector = selectRandom _usable_sectors;

        _grp = createGroup [GRLIB_side_enemy, true];
        if ( random 100 < 33) then {
            _enemyNumber = 6 + (floor (random 4));
            while { count units _grp < _enemyNumber } do {
                [selectRandom militia_squad, markerPos _spawnsector, _grp, "PRIVATE", 0.5] call KPLIB_fnc_createManagedUnit;
            };
            _grpspeed = "LIMITED";
        } else {

            _nearestroad = objNull;
            while { isNull _nearestroad } do {
                _nearestroad = [(markerPos (_spawnsector)) getPos [random (100), random (360)], 200, []] call BIS_fnc_nearestRoad;
                sleep 1;
            };

            _roadInfo = getRoadInfo _nearestroad;

            //Gets the direction from the start of the road to the end of the road
            _spawnDir = (_roadInfo select 6) getDir (_roadInfo select 7); 
            _spawnpos = getPos _nearestroad;

            _vicClassName = selectRandom patrol_vehicles;
            _seatCount = ([_vicClassName, true] call BIS_fnc_crewCount);
            _seatCount = 0 max _seatCount;
            _seatCount = (8 min _seatCount) - 1;

            _enemyVic = (_vicClassName) createVehicle _spawnpos;
            _enemyVic setPos _spawnpos;
            _enemyVic setDir _spawnDir;
            _enemyVic addMPEventHandler ['MPKilled', {_this spawn kill_manager}];

            _grpspeed = "NORMAL";
            

            for "_i" from 0 to _seatCount do 
            { 
                [selectRandom militia_squad, _spawnpos, _grp, "PRIVATE", 0.5] call KPLIB_fnc_createManagedUnit;
            };

            _vicUnit = objNull;
            _cargoIndex = 0;

            for "_i" from 0 to _seatCount do 
            {
                _vicUnit = ((units _grp) select _i);
                if (_i == 0) then
                {
                    _vicUnit moveInDriver _enemyVic;
                };

                if(_i == 1) then
                {
                    
                    _vicUnit moveInGunner _enemyVic;

                    if(gunner _enemyVic != _vicUnit) then
                    {
                        _vicUnit assignAsCargoIndex [_enemyVic, _cargoIndex];
                        _vicUnit moveInCargo _enemyVic;
                        _cargoIndex = _cargoIndex + 1;
                    };
                };

                if(_i == 2) then
                {
                    _vicUnit moveInCommander _enemyVic;

                    if(commander _enemyVic != _vicUnit) then
                    {
                        _vicUnit assignAsCargoIndex [_enemyVic, _cargoIndex];
                        _vicUnit moveInCargo _enemyVic;
                        _cargoIndex = _cargoIndex + 1;
                    };
                };

                if(_i > 2) then
                {
                    _vicUnit assignAsCargoIndex [_enemyVic, _cargoIndex];
                    _vicUnit moveInCargo _enemyVic;
                    _cargoIndex = _cargoIndex + 1;
                };
            };
            
        };

        { _x addEventHandler ["HandleDamage", { private [ "_damage" ]; if (( side (_this select 3) != GRLIB_side_enemy ) && ( side (_this select 3) != GRLIB_side_friendly )) then { _damage = 0 } else { _damage = _this select 2 }; _damage } ]; } foreach units _grp;

        _sectors_patrol = [];
        _patrol_startpos = getpos (leader _grp);
        {
            if ((_patrol_startpos distance (markerpos _x) < 5000) && (count ([markerPos _x, 4000] call KPLIB_fnc_getNearbyPlayers) > 0)) then {
                _sectors_patrol pushback _x;
            };
        } foreach ((sectors_bigtown + sectors_capture + sectors_factory) - blufor_sectors);

        _sectors_patrol_random = [];
        _sectorcount = count _sectors_patrol;
        while { count _sectors_patrol_random < _sectorcount } do {
            _nextsector = selectRandom _sectors_patrol;
            _sectors_patrol_random pushback _nextsector;
            _sectors_patrol = _sectors_patrol - [_nextsector];

        };

        while {(count (waypoints _grp)) != 0} do {deleteWaypoint ((waypoints _grp) select 0);};
        {_x doFollow leader _grp} foreach units _grp;

        {
            _nearestroad = [(markerPos _x) getPos [random(100), random(360)], 200, []] call BIS_fnc_nearestRoad;
            if ( isNull _nearestroad ) then {
                _waypoint = _grp addWaypoint [ markerpos _x, 100 ];
            } else {
                _waypoint = _grp addWaypoint [ getpos _nearestroad, 0 ];
            };
            _waypoint setWaypointType "MOVE";
            _waypoint setWaypointSpeed _grpspeed;
            _waypoint setWaypointBehaviour "AWARE";
            _waypoint setWaypointCombatMode "YELLOW";
            _waypoint setWaypointCompletionRadius 100;
        } foreach _sectors_patrol_random;

        _waypoint = _grp addWaypoint [_patrol_startpos , 100];
        _waypoint setWaypointType "CYCLE";

        if ( local _grp ) then {
            _headless_client = [] call KPLIB_fnc_getLessLoadedHC;
            if ( !isNull _headless_client ) then {
                _grp setGroupOwner ( owner _headless_client );
            };
        };

        waitUntil {
            sleep (30 + (random 30));
            ((({alive _x} count (units _grp)) == 0) || (count ([getpos leader _grp, 4000] call KPLIB_fnc_getNearbyPlayers) == 0))
        };

        if ( count (units _grp) > 0 ) then {
            if (count ([getpos leader _grp, 4000] call KPLIB_fnc_getNearbyPlayers) == 0) then {
                    {
                        if ( vehicle _x != _x ) then {
                            [(vehicle _x)] call KPLIB_fnc_cleanOpforVehicle;
                        };
                        deleteVehicle _x;
                    } foreach (units _grp);
            };
        };
    };

    sleep 150 + (random (150));
};
