/*
    File: fn_taskUpdate.sqf
    Authors: Violets, Antistasi Team
    Date: 2025-11-20
    Last Update: 2025-11-21
    License: GNU GENERAL PUBLIC LICENSE - https://www.gnu.org/licenses/gpl-3.0.en.html
    
    Description:
        SLKLIB_tasksData: array of all active tasks, format [taskID, type, state, creationTime]. Non-public.
        SLKLIB_activeTasks: unique string array of all active task types, completed or not. Public.
        SLKLIB_taskCount: number of tasks created. Used to help generate unique task IDs. Public.
    
    Parameter(s):
        <STRING> taskID: Unique ID for task.
        <STRING> taskType: Task type. Will act appropriately if non-unique.
        <STRING> state/action: CREATED, DELETED, SUCCEEDED, FAILED
    
    Returns:
        Function reached the end [BOOL]
*/

#include "../FunctionsInclude.hpp"

if (!isServer) exitWith { ERROR("[KPLIB] [TASK_UPDATE] Server-only function miscalled") };

params [
    "_taskId",
    "_taskType",
    "_state"
];

private _taskIndex = SLKLIB_tasksData findIf { (_x#0) isEqualTo _taskId };

if (_state isEqualTo "CREATED") exitWith
{
    SLKLIB_taskCount = SLKLIB_taskCount + 1; publicVariable "SLKLIB_taskCount";

    if (_taskIndex != -1) exitWith { ERROR_1("Non-unique task ID %1 created",_taskId) };
    SLKLIB_tasksData pushBack [_taskId, _taskType, "CREATED", serverTime];

    //if (SLKLIB_activeTasks find _taskType != -1) exitWith { ERROR_1("Task type %1 already active",_taskType) };
    SLKLIB_activeTasks pushBack _taskType; publicVariable "SLKLIB_activeTasks";
    [_taskID,_taskType,_state] remoteExecCall ["KPLIB_client_fnc_taskUpdateHandler"];
};

if (_taskIndex == -1) exitWith { ERROR_2("Task ID %1 not found for state %2",_taskId,_state) };

if (_state isEqualTo "DELETED") exitWith {
    SLKLIB_tasksData deleteAt _taskIndex;
    if (SLKLIB_tasksData findIf { (_x#1) isEqualTo _taskType } != -1) exitWith {};				// non-unique task type
    SLKLIB_activeTasks deleteAt (SLKLIB_activeTasks find _taskType); publicVariable "SLKLIB_activeTasks";
    [_taskID,_taskType,_state] remoteExecCall ["KPLIB_client_fnc_taskUpdateHandler"];
};

if !(_state in ["SUCCEEDED", "FAILED"]) exitWith { ERROR_2("Bad state %1 for task ID %2",_state,_taskId) };
(SLKLIB_tasksData#_taskIndex) set [2, _state];
