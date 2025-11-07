/*
    File: fn_spawn_battlegroup_end.sqf
    Authors: Violets
    Date: 2025-11-05
    Last Update: 2025-11-06
    License: GNU GENERAL PUBLIC LICENSE - https://www.gnu.org/licenses/gpl-3.0.en.html
    
    Description:
        No description added yet.
    
    Parameter(s):
        _localVariable - Description [DATATYPE, defaults to DEFAULTVALUE]
    
    Returns:
        Function reached the end [BOOL]
*/

params [
    ["_pfh", objNull]
];

//systemChat format ["start! params: %1", _this getVariable "params"]; _test = 127;
["[BATTLEGROUP] Finishing battlegroup spawn."] call KPLIB_fnc_log;

[_pfh getVariable "_bg_groups"] params [["_bg_groups", []]];

private _spawnMarkerPos = _pfh getVariable "params" select 2;

[_spawnMarkerPos] remoteExec ["KPLIB_shared_fnc_remote_call_incoming"];

//Reduce combat readiness
[-(round (count _bg_groups + random (count _bg_groups)))] call KPLIB_fnc_addCombatReadiness;
stats_hostile_battlegroups = stats_hostile_battlegroups + 1;
{
    if (local _x) then {
        _headless_client = [] call KPLIB_fnc_getLessLoadedHC;
        if (!isNull _headless_client) then {
            _x setGroupOwner (owner _headless_client);
        };
    };
    //sleep 1;
} forEach _bg_groups;
