/*
    File: fn_addCombatReadiness.sqf
    Author: Violets
    Date: 2025-10-27
    Last Update: 2025-11-05
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Adds SLKLIB_combat_readiness varible and clamps its value to a max of SLKLIB_combat_readiness_cap

    Parameter(s):
        _amount - Amount of combat rediness to add

    Returns:
        none
*/

params [
    ["_amount", 0, [0]]
];

private _readiness = 0 max (SLKLIB_combat_readiness + _amount);
SLKLIB_combat_readiness = SLKLIB_combat_readiness_cap min (_readiness);
