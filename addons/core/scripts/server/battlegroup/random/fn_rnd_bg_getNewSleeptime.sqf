/*
    File: fn_rnd_bg_getNewSleeptime.sqf
    Author: Violets
    Date: 2025-11-5
    Last Update: 2025-11-06
    License: GNU GENERAL PUBLIC LICENSE - https://www.gnu.org/licenses/gpl-3.0.en.html

    Description:
        Calculates the next time in seconds for a random battlegroup to spawn

    Parameter(s):
        

    Returns:
*/

private _sleeptime =  (3600 + (random 3600)) / (([] call KPLIB_fnc_getOpforFactor) * GRLIB_csat_aggressivity);
if (SLKLIB_combat_readiness >= 80) then {_sleeptime = _sleeptime * 0.75;};
if (SLKLIB_combat_readiness >= 90) then {_sleeptime = _sleeptime * 0.75;};
if (SLKLIB_combat_readiness >= 95) then {_sleeptime = _sleeptime * 0.75;};
_sleeptime = SLKLIB_RandomBattlegroups_MinSleeptime max _sleeptime;
_sleeptime;
