/*
    File: fn_pickRandomClasses.sqf
    Authors: Violets
    Date: 2025-11-10
    Last Update: 2025-11-11
    License: GNU GENERAL PUBLIC LICENSE - https://www.gnu.org/licenses/gpl-3.0.en.html
    
    Description:
        No description added yet.
    
    Parameter(s):
        _localVariable - Description [DATATYPE, defaults to DEFAULTVALUE]
    
    Returns:
        Function reached the end [BOOL]
*/

#include "../FunctionsInclude.hpp"

params [
    ["_chancesToSpawn", []],
    ["_classes", []]
];

// private _chancesToSpawn = [100,50];
// private _classes = [
//     ["Selkie_Army_Falcon_Unarmed_Woodland",75], 
//     ["Selkie_UNSC_Marines_Pelican_Unarmed_Halo3",25]
// ];
private _class = "";
private _rand = 0;
private _totalRand = 0;
private _returnClasses = [];

[format ["_chancesToSpawn: %1, _classes: %2", _chancesToSpawn, _classes]] call KPLIB_fnc_Log;
private _spawnChances = (count _chancesToSpawn);  

for "_i" from 0 to _spawnChances do { 
	if(random 100 < (_chancesToSpawn select _i)) then { 
		_class = ""; 
		_rand = random 100;
		_totalRand = 0; 
 
		{
			_totalRand = (_totalRand + (_x select 1));
			if(_rand < _totalRand) exitWith { 
				_class = _x select 0;  
			}; 
		} forEach _classes; 
 
		if(!([_class,""] call BIS_fnc_areEqual)) then { 
			_returnClasses pushBack _class; 
		}; 
	}; 
};
[format ["_returnClasses: %1", _returnClasses]] call KPLIB_fnc_Log;
_returnClasses
