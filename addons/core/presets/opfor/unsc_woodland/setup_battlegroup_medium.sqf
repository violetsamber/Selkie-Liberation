/*
    File: fn_setup_battlegroup_medium.sqf
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

//3-4 Pelican or Falcon Drops
private _paradrops = [100,100,100,50];
private _paradrop_veh = [
    [SLK_UNSC_ARMY_FALCON_UNARMED_WOODLAND,75], 
    [SLK_UNSC_MARINES_PELICAN_UNARMED_WOODLAND,25]
];

private _classes = ([_paradrops,_paradrop_veh] call KPLIB_fnc_pickRandomClasses);
ADD(_battlegroup_vehicles,_classes);

//Low chance of heavy armor
private _heavyArmor = [50];
private _heavyArmor_veh = [
    [OPTRE_SCORPION,50],
    [OPTRE_SCORPION_B,50]
];

_classes = ([_heavyArmor,_heavyArmor_veh] call KPLIB_fnc_pickRandomClasses);
ADD(_battlegroup_vehicles,_classes);

//Medium of medium armor
private _mediumArmor = [25, 25];
private _mediumArmor_veh = [
    [SLK_UNSC_MARINES_BISON_105MM_WOODLAND,100]
];


_classes = ([_mediumArmor,_mediumArmor_veh] call KPLIB_fnc_pickRandomClasses);
ADD(_battlegroup_vehicles,_classes);

//Medium chance of light armor
private _lightArmor = [80];
private _lightArmor_veh = [
    [OPTRE_ORYX_APC_AIE_RCWS,25],
    [OPTRE_ORYX_APC_M37_RCWS,75]
];

_classes = ([_lightArmor,_lightArmor_veh] call KPLIB_fnc_pickRandomClasses);
ADD(_battlegroup_vehicles,_classes);

//2-3 Hogs (LAAG or Gauss)
private _cars = [100,100,50];
private _cars_veh = [
    [SLK_UNSC_MARINES_HOG_LAAG_WOODLAND,75],
    [SLK_UNSC_MARINES_HOG_GAUSS_WOODLAND,25]
];
_classes = ([_cars,_cars_veh] call KPLIB_fnc_pickRandomClasses);
ADD(_battlegroup_vehicles,_classes);

//3 Transport Vics
private _transports = [100,100,100];
private _transport_veh = [
    [OPTRE_UNSC_STALLION_COVERED,50],
    [OPTRE_UNSC_STALLION,50]
];

_classes = ([_transports,_transport_veh] call KPLIB_fnc_pickRandomClasses);
ADD(_battlegroup_vehicles,_classes);

//~1-2 Air vic
private _air = [100,50];
private _air_veh = [
    [SLK_UNSC_ARMY_FALCON_ARMED_WOODLAND,80],
    [SLK_UNSC_MARINES_HORNET,20]
];

_classes = ([_air,_air_veh] call KPLIB_fnc_pickRandomClasses);
ADD(_battlegroup_vehicles,_classes);

[
    _battlegroup_vehicles,
    _battlegroup_infantry,
    _num_odst_drops
]
