#include "script_macros_mission.hpp"
#include "script_debug.hpp"

// Macros to easily call CBA functions. Can be removed if calling CBA functions directly is desired.
#define CBA_ADDON(component) DOUBLES(CBA,component)

#define CFUNC(function) TRIPLES(CBA,fnc,function)
#define QCFUNC(function) QUOTE(CFUNC(function))

#define CEFUNC(module,function) TRIPLES(DOUBLES(CBA,module),fnc,function)
#define QCEFUNC(module,function) QUOTE(CEFUNC(module,function))

// ADD YOUR MACROS HERE

#define GITHUB_PAGE github.com/violetsamber/Selkie-Liberation
#define PROJECT_NAME_PRETTY Selkie Liberation

#define COMMON_FUNCTIONS_NAMESPACE KPLIB
#define COMMON_FUNCTIONS_NAMESPACE_INIT KPLIB_init
#define COMMON_FUNCTIONS_NAMESPACE_SERVER KPLIB_server
#define COMMON_FUNCTIONS_NAMESPACE_CLIENT KPLIB_client
#define COMMON_FUNCTIONS_NAMESPACE_SHARED KPLIB_shared

// Get parameter
#define GET_PARAM(outVar, paramName, paramDefault)          outVar = [paramName,paramDefault] call KPLIB_fnc_getSaveableParam;\
                                                            publicVariable #outVar;\
                                                            [format ["%1: %2", paramName, outVar], "PARAM"] call KPLIB_fnc_log

// Get parameter and convert to bool
#define GET_PARAM_BOOL(outVar, paramName, paramDefault)     outVar = ([paramName,paramDefault] call KPLIB_fnc_getSaveableParam) isEqualTo 1;\
                                                            publicVariable #outVar;\
                                                            [format ["%1: %2", paramName, outVar], "PARAM"] call KPLIB_fnc_log

//Change to true to enable debug logging
#define DEBUG_LOG true
#define LIB_LOG(x) [x] call KPLIB_fnc_log;
#define LIB_DEBUG_LOG(x) [x] call KPLIB_fnc_debugLog;

#define PFH_GETVAR(pfh,var,type) [pfh getVariable var] params [[var, type, [type]]];
#define PFH_GETPARAM(pfh,var,index) private var = pfh getVariable "params" select index;
#define INCREMENT(var) var = (1 + var);

#define SERVER_MIN_FPS 30
#define RANDOM_BATTLEGROUPS_UPDATE_TIME 60

#define SECTOR_TYPE_TOWER QUOTE(tower)
#define SECTOR_TYPE_TOWN QUOTE(capture)
#define SECTOR_TYPE_FACTORY QUOTE(factory)
#define SECTOR_TYPE_MILITARY QUOTE(military)
#define SECTOR_TYPE_BIGTOWN QUOTE(bigtown)

#define SECTOR_HASHMAP_TYPE 0
#define SECTOR_HASHMAP_NAME 1
#define SECTOR_HASHMAP_POS  2

#define BATTLEGROUP_TYPE_MIN 0
#define BATTLEGROUP_TYPE_MAX 4

#define COMPILE_FINAL_PRESET(var1,var2,var3) compileFinal preprocessFileLineNumbers QUOTE(presets\var1\var2\var3.sqf)

#define COMPILE_FINAL_OPFOR_ODST(var1) COMPILE_FINAL_PRESET(opfor,var1,setup_odst)
#define COMPILE_FINAL_OPFOR_PARATROOPERS(var1) COMPILE_FINAL_PRESET(opfor,var1,setup_paratroopers)
#define COMPILE_FINAL_OPFOR_PRESET(var1) COMPILE_FINAL_PRESET(opfor,var1,setup_classes)
#define COMPILE_FINAL_OPFOR_BATTLEGROUP(var1,var2) COMPILE_FINAL_PRESET(opfor,var1,setup_battlegroup_##var2)

//compileFinal preprocessFileLineNumbers presets\opfor\var1\setup_classes.sqf

#define KPLIB_SQUADTYPE_ARMY "army"
#define KPLIB_SQUADTYPE_MILITIA "militia"
