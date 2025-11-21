/*
    File: fn_taskSetDescription.sqf
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
#include "../FunctionsInclude.hpp"

if (!isServer) exitWith { ERROR("[KPLIB] [TASK_UPDATE] Server-only function miscalled") };

params [
    "_taskId", 
    "_taskDescription", 
    "_taskTitle"
];

private _taskIndex = SLKLIB_tasksData findIf { (_x#0) isEqualTo _taskId };
if (_taskIndex == -1) exitWith { ERROR_1("Task ID %1 not found.",_taskId) };

[
    _taskID,
    [
        _taskDescription call BIS_fnc_localize,
        _taskTitle call BIS_fnc_localize,
        ""
    ]
] call BIS_fnc_taskSetDescription;

