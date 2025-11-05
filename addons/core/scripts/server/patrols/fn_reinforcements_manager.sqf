//reinforcements_manager.sqf

params ["_targetsector"];

if (SLKLIB_combat_readiness > 15) then {

    private _init_units_count = (([markerPos _targetsector, GRLIB_capture_size, GRLIB_side_enemy] call KPLIB_fnc_getUnitsCount));

    if !(_targetsector in sectors_bigtown) then {
        while {(_init_units_count * 0.75) <= ([markerPos _targetsector, GRLIB_capture_size, GRLIB_side_enemy] call KPLIB_fnc_getUnitsCount)} do {
            sleep 5;
        };
    };

    if (_targetsector in active_sectors) then {

        private _nearestower = [markerPos _targetsector, GRLIB_side_enemy, GRLIB_radiotower_size * 1.4] call KPLIB_fnc_getNearestTower;

        if !(isNil "_nearestower") then {
            private _reinforcements_time = (((((markerPos _nearestower) distance (markerPos _targetsector)) / 1000) ^ 1.66 ) * 120) / (GRLIB_difficulty_modifier * GRLIB_csat_aggressivity);
            if (_targetsector in sectors_bigtown) then {
                _reinforcements_time = _reinforcements_time * 0.35;
            };
            private _current_timer = time;

            waitUntil {sleep 1; (_current_timer + _reinforcements_time < time) || (_targetsector in blufor_sectors) || (_nearestower in blufor_sectors)};

            sleep 15;

            if ((_targetsector in active_sectors) && !(_targetsector in blufor_sectors) && !(_nearestower in blufor_sectors) && (!([] call KPLIB_fnc_isBigtownActive) || _targetsector in sectors_bigtown)) then {
                reinforcements_sector_under_attack = _targetsector;
                reinforcements_set = true;
                ["lib_reinforcements",[markerText _targetsector]] remoteExec ["bis_fnc_shownotification"];
                if ((random SLKLIB_combat_readiness) > (20 + (30 / GRLIB_csat_aggressivity))) then {
                    [_targetsector] spawn KPLIB_server_fnc_send_paratroopers;
                    [_targetsector] spawn KPLIB_server_fnc_send_paratroopers;
                };
                stats_reinforcements_called = stats_reinforcements_called + 1;
            };
        };
    };
};
