/*
    File: fn_taskSetState.sqf
    Authors: Violets
    Date: 2025-11-20
    Last Update: 2025-11-20
    License: GNU GENERAL PUBLIC LICENSE - https://www.gnu.org/licenses/gpl-3.0.en.html
    
    Description:
        KPLIB_server_fnc_taskSetState
        Worker function to set fail & success states for A3A and BIS tasks

    Parameters:
        <STRING> unique task ID
        <STRING> task type (eg. LOG, RES, CONVOY)
        <STRING> new state, should be FAILED or SUCCEEDED
*/
#include "../FunctionsInclude.hpp"

if (!isServer) exitWith { ERROR("[KPLIB] [TASK_SETSTATE] Server-only function miscalled") };

params ["_taskId", "_taskType", "_state"];

[_taskId, _taskType, _state] call KPLIB_server_fnc_taskUpdate;
[_taskId, _state] call BIS_fnc_taskSetState;
