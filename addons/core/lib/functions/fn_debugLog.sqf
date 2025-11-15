/*
    File: debugLog.sqf
    Author: Violets
    Date: 2025-11-5
    Last Update: 2025-11-15
    License: GNU GENERAL PUBLIC LICENSE - https://www.gnu.org/licenses/gpl-3.0.en.html

    Description:
        Logger with automatic removal when not not debugging

    Parameter(s):
        _text   - Text to write into log                        [STRING, defaults to ""]

    Returns:
        Function reached the end [BOOL]
*/
#include "../FunctionsInclude.hpp"

params [
    ["_text", "", [""]],
    ["_tag", "INFO"]
];

#ifdef DEBUG_MODE_FULL

[format ["[DEBUG] %1", _text],  _tag] call KPLIB_fnc_log;

#endif
