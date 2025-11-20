/*
    File: spot_timer.sqf
    Authors: KP Liberation Dev Team
    Date: 2025-11-01
    Last Update: 2025-11-20
    License: GNU GENERAL PUBLIC LICENSE - https://www.gnu.org/licenses/gpl-3.0.en.html
    
    Description:
        No description added yet.
    
    Parameter(s):
        _localVariable - Description [DATATYPE, defaults to DEFAULTVALUE]
    
    Returns:
        Function reached the end [BOOL]
*/

//TODO This is likely the notifications stuff for the spotted opfor enemies, this will likely be removed with the notifications refactor to the modern task system
createMarkerLocal ["opfor_bg_marker", markers_reset];
"opfor_bg_marker" setMarkerTypeLocal "mil_unknown";
"opfor_bg_marker" setMarkerColorLocal GRLIB_color_enemy_bright;

createMarkerLocal ["opfor_capture_marker", markers_reset];
"opfor_capture_marker" setMarkerTypeLocal "mil_objective";
"opfor_capture_marker" setMarkerColorLocal GRLIB_color_enemy_bright;

if ( isNil "sector_timer" ) then { sector_timer = 0 };

while { true } do {
    sleep 1;
    if ( sector_timer > 0 ) then {
        "opfor_capture_marker" setMarkerTextLocal format ["%1",([sector_timer] call KPLIB_fnc_secondsToTimer)];
        sector_timer = sector_timer - 1;
    } else {
        "opfor_capture_marker" setMarkerTextLocal "VULNERABLE";
        waitUntil{
            sleep 1;
            sector_timer > 0
        };
    };
};
