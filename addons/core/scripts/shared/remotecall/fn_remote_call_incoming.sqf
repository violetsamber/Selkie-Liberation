/*
    File: fn_remote_call_incoming.sqf
    Authors: KP Liberation Team
    Date: 2025-11-01
    Last Update: 2025-11-08
    License: GNU GENERAL PUBLIC LICENSE - https://www.gnu.org/licenses/gpl-3.0.en.html
    
    Description:
        No description added yet.
    
    Parameter(s):
        _localVariable - Description [DATATYPE, defaults to DEFAULTVALUE]
    
    Returns:
        Function reached the end [BOOL]
*/

if ( isDedicated ) exitWith {};

params [ "_attack_destination" ];

if ( isNil "GRLIB_last_incoming_notif_time" ) then { GRLIB_last_incoming_notif_time = -9999 };

if ( time > GRLIB_last_incoming_notif_time + 60 ) then {

    GRLIB_last_incoming_notif_time = time;

    private [ "_attack_location_name" ];
    _attack_location_name = [_attack_destination] call KPLIB_fnc_getLocationName;

    [ "lib_incoming", [ _attack_location_name ] ] call BIS_fnc_showNotification;

    private [ "_mrk" ];
    _mrk = createMarkerLocal [ "opfor_incoming_marker", _attack_destination];
    "opfor_incoming_marker" setMarkerTypeLocal "selector_selectedMission";
    "opfor_incoming_marker" setMarkerColorLocal GRLIB_color_enemy_bright;

    sleep 250;
    deleteMarkerLocal _mrk;
};
