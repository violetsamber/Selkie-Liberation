/*
    File: fn_taskCreate.sqf
    Authors: Violets
    Date: 2025-11-20
    Last Update: 2025-11-20
    License: GNU GENERAL PUBLIC LICENSE - https://www.gnu.org/licenses/gpl-3.0.en.html
    
    Description:

    
    Parameter(s):
        _localVariable - Description [DATATYPE, defaults to DEFAULTVALUE]
    
    Returns:
        The ID for the task
*/
#include "../FunctionsInclude.hpp"

if (!isServer) exitWith { ERROR("[KPLIB] [TASK_CREATE] Server-only function miscalled") };

params [
    "_taskType",
    "_description",
    "_title",
    "_pos",
    ["_state", "CREATED"],
    ["_priority", -1]
];

private _taskId = _taskType + str SLKLIB_taskCount;
[format["Creating task with: TaskID: %7 TaskType %1, Desc: %2, Title: %3, Pos: %4 State: %5, Priority %6",_taskType,_description,_title,_pos,_state,_priority, _taskId], "TASK_CREATE"] call KPLIB_fnc_debugLog; 
[
    [GRLIB_side_friendly],
    _taskId,
    [
        _description call BIS_fnc_localize,
        _title call BIS_fnc_localize
    ],
    _pos,
    _state,
    _priority,
    true,
    _taskType
] call BIS_fnc_taskCreate;

[_taskId,_taskType,_state] call KPLIB_server_fnc_taskUpdate;

_taskID
