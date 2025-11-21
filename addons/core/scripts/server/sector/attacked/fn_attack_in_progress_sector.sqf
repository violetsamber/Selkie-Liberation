/*
    File: fn_attack_in_progress_sector.sqf
    Authors: Violets, KP Liberation Team
    Date: 2025-11-01
    Last Update: 2025-11-20
    License: GNU GENERAL PUBLIC LICENSE - https://www.gnu.org/licenses/gpl-3.0.en.html
    
    Description:
        No description added yet.
    
    Parameter(s):
        _localVariable - Description [DATATYPE, defaults to DEFAULTVALUE]
    
    Returns:
        Function reached the end [BOOL]
*/

#include "../../FunctionsInclude.hpp"
#include "sector_attacked_macros.hpp"

params [ "_sectorMarker" ];

private _sectorPos = markerPos _sectorMarker;

SLKLIB_sectors_under_attack pushBack _sectorMarker;
publicVariable "SLKLIB_sectors_under_attack";

[
    {
        PFH_GETPARAM(_this,_sectorPos,PFH_PARAM_SECTOR_POS)
        PFH_GETPARAM(_this,_sectorMarker,PFH_PARAM_SECTOR_MARKER)

        switch (_stageIndex) do {
            case 0: {
                if(_timer < 5) then {
                    ADD(_timer,PFH_UPDATE_TIME);
                } else {
                    [format["Stage finished. 0"],"SECTOR ATTACK"] call KPLIB_fnc_debugLog;
                    _isStageFinished = true;
                };

                if(_isStageFinished) then {
                    INC(_stageIndex);
                    _isStageFinished = false;
                    _timer = 0;
                };
            };
            case 1: {
                //Check to see if its not owned by the enemies
                private _ownership = [_sectorPos] call KPLIB_fnc_getSectorOwnership;
                if ( _ownership != GRLIB_side_enemy ) then {
                    _isFinished = true;
                };

                [format["Stage finished. 1 | %1", _ownership],"SECTOR ATTACK"] call KPLIB_fnc_debugLog;

                _isStageFinished = true;
                if(_isStageFinished) then {
                    INC(_stageIndex);
                    _isStageFinished = false;
                    _timer = 0;
                };
            };
            case 2: {
                _squad_type = blufor_squad_inf_light;
                if (_sectorMarker in sectors_military) then {
                    _squad_type = blufor_squad_inf;
                };

                _grp = createGroup [GRLIB_side_friendly, true];
                _grp setBehaviour "COMBAT";

                [format["Stage finished. 2 | Group: %1, Squad Type: %2", _grp, _squad_type],"SECTOR ATTACK"] call KPLIB_fnc_debugLog;

                _isStageFinished = true;
                if(_isStageFinished) then {
                    INC(_stageIndex);
                    _isStageFinished = false;
                    _timer = 0;
                };
            };
            case 3: {
                //Spawn defenders
                private _unitCount = (count units _grp);
                if (GRLIB_blufor_defenders &&  _unitCount < (count _squad_type)) then {
                    private _class = (_squad_type select _unitCount);
                    [format["Stage finished. 2 | Group: %1, UnitCount: %2, Class: %3, Pos: %4", _grp, _unitCount, _class, _sectorPos],"SECTOR ATTACK"] call KPLIB_fnc_debugLog;
                    [_class, _sectorPos, _grp] call KPLIB_fnc_createManagedUnit;
                } else {
                    _isStageFinished = true;
                };
                                
                if(_isStageFinished) then {
                    INC(_stageIndex);
                    _isStageFinished = false;
                    _timer = 0;
                };
            };
            case 4: {
                if(_timer < 60) then {
                    ADD(_timer,PFH_UPDATE_TIME);
                } else {
                    _isStageFinished = true;
                    
                    [format["Stage finished. 4 "],"SECTOR ATTACK"] call KPLIB_fnc_debugLog;
                    _taskID = ["LIB_Defend", "", format ["DEFEND: %1", _sectorName], _sectorPos] call KPLIB_server_fnc_taskCreate;

                    [_sectorMarker, 1] remoteExec ["KPLIB_shared_fnc_remote_call_sector"];
                };

                if(_isStageFinished) then {
                    INC(_stageIndex);
                    _isStageFinished = false;
                    _timer = 0;
                };                
            };
            case 5: {
                //Exit if the ownership is still blufor
                private _ownership = [_sectorPos] call KPLIB_fnc_getSectorOwnership;
                if ( _ownership == GRLIB_side_friendly ) then {
                    if ( GRLIB_blufor_defenders ) then {
                        {
                            if ( alive _x ) then { deleteVehicle _x };
                        } forEach units _grp;
                    };
                    [format["Finished 5 | Ownership: %1", _ownership],"SECTOR ATTACK"] call KPLIB_fnc_debugLog;
                    _isFinished = true;
                };

                _isStageFinished = true;
                if(_isStageFinished) then {
                    INC(_stageIndex);
                    _isStageFinished = false;
                    _timer = 0;
                };  
            };
            case 6: {
                //Update loop and countdown
                private _ownership = [_sectorPos] call KPLIB_fnc_getSectorOwnership;
                if ((_attacktime > 0) && ( _ownership == GRLIB_side_enemy || _ownership == GRLIB_side_resistance)) then {

                    private _blufor = [_sectorPos, GRLIB_capture_size, GRLIB_side_friendly] call KPLIB_fnc_getUnitsCount;

                    //Check for blufor here and pause timer if they are
                    if(_blufor <= 0) then {
                        _attacktime = _attacktime - PFH_UPDATE_TIME;
                        private _timeLeft = [_attacktime] call KPLIB_fnc_secondsToTimer;
                        [_taskID, "", format ["DEFEND: %1", _timeLeft]] call KPLIB_server_fnc_taskSetDescription;
                    };

                    if(_blufor > 0 && _lastBlufor <= 0) then {
                        [_taskID, "", format ["DEFEND: CONTESTED"]] call KPLIB_server_fnc_taskSetDescription;
                    };
                    
                    _lastBlufor = _blufor;
                } else {
                    [format["Finished 6 | Ownership: %1 Attack Time: %2", _ownership, _attacktime],"SECTOR ATTACK"] call KPLIB_fnc_debugLog;
                    _isStageFinished = true;
                };

                if(_isStageFinished) then {
                    INC(_stageIndex);
                    _isStageFinished = false;
                    _timer = 0;
                }; 
            };
            case 7: {
                //Wait until the sector ownership is not the resistance
                if([_sectorPos] call KPLIB_fnc_getSectorOwnership != GRLIB_side_resistance)then {
                    _isStageFinished = true;

                    [format["Finished 7"],"SECTOR ATTACK"] call KPLIB_fnc_debugLog;
                };

                if(_isStageFinished) then {
                    INC(_stageIndex);
                    _isStageFinished = false;
                    _timer = 0;
                }; 
            };
            case 8: {
                //Remove sector from blufor sector and cleanup
                if ( GRLIB_endgame == 0 ) then {
                    if ( _attacktime <= 1 && ([_sectorPos] call KPLIB_fnc_getSectorOwnership == GRLIB_side_enemy ) ) then {
                        [format["Lost Sector: %1", _sectorMarker],"SECTOR ATTACK"] call KPLIB_fnc_debugLog;
                        blufor_sectors = blufor_sectors - [ _sectorMarker ];
                        publicVariable "blufor_sectors";
                        
                        [_sectorMarker, 2] remoteExec ["KPLIB_shared_fnc_remote_call_sector"];
                        [_taskID, "", format ["DEFEND: %1", _sectorName]] call KPLIB_server_fnc_taskSetDescription;
                        [_taskID,"LIB_Defend","FAILED"] call KPLIB_server_fnc_taskSetState;

                        ["KPLIB_ResetBattleGroups"] call CBA_fnc_serverEvent;
                        [] spawn KPLIB_fnc_doSave;
                        stats_sectors_lost = stats_sectors_lost + 1;
                        {
                            if (_sectorMarker in _x) exitWith {
                                if ((count (_x select 3)) == 3) then {
                                    {
                                        detach _x;
                                        deleteVehicle _x;
                                    } forEach (attachedObjects ((nearestObjects [((_x select 3) select 0), [KP_liberation_small_storage_building], 10]) select 0));

                                    deleteVehicle ((nearestObjects [((_x select 3) select 0), [KP_liberation_small_storage_building], 10]) select 0);
                                };
                                KP_liberation_production = KP_liberation_production - [_x];
                            };
                        } forEach KP_liberation_production;
                    } else {
                        [_sectorMarker, 3] remoteExec ["KPLIB_shared_fnc_remote_call_sector"];
                        [_taskID, "", format ["DEFEND: %1", _sectorName]] call KPLIB_server_fnc_taskSetDescription;
                        [_taskID,"LIB_Defend","SUCCEEDED"] call KPLIB_server_fnc_taskSetState;
                        {[_x] spawn KPLIB_server_fnc_prisonner_ai;} forEach (((_sectorPos) nearEntities ["Man", GRLIB_capture_size * 0.8]) select {side group _x == GRLIB_side_enemy});
                    };
                };

                [format["Finished 8"],"SECTOR ATTACK"] call KPLIB_fnc_debugLog;

                _isStageFinished = true;
                if(_isStageFinished) then {
                    INC(_stageIndex);
                    _isStageFinished = false;
                    _timer = 0;
                };
            };
            case 9: {
                if(_timer < 60) then {
                    ADD(_timer,PFH_UPDATE_TIME);
                } else {
                    _isStageFinished = true;
                    [format["Clean up."],"SECTOR ATTACK"] call KPLIB_fnc_debugLog;
                    
                    if ( GRLIB_blufor_defenders ) then {
                        {
                            if ( alive _x ) then { deleteVehicle _x };
                        } forEach units _grp;
                    };
                };

                if(_isStageFinished) then {
                    INC(_stageIndex);
                    _isStageFinished = false;
                    _timer = 0;
                };                
            };
            default {
                _isFinished = true;
            };
        };
    },
    PFH_UPDATE_TIME,
    [_sectorMarker, _sectorPos],
    {
        //Start
        _isFinished = false;
        _isStageFinished = false;
        _stageIndex = 0;
        _timer = 0;
        _attacktime = GRLIB_vulnerability_timer;
        _squad_type = [];
        _grp = grpNull;
        _taskID = "";
        _lastBlufor = 0;

        PFH_GETPARAM(_this,_sectorMarker,PFH_PARAM_SECTOR_MARKER)
        _sectorName = [_sectorMarker,SECTOR_HASHMAP_NAME] call KPLIB_fnc_getSectorValue;

        [format["%1 is under attack. %2", _sectorMarker, _attacktime],"SECTOR ATTACK"] call KPLIB_fnc_debugLog;
    },
    {
        //End

        PFH_GETPARAM(_this,_sectorMarker,PFH_PARAM_SECTOR_MARKER)
        SLKLIB_sectors_under_attack = SLKLIB_sectors_under_attack - [_sectorMarker]; 
        publicVariable "SLKLIB_sectors_under_attack";

        [format["%1 no longer under attack.", _sectorMarker],"SECTOR ATTACK"] call KPLIB_fnc_debugLog;
    },
    { !_isFinished },
    { _isFinished },
    ["_isFinished", "_isStageFinished", "_stageIndex", "_timer", "_squad_type", "_grp", "_attacktime", "_taskID", "_lastBlufor", "_sectorName"]
] call CBA_fnc_createPerFrameHandlerObject; 
