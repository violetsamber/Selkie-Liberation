/*
    File: fn_taskDelete.sqf
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

if (!isServer) exitWith { ERROR("[KPLIB] [TASK_DELETE] Server-only function miscalled") };

params ["_taskID", "_taskType"];

[_taskID, _taskType, "DELETED"] call KPLIB_server_fnc_taskUpdate;
[_taskID] call BIS_fnc_deleteTask;
