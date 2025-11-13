/*
    File: setup_debug.sqf
    Authors: 
    Date: 2025-11-12
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

//TODO Make these unit tested

private _classes = [
    [OPTRE_UNSC_STALLION_COVERED,"m1087_stallion_cover_unsc"],
    [OPTRE_UNSC_STALLION,"m1087_stallion_unsc"],
    [OPTRE_ORYX_APC_AIE_RCWS,"OPTRE_M493_AIE_RCWS"],
    [OPTRE_ORYX_APC_M37_RCWS,"OPTRE_M493_M37_RCWS"],
    [OPTRE_SCORPION,"OPTRE_M808B_UNSC"],
    [OPTRE_SCORPION_B,"OPTRE_M808BM_UNSC"],
    [SLK_UNSC_ARMY_TURRET_M247A1_WOODLAND,"Selkie_UNSC_Army_StaticMG_M247A1_WoodlandB"],
    [SLK_UNSC_ARMY_TURRET_M247H_WOODLAND,"Selkie_UNSC_Army_StaticMG_M247H_WoodlandB"],
    [SLK_UNSC_ARMY_TURRET_AA_WOODLAND,"Selkie_UNSC_Army_Emplacement_AA_WoodlandB"],
    [SLK_UNSC_ARMY_TURRET_AT_WOODLAND,"Selkie_UNSC_Army_Emplacement_AT_WoodlandB"],
    [SLK_UNSC_ARMY_TURRET_GAUSS_WOODLAND,"Selkie_UNSC_Army_Emplacement_Gauss_WoodlandB"],
    [SLK_UNSC_ARMY_TURRET_LAAG_WOODLAND,"Selkie_UNSC_Army_Emplacement_LAAG_WoodlandB"],
    [SLK_UNSC_ARMY_FALCON_UNARMED_WOODLAND,"Selkie_UNSC_Army_Falcon_Unarmed_Woodland"],
    [SLK_UNSC_ARMY_FALCON_ARMED_WOODLAND,"Selkie_UNSC_Army_Falcon_Armed_WoodlandA"],
    [SLK_UNSC_MARINES_HOG_UNARMED_WOODLAND,"Selkie_UNSC_Marines_Hog_Unarmed_Halo3"],
    [SLK_UNSC_MARINES_HOG_TRANSPORT_WOODLAND,"Selkie_UNSC_Marines_Hog_Transport_Halo3"],
    [SLK_UNSC_MARINES_HOG_LAAG_WOODLAND,"Selkie_UNSC_Marines_Hog_LAAG_Halo3"],
    [SLK_UNSC_MARINES_HOG_GAUSS_WOODLAND,"Selkie_UNSC_Marines_Hog_Gauss_Halo3"],
    [SLK_UNSC_MARINES_HOG_AA_WOODLAND,"Selkie_UNSC_Marines_Hog_AA_Halo3"],
    [SLK_UNSC_MARINES_HOG_AT_WOODLAND,"Selkie_UNSC_Marines_Hog_AT_Halo3"],
    [SLK_UNSC_MARINES_BISON_50MM_WOODLAND,"Selkie_UNSC_Marines_Bison_50mm_Halo3"],
    [SLK_UNSC_MARINES_BISON_105MM_WOODLAND,"Selkie_UNSC_Marines_Bison_105mm_Halo3"],
    [SLK_UNSC_MARINES_BISON_UNARMED_WOODLAND,"Selkie_UNSC_Marines_Bison_Unarmed_Halo3"],
    [SLK_UNSC_MARINES_ORYX_WOODLAND,"Selkie_UNSC_Marines_Oryx_Halo3"],
    [SLK_UNSC_MARINES_HORNET,"Selkie_UNSC_Marines_Hornet_Halo3"],
    [SLK_UNSC_MARINES_PELICAN_UNARMED_WOODLAND,"Selkie_UNSC_Marines_Pelican_Unarmed_Halo3"],
    [SLK_UNSC_MARINES_PELICAN_ARMED_WOODLAND,"Selkie_UNSC_Marines_Pelican_Armed_Halo3"]
];

systemChat "----UNSC_WOODLAND_DEBUG----";
private _testPassed = 0;
private _testFailed = 0;

{
    private _a = _x select 0;
    private _b = _x select 1;
    private _isTrue = (_a == _b);
    private _message = format["%1 is not equal to %2",_a,_b];
    if(!_isTrue) then {
        systemChat _message;
        INC(_testFailed)
    } else {
        INC(_testPassed)
    };
} forEach _classes;
systemChat format["Passed: %1 Failed: %2",_testPassed,_testFailed];;
systemChat "----UNSC_WOODLAND_DEBUG----";