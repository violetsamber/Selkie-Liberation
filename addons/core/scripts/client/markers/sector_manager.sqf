/*
    File: sector_manager.sqf
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

//TODO Refactor this and make a custom event handler that runs whenever the blufor_sectors array changes

waitUntil {!isNil "save_is_loaded"};
waitUntil {!isNil "GRLIB_vehicle_to_military_base_links"};
waitUntil {!isNil "blufor_sectors"};
waitUntil {save_is_loaded};

private _vehicle_unlock_markers = [];
private _cfg = configFile >> "cfgVehicles";

{
    _x params ["_vehicle", "_base"];
    private _marker = createMarkerLocal [format ["vehicleunlockmarker%1", _base], [(markerPos _base) select 0, ((markerPos _base) select 1) + 125]];
    _marker setMarkerTextLocal (getText (_cfg >> _vehicle >> "displayName"));
    _marker setMarkerColorLocal GRLIB_color_enemy;
    _marker setMarkerTypeLocal "mil_pickup";
    _vehicle_unlock_markers pushBack [_marker, _base];
} forEach GRLIB_vehicle_to_military_base_links;

private _sector_count = -1;

uiSleep 1;

while {true} do {
    waitUntil {
        uiSleep 1;
        count blufor_sectors != _sector_count
    };

    {_x setMarkerColorLocal GRLIB_color_enemy;} forEach (sectors_allSectors - blufor_sectors);
    {_x setMarkerColorLocal GRLIB_color_friendly;} forEach blufor_sectors;

    {
        _x params ["_marker", "_base"];
        _marker setMarkerColorLocal ([GRLIB_color_enemy, GRLIB_color_friendly] select (_base in blufor_sectors));
    } forEach _vehicle_unlock_markers;
    _sector_count = count blufor_sectors;
};
