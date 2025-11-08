/*
    File: fn_random_battlegroups.sqf
    Author: Violets
    Date: 2025-11-5
    Last Update: 2025-11-08
    License: GNU GENERAL PUBLIC LICENSE - https://www.gnu.org/licenses/gpl-3.0.en.html

    Description:
        Starts the random battlegroups logic;

    Parameter(s):

    Returns:
*/

#include "../FunctionsInclude.hpp"

SLKLIB_RandomBattlegroups_CurrentTimer = 0;
SLKLIB_RandomBattlegroups_ActivateTime = call KPLIB_server_fnc_rnd_bg_getNewSleeptime;
[
    { call KPLIB_server_fnc_rnd_bg_update; },
    RANDOM_BATTLEGROUPS_UPDATE_TIME
] call CBA_fnc_addPerFrameHandler;
