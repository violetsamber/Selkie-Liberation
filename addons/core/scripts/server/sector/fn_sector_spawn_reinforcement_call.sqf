/*
    File: fn_sector_spawn_reinforcement_call.sqf
    Authors: Violets
    Date: 2025-11-07
    Last Update: 2025-11-14
    License: GNU GENERAL PUBLIC LICENSE - https://www.gnu.org/licenses/gpl-3.0.en.html
    
    Description:
        No description added yet.
    
    Parameter(s):
        _localVariable - Description [DATATYPE, defaults to DEFAULTVALUE]
    
    Returns:
        Function reached the end [BOOL]
*/
private _sector = "";


if ((_sector in sectors_factory) || (_sector in sectors_capture) || (_sector in sectors_bigtown) || (_sector in sectors_military)) then {
    [_sector] remoteExec ["KPLIB_shared_fnc_reinforcements_remote_call",2];
};
