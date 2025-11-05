/*
    File: fn_rnd_bg_update.sqf
    Author: Violets
    Date: 2025-11-5
    Last Update: 2025-11-5
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        CBA PFH function that countsdown to call next random battlegroup.

    Parameter(s):

    Returns:
*/

#include "../../FunctionsInclude.hpp"

SLKLIB_RandomBattlegroups_CurrentTimer = SLKLIB_RandomBattlegroups_CurrentTimer + RANDOM_BATTLEGROUPS_UPDATE_TIME;
[format["[fn_rnd_bg_update] Timer: %1 Activation Time: %2", SLKLIB_RandomBattlegroups_CurrentTimer, SLKLIB_RandomBattlegroups_ActivateTime]] call KPLIB_fnc_log;

if (SLKLIB_RandomBattlegroups_CurrentTimer >= SLKLIB_RandomBattlegroups_ActivateTime) then 
{
    SLKLIB_RandomBattlegroups_CurrentTimer = 0;
    SLKLIB_RandomBattlegroups_ActivateTime = call KPLIB_server_fnc_rnd_bg_getNewSleeptime;

    /*
    Is the playercount above the threshold for spawning a battlegroup
    Is the SLKLIB_combat_readiness above (60 - (5 * GRLIB_csat_aggressivity))
    Is the Unitcap exceeded
    Is the FPS above 15
    */

    if (
        (count (allPlayers - entities "HeadlessClient_F") >= (6 / GRLIB_csat_aggressivity))
        && {SLKLIB_combat_readiness >= (60 - (5 * GRLIB_csat_aggressivity))}
        && {[] call KPLIB_fnc_getOpforCap < GRLIB_battlegroup_cap}
        && {diag_fps > SERVER_MIN_FPS}
    ) then {
        ["", (random 100) < 25] call KPLIB_server_fnc_spawn_battlegroup;
    } else {
        //Failed to spawn wave check again next iteration
        SLKLIB_RandomBattlegroups_ActivateTime = RANDOM_BATTLEGROUPS_UPDATE_TIME;
    };
};