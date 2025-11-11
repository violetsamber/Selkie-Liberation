/*
    File: fn_battlegroup_calculate_size.sqf
    Authors: Violets
    Date: 2025-11-10
    Last Update: 2025-11-10
    License: GNU GENERAL PUBLIC LICENSE - https://www.gnu.org/licenses/gpl-3.0.en.html
    
    Description:
        No description added yet.
    
    Parameter(s):
        _localVariable - Description [DATATYPE, defaults to DEFAULTVALUE]
    
    Returns:
        Function reached the end [BOOL]
*/

//Time Since Last Battlegroup

#include "../FunctionsInclude.hpp"

params [
    ["_sectorMarker", ""]
];

private _size = 0;
private _timeSince = [] call KPLIB_fnc_getTimeSinceLastBattlegroup;
private _maxSleep = SLKLIB_RandomBattlegroups_MaxSleeptime;
private _minSleep = SLKLIB_RandomBattlegroups_MinSleeptime;

["----Calculate Battlegroup Size----", "BATTLEGROUP"] call KPLIB_fnc_log;

[format ["| Sector: %1 | Type: %2 | Name: %3 | Pos: %4 |", 
    _sectorMarker,
    [_sectorMarker, SECTOR_HASHMAP_TYPE] call KPLIB_fnc_getSectorValue,
    [_sectorMarker, SECTOR_HASHMAP_NAME] call KPLIB_fnc_getSectorValue,
    [_sectorMarker, SECTOR_HASHMAP_POS] call KPLIB_fnc_getSectorValue
    ], 
    "BATTLEGROUP"] 
    call KPLIB_fnc_log;

//Below minumum time penalty -1
if(_timeSince < _minSleep) then {
    if(_timeSince < (_minSleep / 2)) then{
        ADD(_size,-2);
    } else {
        ADD(_size,-1);
    };
    [format ["Below min time penalty: -1 Size: %1",_size], "BATTLEGROUP"] call KPLIB_fnc_log;
} else {
    //Min - Max [0,1,2]
    //|Min 0|Center 1|Max 2|

    private _sleepThirds = ((_maxSleep - _minSleep) / 3);
    private _sleepFirstThird = (_minSleep + _sleepThirds);
    private _sleepSecondThird = (_minSleep + (_sleepThirds * 2));

    //Min 0
    if(_timeSince > _minSleep && _timeSince < _sleepFirstThird) then {
        //Do Nothing
        [format ["Min Sleep: 0 Size: %1",_size], "BATTLEGROUP"] call KPLIB_fnc_log;
    };

    //Center 1
    if(_timeSince >= _sleepFirstThird && _timeSince < _sleepSecondThird) then {
        ADD(_size,1);
        [format ["Center Sleep: 1 Size: %1",_size], "BATTLEGROUP"] call KPLIB_fnc_log;
    };

    //Max 2
    if(_timeSince >= _sleepSecondThird) then {
        ADD(_size,2);
        [format ["Max Sleep: 2 Size: %1",_size], "BATTLEGROUP"] call KPLIB_fnc_log;
    };
};

//Combat Readiness 0-100 [0.5x, 1x, 2x]

private _readinessAddition = round (SLKLIB_combat_readiness / 50);
//if(SLKLIB_combat_readiness < 25) then { _readinessAddition = -1 };
ADD(_size,_readinessAddition);
[format ["Readiness [%1] Add: %2 Size: %3",SLKLIB_combat_readiness, _readinessAddition,  _size], "BATTLEGROUP"] call KPLIB_fnc_log;

/* Sector Type Modifier
Tower = -1
Small Town = 0
Factory = 1
Military = 2
Large Town = 2
*/

private _sectorType = [_sectorMarker, SECTOR_HASHMAP_TYPE] call KPLIB_fnc_getSectorValue;

switch (_sectorType) do {
    case SECTOR_TYPE_TOWER: {
        ADD(_size,-1);
        [format ["Type %1: -1 Size: %2", SECTOR_TYPE_TOWER, _size], "BATTLEGROUP"] call KPLIB_fnc_log;
    };
    case SECTOR_TYPE_TOWN: {
        //ADD(_size,0);
        [format ["Type %1: 0 Size: %2", SECTOR_TYPE_TOWN, _size], "BATTLEGROUP"] call KPLIB_fnc_log;
    };
    case SECTOR_TYPE_FACTORY: {
        ADD(_size,1);
        [format ["Type %1: 1 Size: %2", SECTOR_TYPE_FACTORY, _size], "BATTLEGROUP"] call KPLIB_fnc_log;
    };
    case SECTOR_TYPE_MILITARY: {
        ADD(_size,2);
        [format ["Type %1: 2 Size: %2", SECTOR_TYPE_MILITARY, _size], "BATTLEGROUP"] call KPLIB_fnc_log;
    };
    case SECTOR_TYPE_BIGTOWN: {
        ADD(_size,2);
        [format ["Type %1: 2 Size: %2", SECTOR_TYPE_BIGTOWN, _size], "BATTLEGROUP"] call KPLIB_fnc_log;
    };
};

//Random Factor [-1,0,1]
private _randomAdd = ([-1,0,1] select (random 3));
ADD(_size,_randomAdd);
[format ["Random: %1 Size: %2", _randomAdd, _size], "BATTLEGROUP"] call KPLIB_fnc_log;

_size = (_size Max BATTLEGROUP_TYPE_MIN);
_size = (_size Min BATTLEGROUP_TYPE_MAX);

[format ["Final Size: %1", _size], "BATTLEGROUP"] call KPLIB_fnc_log;

["----Calculate Battlegroup Size----", "BATTLEGROUP"] call KPLIB_fnc_log;

_size
