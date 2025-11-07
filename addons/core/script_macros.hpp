#include "\x\cba\addons\main\script_macros_common.hpp"
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
#define INCREMENT(var) var = (1 + var);

#define SERVER_MIN_FPS 30
#define RANDOM_BATTLEGROUPS_UPDATE_TIME 60
