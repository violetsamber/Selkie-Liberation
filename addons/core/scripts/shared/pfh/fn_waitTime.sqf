/*
    File: fn_waitTime.sqf
    Authors: Violets
    Date: 2025-11-21
    Last Update: 2025-11-21
    License: GNU GENERAL PUBLIC LICENSE - https://www.gnu.org/licenses/gpl-3.0.en.html
    
    Description:
        PFH module to wait for the passed time before saying its finished
    
    Parameter(s):
        _localVariable - Description [DATATYPE, defaults to DEFAULTVALUE]
    
    Returns:
        Function reached the end [BOOL]
*/

#include "../FunctionsInclude.hpp"

params [
    ["_timer", 0],
    ["_waitTime", 1],
    ["_updateTime", 1]
];

private _isTimeUp = false;

if(_timer < _waitTime) then {
    ADD(_timer,_updateTime);
} else {
    _isTimeUp = true;
};

[
    _isTimeUp,
    _timer
]
