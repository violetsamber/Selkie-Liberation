/*
    File: fn_getTimeSinceLastBattlegroup.sqf
    Authors: 
    Date: 2025-11-10
    Last Update: 2025-11-10
    License: GNU GENERAL PUBLIC LICENSE - https://www.gnu.org/licenses/gpl-3.0.en.html
    
    Description:
        No description added yet.
    
    Parameter(s):
        _localVariable - Description [DATATYPE, defaults to DEFAULTVALUE]
    
    Returns:
        Function reached the end [BOOL]
*/

private _timeSince = diag_tickTime - GRLIB_last_battlegroup_time;

_timeSince;
