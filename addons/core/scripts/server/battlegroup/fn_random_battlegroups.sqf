/*
    File: fn_random_battlegroups.sqf
    Author: Violets
    Date: 2025-11-5
    Last Update: 2025-11-06
    License: GNU GENERAL PUBLIC LICENSE - https://www.gnu.org/licenses/gpl-3.0.en.html

    Description:
        Starts the random battlegroups logic;

    Parameter(s):

    Returns:
*/

#include "../FunctionsInclude.hpp"

//Call PFH ever 60 seconds
//Subtract from the timer and then see if the battlegroup should be spawned

SLKLIB_RandomBattlegroups_CurrentTimer = 0;
SLKLIB_RandomBattlegroups_ActivateTime = call KPLIB_server_fnc_rnd_bg_getNewSleeptime;

SLKLIB_RandomBattlegroups_MinSleeptime = 2700;

[
    { call KPLIB_server_fnc_rnd_bg_update; },
    RANDOM_BATTLEGROUPS_UPDATE_TIME
] call CBA_fnc_addPerFrameHandler;

// sleep (900 / GRLIB_csat_aggressivity);
// private _sleeptime = 0;

// while {GRLIB_csat_aggressivity > 0.9 && GRLIB_endgame == 0} do {

//     _sleeptime =  (3600 + (random 3600)) / (([] call KPLIB_fnc_getOpforFactor) * GRLIB_csat_aggressivity);
//     if SLKLIB_combat_readiness >= 80) then {_sleeptime = _sleeptime * 0.75;};
//     if SLKLIB_combat_readiness >= 90) then {_sleeptime = _sleeptime * 0.75;};
//     if SLKLIB_combat_readiness >= 95) then {_sleeptime = _sleeptime * 0.75;};
//     _sleeptime = MIN_SLEEPTIME max _sleeptime;

//     sleep _sleeptime;

//     if (!isNil "GRLIB_last_battlegroup_time") then {
//         waitUntil {
//             sleep 5;
//             diag_tickTime > (GRLIB_last_battlegroup_time + (2100 / GRLIB_csat_aggressivity))
//         };
//     };

//     if (
//         (count (allPlayers - entities "HeadlessClient_F") >= (6 / GRLIB_csat_aggressivity))
//         && {SLKLIB_combat_readiness >= (60 - (5 * GRLIB_csat_aggressivity))}
//         && {[] call KPLIB_fnc_getOpforCap < GRLIB_battlegroup_cap}
//         && {diag_fps > 15.0}
//     ) then {
//         ["", (random 100) < 25] call KPLIB_server_fnc_spawn_battlegroup;
//     };
// };
