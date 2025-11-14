/*
    File: test_notifications.sqf
    Authors: 
    Date: 2025-11-13
    Last Update: 2025-11-13
    License: GNU GENERAL PUBLIC LICENSE - https://www.gnu.org/licenses/gpl-3.0.en.html
    
    Description:
        No description added yet.
    
    Parameter(s):
        _localVariable - Description [DATATYPE, defaults to DEFAULTVALUE]
    
    Returns:
        Function reached the end [BOOL]
*/
#include "../addons/core/script_component.hpp"

KPLIB_fnc_getAttackSizeName = call compile preprocessFileLineNumbers "addons/core/lib/functions/fn_getAttackSizeName.sqf";

private _tests = [
    ["Tiny", [0] call KPLIB_fnc_getAttackSizeName],
    ["Small", [1] call KPLIB_fnc_getAttackSizeName],
    ["Medium", [2] call KPLIB_fnc_getAttackSizeName],
    ["Large", [3] call KPLIB_fnc_getAttackSizeName],
    ["Huge", [4] call KPLIB_fnc_getAttackSizeName]
];

systemChat "----NOTIFICATION_DEBUG----";
private _testPassed = 0;
private _testFailed = 0;

{
    private _a = _x select 0;
    private _b = _x select 1;
    private _isTrue = (_a == _b);
    private _message = format["%1 is not equal to %2",_a,_b];
    if(!_isTrue) then {
        systemChat _message;
        INC(_testFailed)
    } else {
        INC(_testPassed)
    };
} forEach _tests;
systemChat format["Passed: %1 Failed: %2",_testPassed,_testFailed];;
systemChat "----NOTIFICATION_DEBUG----";