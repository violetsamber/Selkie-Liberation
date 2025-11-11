/*
    File: fn_setup_battlegroup_tiny.sqf
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

#include "FunctionsInclude.hpp"

//TODO Move these definitions to be per faction
params [
    ["_pfh", objNull]
];

private _battlegroup_vehicles = [];
private _battlegroup_infantry = [];
private _num_odst_drops = 0;

//Setup here

//1-2 Pelican or Falcon Drops
private _paradrops = [100,50];
private _paradrop_veh = [
    ["Selkie_Army_Falcon_Unarmed_Woodland",75], 
    ["Selkie_UNSC_Marines_Pelican_Unarmed_Halo3",25]
];

_battlegroup_vehicles pushBack [_paradrops,_paradrop_veh] call KPLIB_pickRandomClasses; 

//1 LAAG
_battlegroup_vehicles pushBack "Selkie_UNSC_Marines_Hog_LAAG_Halo3";

//1-2 Transport Vics
private _transports = [100,25];
private _transport_veh = [
    ["OPTRE_m1087_stallion_cover_unsc",50],
    ["OPTRE_m1087_stallion_unsc",50]
];

_battlegroup_vehicles pushBack [_transports,_transport_veh] call KPLIB_pickRandomClasses; 

//~1 Air veh
private _air = [50];
private _air_veh = [
    ["Selkie_Army_Falcon_Armed_Woodland",100]
];

_battlegroup_vehicles pushBack [_air,_air_veh] call KPLIB_pickRandomClasses; 

[
    _battlegroup_vehicles,
    _battlegroup_infantry,
    _num_odst_drops
]
