/*
    File: fn_spawnBuildingSquadModified.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes Modified by Violets Amber
    Date: 2019-12-03
    Last Update: 2025-11-10
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Spawns given amount of infantry in buildings of given sector at given building positions.

    Parameter(s):
        _type       - Type of infantry. Either "militia" or "army"  [STRING, defaults to "army"]
        _amount     - Amount of infantry units to spawn             [NUMBER, defaults to 0]
        _positions  - Array of Arrays of building positions                   [ARRAY, defaults to []]
        _sector     - Sector where to spawn the units               [STRING, defaults to ""]

    Returns:
        Spawned units [ARRAY]
*/

params [
    ["_type", "army", [""]],
    ["_amount", 0, [0]],
    ["_positions", [], [[]]],
    ["_sector", "", [""]]
];

if (_sector isEqualTo "") exitWith {["Empty string given"] call BIS_fnc_error; []};

// Get classnames array
private _classnames = [[] call KPLIB_fnc_getSquadComp, militia_squad] select (_type == "militia");

// Spawn units
private _grp = createGroup [GRLIB_side_enemy, true];
private _pos = markerPos _sector;
private _unit = objNull;
private _units = [];
private _squadMax = 7;

{
	_grp = createGroup [GRLIB_side_enemy, true];
	private _positionArray = _x call BIS_fnc_arrayShuffle;
	{
		// Skip the rest if the group has the _squadMax units
		if (count (units _grp) >= _squadMax) exitWith {

    	};

		_unit = [selectRandom _classnames, _pos, _grp] call KPLIB_fnc_createManagedUnit;
    	_unit setDir (random 360);
    	_unit setPos (_x);
    	[_unit, _sector] spawn KPLIB_server_fnc_building_defence_ai;
    	_units pushBack _unit;
        sleep 0.2;
	} forEach _positionArray;

	if(count _units >= _amount) exitWith {

	}

} forEach _positions;


_units
