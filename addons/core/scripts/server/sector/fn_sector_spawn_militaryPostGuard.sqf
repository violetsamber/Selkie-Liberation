/*
    File: fn_sector_spawn_militaryPostGuard.sqf
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

_managed_units = _managed_units + ([_sectorpos] call KPLIB_fnc_spawnMilitaryPostSquad);