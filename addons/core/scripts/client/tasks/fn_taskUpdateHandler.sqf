/*
    File: fn_taskUpdateHandler.sqf
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



//Notifications dont need to run on headless clients or the server
if(!hasInterface) exitWith { true };
[
    {
        [_this select 0] call BIS_fnc_taskExists
    },
    {
        [format ["TaskID: %1 exists!",_this]] call KPLIB_fnc_log;
        [
            _this select 0,
            _this select 1,
            _this select 2
        ] call KPLIB_client_fnc_taskNotificationHandler;
    },
    [_taskId,_taskType,_state],
    5,
    { 
        [format ["TaskID: %1 did not show up!",_this select 0],"ERROR"] call KPLIB_fnc_log;
    }
] call CBA_fnc_waitUntilAndExecute;

