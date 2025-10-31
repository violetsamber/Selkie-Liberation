#include "\x\cba\addons\main\script_macros_common.hpp"
#include "script_debug.hpp"

// Macros to easily call CBA functions. Can be removed if calling CBA functions directly is desired.
#define CBA_ADDON(component) DOUBLES(CBA,component)

#define CFUNC(function) TRIPLES(CBA,fnc,function)
#define QCFUNC(function) QUOTE(CFUNC(function))

#define CEFUNC(module,function) TRIPLES(DOUBLES(CBA,module),fnc,function)
#define QCEFUNC(module,function) QUOTE(CEFUNC(module,function))

// ADD YOUR MACROS HERE

// Get parameter
#define GET_PARAM(outVar, paramName, paramDefault)          outVar = [paramName,paramDefault] call KPLIB_fnc_getSaveableParam;\
                                                            publicVariable #outVar;\
                                                            [format ["%1: %2", paramName, outVar], "PARAM"] call KPLIB_fnc_log

// Get parameter and convert to bool
#define GET_PARAM_BOOL(outVar, paramName, paramDefault)     outVar = ([paramName,paramDefault] call KPLIB_fnc_getSaveableParam) isEqualTo 1;\
                                                            publicVariable #outVar;\
                                                            [format ["%1: %2", paramName, outVar], "PARAM"] call KPLIB_fnc_log
