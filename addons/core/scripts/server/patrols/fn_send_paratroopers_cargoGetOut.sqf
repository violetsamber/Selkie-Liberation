/*
    File: fn_send_paratroopers_drop.sqf
    Authors: 
    Date: 2025-11-06
    Last Update: 2025-11-06
    License: MIT License - http://www.opensource.org/licenses/MIT
    
    Description:
        No description added yet.
    
    Parameter(s):
        _localVariable - Description [DATATYPE, defaults to DEFAULTVALUE]
    
    Returns:
        Function reached the end [BOOL]
*/
#include "../FunctionsInclude.hpp"

params [
    ["_pfh", objNull]
];

PFH_GETVAR(_pfh,"_para_group",grpNull)

{
    unassignVehicle _x;
    moveOut _x;
    sleep 0.5;
} forEach (units _para_group);
