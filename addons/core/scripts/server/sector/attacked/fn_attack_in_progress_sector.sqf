/*
    File: fn_attack_in_progress_sector.sqf
    Authors: Violets, KP Liberation Team
    Date: 2025-11-01
    Last Update: 2025-11-19
    License: GNU GENERAL PUBLIC LICENSE - https://www.gnu.org/licenses/gpl-3.0.en.html
    
    Description:
        No description added yet.
    
    Parameter(s):
        _localVariable - Description [DATATYPE, defaults to DEFAULTVALUE]
    
    Returns:
        Function reached the end [BOOL]
*/

params [ "_sector" ];
private [ "_attacktime", "_ownership", "_grp", "_squad_type" ];

//Initial Delay
sleep 5;

//Check to see if its not owned by the enemies
_ownership = [ markerPos _sector ] call KPLIB_fnc_getSectorOwnership;
if ( _ownership != GRLIB_side_enemy ) exitWith {};


//spawn defenders
_squad_type = blufor_squad_inf_light;
if ( _sector in sectors_military ) then {
    _squad_type = blufor_squad_inf;
};

if ( GRLIB_blufor_defenders ) then {
    _grp = createGroup [GRLIB_side_friendly, true];
    {
        [_x, markerPos _sector, _grp] call KPLIB_fnc_createManagedUnit;
    } forEach _squad_type;
    sleep 3;
    _grp setBehaviour "COMBAT";
};

//Wait
sleep 60;

//Exit if the ownership is still blufor
_ownership = [ markerPos _sector ] call KPLIB_fnc_getSectorOwnership;
if ( _ownership == GRLIB_side_friendly ) exitWith {
    if ( GRLIB_blufor_defenders ) then {
        {
            if ( alive _x ) then { deleteVehicle _x };
        } forEach units _grp;
    };
};

[_sector, 1] remoteExec ["KPLIB_shared_fnc_remote_call_sector"];
_attacktime = GRLIB_vulnerability_timer;

//Update loop and countdown
while { _attacktime > 0 && ( _ownership == GRLIB_side_enemy || _ownership == GRLIB_side_resistance ) } do {
    _ownership = [markerPos _sector] call KPLIB_fnc_getSectorOwnership;
    _attacktime = _attacktime - 1;
    sleep 1;
};

//Wait until the sector ownership is not the resistance
waitUntil {
    sleep 1;
    [markerPos _sector] call KPLIB_fnc_getSectorOwnership != GRLIB_side_resistance;
};

//Remove sector from blufor sector and cleanup
if ( GRLIB_endgame == 0 ) then {
    if ( _attacktime <= 1 && ( [markerPos _sector] call KPLIB_fnc_getSectorOwnership == GRLIB_side_enemy ) ) then {
        blufor_sectors = blufor_sectors - [ _sector ];
        publicVariable "blufor_sectors";
        [_sector, 2] remoteExec ["KPLIB_shared_fnc_remote_call_sector"];
        ["KPLIB_ResetBattleGroups"] call CBA_fnc_serverEvent;
        [] spawn KPLIB_fnc_doSave;
        stats_sectors_lost = stats_sectors_lost + 1;
        {
            if (_sector in _x) exitWith {
                if ((count (_x select 3)) == 3) then {
                    {
                        detach _x;
                        deleteVehicle _x;
                    } forEach (attachedObjects ((nearestObjects [((_x select 3) select 0), [KP_liberation_small_storage_building], 10]) select 0));

                    deleteVehicle ((nearestObjects [((_x select 3) select 0), [KP_liberation_small_storage_building], 10]) select 0);
                };
                KP_liberation_production = KP_liberation_production - [_x];
            };
        } forEach KP_liberation_production;
    } else {
        [_sector, 3] remoteExec ["KPLIB_shared_fnc_remote_call_sector"];
        {[_x] spawn KPLIB_server_fnc_prisonner_ai;} forEach (((markerPos _sector) nearEntities ["Man", GRLIB_capture_size * 0.8]) select {side group _x == GRLIB_side_enemy});
    };
};

sleep 60;

if ( GRLIB_blufor_defenders ) then {
    {
        if ( alive _x ) then { deleteVehicle _x };
    } forEach units _grp;
};
