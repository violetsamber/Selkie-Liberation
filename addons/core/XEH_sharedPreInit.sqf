// This script will be executed once in 3DEN, main menu and before briefing has started for every mission

#include "script_component.hpp"

["[XEH_SharedPreInit] SharedPreInit","INIT"] call KPLIB_fnc_log;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

// CBA CONFIG MENU DEFINITIONS GO HERE
