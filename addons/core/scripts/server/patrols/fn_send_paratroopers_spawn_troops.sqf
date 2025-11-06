/*
    File: fn_send_paratroopers_spawn_troops.sqf
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

//Create paratroopers
private _para_group = createGroup [GRLIB_side_enemy, true];
private _maxCargo = count fullCrew [_newvehicle, "cargo", true];

while {(count (units _para_group)) < _maxCargo} do {
    [opfor_paratrooper, markerPos _spawnsector, _para_group] call KPLIB_fnc_createManagedUnit;
};

{removeBackpack _x; _x addBackpack "B_parachute"; _x moveInCargo _newvehicle;} forEach (units _para_group);