/*
    File: fn_odstDrop.sqf
    Authors: Violets, Stella
    Date: 2025-11-01
    Last Update: 2025-11-14
    License: GNU GENERAL PUBLIC LICENSE - https://www.gnu.org/licenses/gpl-3.0.en.html
    
    Description:
        No description added yet.
    
    Parameter(s):
        _localVariable - Description [DATATYPE, defaults to DEFAULTVALUE]
    
    Returns:
        Function reached the end [BOOL]
*/

#include "../FunctionsInclude.hpp"
#include "battlegroup_macros.hpp"

params [
    ["_spawnMarker", "", ["",[]]],
    ["_targetsector", "", ["",[]]],
	["_teamCount", 1, [1]]
];

if (_targetsector isEqualTo "") exitWith {false};

private _targetPos = _targetsector;
if (_targetPos isEqualType "") then {
    _targetPos = markerPos _targetsector;
};

private _units = +SLKLIB_opfor_odst_a;

private _team = configFile >> "CfgGroups" >> "Indep" >> "Selkie_UNSC_Marines_ODST" >> "Infantry" >> "UNSC_ODST_AssaultSquad";
private _units = [];

for "_i" from 1 to _teamCount do 
{
	private _group = [markerPos _spawnMarker, GRLIB_side_enemy, (_team)] call BIS_fnc_spawnGroup;
	[_group, 500, 15] spawn lambs_wp_fnc_taskRush;
	_units append units _group;
};

[
	{
		// PFH_GETVAR(_this,"_timer",[])
		// PFH_GETVAR(_this,"_isFinished",[])

		PFH_GETPARAM(_this,_targetPos,0)
		PFH_GETPARAM(_this,_units,1)

		//Update
		if(_timer < 10 && _timer > 0) then {
			[ 
				_targetPos, 
				_units, 
				"Frigate", 
				15, 
				3, 
				-1,
				2500, 
				1500, 
				1000, 
				400, 
				300, 
				true, 
				true, 
				600, 
				true 
			] call OPTRE_fnc_HEV;
		};

		if(_timer < 45) then {
			ADD(_timer,5)
		} else {
			_isFinished = true;
		};
	},
	5,
	[_targetPos,_units],
	{
		//Start
		_isFinished = false;
		_timer = 0;

		PFH_GETPARAM(_this,_targetPos,0)

		_ship = [_targetPos, 180, 2500, "OPTRE_Frigate_UNSC", GRLIB_side_enemy] call SciFiSupportPLUS_fnc_JumpShipIn;
	},
	{
		//End
		[_ship] call ScifiSupportPLUS_fnc_JumpOut;
	},
	{!_isFinished},
	{_isFinished},
	["_isFinished", "_timer", "_ship"]

] call CBA_fnc_createPerFrameHandlerObject;
