/*
    File: fn_setup_battlegroup_small.sqf
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

#include "FunctionsInclude.hpp"

params [
    ["_pfh", objNull]
];

private _battlegroup_vehicles = [];
private _battlegroup_infantry = [];
private _num_odst_drops = 0;

//Setup here

//2-3 Pelican or Falcon Drops
//1-2 LAAG
//2 Transport Vics
//~1-2 Air vic
//Low chance of medium armor

[
    _battlegroup_vehicles,
    _battlegroup_infantry,
    _num_odst_drops
]
