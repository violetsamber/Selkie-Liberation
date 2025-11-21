/*
    File: fn_remote_call_sector.sqf
    Authors: 
    Date: 2025-11-01
    Last Update: 2025-11-21
    License: GNU GENERAL PUBLIC LICENSE - https://www.gnu.org/licenses/gpl-3.0.en.html
    
    Description:
        No description added yet.
    
    Parameter(s):
        _localVariable - Description [DATATYPE, defaults to DEFAULTVALUE]
    
    Returns:
        Function reached the end [BOOL]
*/

if ( isDedicated ) exitWith {};

if ( isNil "sector_timer" ) then { sector_timer = 0 };

params [ "_sector", "_status" ];

if ( _status == 0 ) then {
    [ "lib_sector_captured", [ markerText _sector ] ] call BIS_fnc_showNotification;
};

if ( _status == 1 ) then {
    //[ "lib_sector_attacked", [ markerText _sector ] ] call BIS_fnc_showNotification;
    //"opfor_capture_marker" setMarkerPosLocal ( markerPos _sector );
    //sector_timer = GRLIB_vulnerability_timer;
};

if ( _status == 2 ) then {
    [ "lib_sector_lost", [ markerText _sector ] ] call BIS_fnc_showNotification;
    "opfor_capture_marker" setMarkerPosLocal markers_reset;
    sector_timer = 0;
};

if ( _status == 3 ) then {
    [ "lib_sector_safe", [ markerText _sector ] ] call BIS_fnc_showNotification;
    "opfor_capture_marker" setMarkerPosLocal markers_reset;
    sector_timer = 0;
};

{ _x setMarkerColorLocal GRLIB_color_enemy; } forEach (sectors_allSectors - blufor_sectors);
{ _x setMarkerColorLocal GRLIB_color_friendly; } forEach blufor_sectors;
