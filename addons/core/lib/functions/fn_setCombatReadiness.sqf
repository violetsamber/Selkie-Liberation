/*
    File: fn_setCombatReadiness.sqf
    Author: Violets
    Date: 2025-10-27
    Last Update: 2025-11-06
    License: GNU GENERAL PUBLIC LICENSE - https://www.gnu.org/licenses/gpl-3.0.en.html

    Description:
        Sets the SLKLIB_combat_readiness varible and clamps its value to a max of SLKLIB_combat_readiness_cap

    Parameter(s):
        _amount - Amount of combat readiness to add

    Returns:
        none
*/

params [
    ["_value", 0, [0]]
];

private _readiness = 0 max (_value);
SLKLIB_combat_readiness = SLKLIB_combat_readiness_cap min (_readiness);
