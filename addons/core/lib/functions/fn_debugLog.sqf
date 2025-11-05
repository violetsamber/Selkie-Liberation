/*
    File: fn_log.sqf
    Author: Violets
    Date: 2025-11-5
    Last Update: 2025-11-5
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Logger with automatic removal when not not debugging

    Parameter(s):
        _text   - Text to write into log                        [STRING, defaults to ""]

    Returns:
        Function reached the end [BOOL]
*/
#include "../FunctionsInclude.hpp"

params [
    ["_text", "", [""]]
];

if (DEBUG_LOG) exitWith {false};

[_text, "[DEBUG]"] call KPLIB_fnc_log
