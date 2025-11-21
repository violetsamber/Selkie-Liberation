/*
    File: fn_taskUpdateHandler.sqf
    Authors: Violets
    Date: 2025-11-20
    Last Update: 2025-11-20
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

[format ["Task Updated. TaskID: %1 TaskType: %2 State: %3", _taskID, _taskType, _state]] call KPLIB_fnc_debugLog;
