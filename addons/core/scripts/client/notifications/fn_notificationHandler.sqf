/*
    File: fn_notification_proccess.sqf
    Authors: Violets
    Date: 2025-11-20
    Last Update: 2025-11-21
    License: GNU GENERAL PUBLIC LICENSE - https://www.gnu.org/licenses/gpl-3.0.en.html
    
    Description:
        No description added yet.
    
    Parameter(s):
        _localVariable - Description [DATATYPE, defaults to DEFAULTVALUE]
    
    Returns:
        Function reached the end [BOOL]
*/

params [
    "_taskId",
    "_taskType",
    "_state"
];

switch (_taskType) do {
    case "LIB_Defend": {
        if(_state == "CREATED" && SLKLIB_notification_attacked) then {
            private _pos = _taskID call BIS_fnc_taskDestination;
            private _sector = [10,_pos] call KPLIB_fnc_getNearestSector;
            [ "lib_sector_attacked", [ markerText _sector ] ] call BIS_fnc_showNotification;
        };
    };
};
