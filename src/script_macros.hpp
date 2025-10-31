#include "\x\cba\addons\main\script_macros_common.hpp"
#include "script_debug.hpp"

// Macros to easily call CBA functions. Can be removed if calling CBA functions directly is desired.
#define CBA_ADDON(component) DOUBLES(CBA,component)

#define CFUNC(function) TRIPLES(CBA,fnc,function)
#define QCFUNC(function) QUOTE(CFUNC(function))

#define CEFUNC(module,function) TRIPLES(DOUBLES(CBA,module),fnc,function)
#define QCEFUNC(module,function) QUOTE(CEFUNC(module,function))

// ADD YOUR MACROS HERE
