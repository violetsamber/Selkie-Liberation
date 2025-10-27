/*
    File: fn_setCombatReadiness.sqf
    Author: Violets
    Date: 2025-10-27
    Last Update: 2025-10-27
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Sets the combat_readiness varible and clamps its value to a max of 300

    Parameter(s):
        _amount - Amount of combat_readiness to add

    Returns:
        none
*/

params [
    ["_amount", 0, [0]]
];

combat_readiness = 300 min (combat_readiness + _amount);