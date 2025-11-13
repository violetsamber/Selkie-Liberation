/*
    File: fn_setup_battlegroup_tiny.sqf
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

//TODO Move these definitions to be per faction
params [
    ["_pfh", objNull]
];

private _battlegroup_vehicles = [];
private _battlegroup_infantry = [];
private _num_odst_drops = 0;

//1-2 Pelican or Falcon Drops
private _paradrops = [100,50];
private _paradrop_veh = [
    [SLK_UNSC_ARMY_FALCON_UNARMED_WOODLAND,75], 
    [SLK_UNSC_MARINES_PELICAN_UNARMED_WOODLAND,25]
];

private _classes = ([_paradrops,_paradrop_veh] call KPLIB_fnc_pickRandomClasses);
ADD(_battlegroup_vehicles,_classes);

//1 LAAG
_battlegroup_vehicles pushBack SLK_UNSC_MARINES_HOG_LAAG_WOODLAND;

//1-2 Transport Vics
private _transports = [100,25];
private _transport_veh = [
    [OPTRE_UNSC_STALLION_COVERED,50],
    [OPTRE_UNSC_STALLION,50]
];

_classes = ([_transports,_transport_veh] call KPLIB_fnc_pickRandomClasses);
ADD(_battlegroup_vehicles,_classes);

//~1 Air veh
private _air = [50];
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
