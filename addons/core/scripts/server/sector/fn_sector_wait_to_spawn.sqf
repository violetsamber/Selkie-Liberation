/*
    File: fn_sector_wait_to_spawn.sqf
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

/*
    File: fn_wait_to_spawn_sector.sqf
    Authors: Violets
    Date: 2025-11-01
    Last Update: 2025-11-07
    License: GNU GENERAL PUBLIC LICENSE - https://www.gnu.org/licenses/gpl-3.0.en.html
    
    Description:
        No description added yet.
    
    Parameter(s):
        _localVariable - Description [DATATYPE, defaults to DEFAULTVALUE]
    
    Returns:
        Function reached the end [BOOL]
*/

//TODO REFACTOR THIS MESS
params ["_sector", "_opforcount"];

private _start = diag_tickTime;
[format ["Sector %1 (%2) - Waiting to spawn sector...", (markerText _sector), _sector], "SECTORSPAWN"] remoteExecCall ["KPLIB_fnc_log", 2];

private _corrected_size = [_opforcount] call KPLIB_fnc_getSectorRange;
sleep 0.1;
private _unitscount = [markerPos _sector, _corrected_size , GRLIB_side_friendly] call KPLIB_fnc_getUnitsCount;

if (_unitscount > 0 && _unitscount <= 10) then {
    sleep 5;
};
sleep 0.1;

_unitscount = [markerPos _sector, _corrected_size, GRLIB_side_friendly] call KPLIB_fnc_getUnitsCount;
if (_unitscount > 0 && _unitscount <= 6) then {
    sleep 5;
};
sleep 0.1;

_unitscount = [markerPos _sector, _corrected_size, GRLIB_side_friendly] call KPLIB_fnc_getUnitsCount;
if (_unitscount > 0 && _unitscount <= 4) then {
    sleep 5;
};
sleep 0.1;

_unitscount = [markerPos _sector, _corrected_size, GRLIB_side_friendly] call KPLIB_fnc_getUnitsCount;
if (_unitscount > 0 && _unitscount <= 3) then {
    sleep 5;
};
sleep 0.1;

_unitscount = [markerPos _sector, _corrected_size, GRLIB_side_friendly] call KPLIB_fnc_getUnitsCount;
if (_unitscount > 0 && _unitscount <= 2) then {
    sleep 5;
};
sleep 0.1;

_unitscount = [markerPos _sector, _corrected_size, GRLIB_side_friendly] call KPLIB_fnc_getUnitsCount;
if (_unitscount == 1) then {
    sleep 5;
};

[format ["Sector %1 (%2) - Waiting done - Time needed: %3 seconds", (markerText _sector), _sector, diag_tickTime - _start], "SECTORSPAWN"] remoteExecCall ["KPLIB_fnc_log", 2];
