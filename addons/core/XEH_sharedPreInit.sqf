// This script will be executed once in 3DEN, main menu and before briefing has started for every mission

#include "script_component.hpp"

["[XEH_sharedPreInit] sharedPreInit","INIT"] call KPLIB_fnc_log;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

// CBA CONFIG MENU DEFINITIONS GO HERE

[
    "SLKLIB_difficulty_modifier",
    "LIST",
    ["STR_PARAMS_DIFFICULTY", ""],
    "Selkie Liberation",
    [
        [0.5,0.75,1,1.25,1.5,2,4,10],
        ["STR_PARAMS_DIFFICULTY1","STR_PARAMS_DIFFICULTY2","STR_PARAMS_DIFFICULTY3","STR_PARAMS_DIFFICULTY4","STR_PARAMS_DIFFICULTY5","STR_PARAMS_DIFFICULTY6","STR_PARAMS_DIFFICULTY7","STR_PARAMS_DIFFICULTY8"],
        4
    ],
    1,
    true
] call CBA_fnc_addSetting;
