/*
    File: fn_setup_battlegroup_small.sqf
    Authors: Violets
    Date: 2025-11-10
    Last Update: 2025-11-13
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

//2-3 Pelican or Falcon Drops
private _paradrops = [100,100,50];
private _paradrop_veh = [
    [SLK_UNSC_ARMY_FALCON_UNARMED_WOODLAND,75], 
    [SLK_UNSC_MARINES_PELICAN_UNARMED_WOODLAND,25]
];

private _classes = ([_paradrops,_paradrop_veh] call KPLIB_fnc_pickRandomClasses);
ADD(_battlegroup_vehicles,_classes);

//1-2 LAAG
private _cars = [100,50];
private _cars_veh = [
    [SLK_UNSC_MARINES_HOG_LAAG_WOODLAND,75],
    [SLK_UNSC_MARINES_HOG_GAUSS_WOODLAND,20]
];
_battlegroup_vehicles = (_battlegroup_vehicles + ([_cars,_cars_veh] call KPLIB_fnc_pickRandomClasses)); ;

//Low chance of medium armor
//TODO

//2-3 Transport Vics
private _transports = [100,100,25];
private _transport_veh = [
    [OPTRE_UNSC_STALLION_COVERED,50],
    [OPTRE_UNSC_STALLION,50]
];

_classes = ([_transports,_transport_veh] call KPLIB_fnc_pickRandomClasses);
ADD(_battlegroup_vehicles,_classes);

//~1-2 Air vic
private _air = [100,50];
private _air_veh = [
    [SLK_UNSC_ARMY_FALCON_ARMED_WOODLAND,100]
];

_classes = ([_air,_air_veh] call KPLIB_fnc_pickRandomClasses);
ADD(_battlegroup_vehicles,_classes);

[
    _battlegroup_vehicles,
    _battlegroup_infantry,
    _num_odst_drops
]
