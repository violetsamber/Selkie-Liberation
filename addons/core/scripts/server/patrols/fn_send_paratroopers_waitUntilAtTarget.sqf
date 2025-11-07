/*
    File: fn_send_paratroopers_flyTo.sqf
    Authors: Violets
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

//Wait until at the objective or damaged
waitUntil {sleep 1;
    !(alive _newvehicle) || (damage _newvehicle > 0.4 ) || (_newvehicle distance _targetPos < 400)
};
