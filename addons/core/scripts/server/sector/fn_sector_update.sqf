/*
    File: fn_sector_update.sqf
    Authors: Violets
    Date: 2025-11-07
    Last Update: 2025-11-07
    License: GNU GENERAL PUBLIC LICENSE - https://www.gnu.org/licenses/gpl-3.0.en.html
    
    Description:
        No description added yet.
    
    Parameter(s):
        _localVariable - Description [DATATYPE, defaults to DEFAULTVALUE]
    
    Returns:
        Function reached the end [BOOL]
*/

private _activationTime = time;
// sector lifetime loop
while {!_stopit} do {
    // sector was captured
    if (([_sectorpos, _local_capture_size] call KPLIB_fnc_getSectorOwnership == GRLIB_side_friendly) && (GRLIB_endgame == 0)) then {
        if (isServer) then {
            [_sector] spawn KPLIB_shared_fnc_sector_liberated_remote_call;
        } else {
            [_sector] remoteExec ["KPLIB_shared_fnc_sector_liberated_remote_call",2];
        };

        _stopit = true;

        {[_x] spawn KPLIB_server_fnc_prisonner_ai;} forEach ((markerPos _sector) nearEntities [["Man"], _local_capture_size * 1.2]);

        sleep 60;

        active_sectors = active_sectors - [_sector]; publicVariable "active_sectors";

        sleep 600;
        //TODO This should be handled by a garbage collector script
        {
            if (_x isKindOf "Man") then {
                if (side group _x != GRLIB_side_friendly) then {
                    deleteVehicle _x;
                };
            } else {
                if (!isNull _x) then {
                    [_x] call KPLIB_fnc_cleanOpforVehicle;
                };
            };
        } forEach _managed_units;
        
    } else {

        //Sector running logic
        if (([_sectorpos, (([_opforcount] call KPLIB_fnc_getSectorRange) + 300), GRLIB_side_friendly] call KPLIB_fnc_getUnitsCount) == 0) then {
            _sector_despawn_tickets = _sector_despawn_tickets - 1;
        } else {
            // start counting running minutes after ADDITIONAL_TICKETS_DELAY
            private _runningMinutes = (floor ((time - _activationTime) / 60)) - ADDITIONAL_TICKETS_DELAY;
            private _additionalTickets = (_runningMinutes * BASE_TICKETS);

            // clamp from 0 to "_maximum_additional_tickets"
            _additionalTickets = (_additionalTickets max 0) min _maximum_additional_tickets;

            _sector_despawn_tickets = BASE_TICKETS + _additionalTickets;
        };

        if (_sector_despawn_tickets <= 0) then {
            {
                if (_x isKindOf "Man") then {
                    deleteVehicle _x;
                } else {
                    if (!isNull _x) then {
                        [_x] call KPLIB_fnc_cleanOpforVehicle;
                    };
                };
            } forEach _managed_units;

            _stopit = true;
            active_sectors = active_sectors - [_sector]; publicVariable "active_sectors";
        };

    };
    sleep SECTOR_TICK_TIME;
};