/*
    File: fn_addCombatReadiness.sqf
    Author: Violets
    Date: 2025-10-27
    Last Update: 2025-10-27
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Adds combat_readiness varible and clamps its value to a max of GRLIB_combat_readiness_cap

    Parameter(s):
        _amount - Amount of combat_readiness to add

    Returns:
        none
*/

params [
    ["_amount", 0, [0]]
];

combat_readiness = 0 max (combat_readiness + _amount);
combat_readiness = GRLIB_combat_readiness_cap min (combat_readiness + _amount);