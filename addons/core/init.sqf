#include "script_component.hpp"

KPLIB_init = false;

// Version of the KP Liberation framework
KP_liberation_version = [MAJOR, MINOR, PATCH];
[format ["[init.sqf] Starting liberation version %1", QUOTE(VERSION_STR)], "INIT"] call KPLIB_fnc_log;
enableSaving [ false, false ];

if (isDedicated) then {debug_source = "Server";} else {debug_source = name player;};

[] call KPLIB_fnc_initSectors;
