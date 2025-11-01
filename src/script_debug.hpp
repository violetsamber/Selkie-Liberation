// Disables compile cache when debug mode is enabled. Makes file patching work.
#ifdef DEBUG_MODE_FULL
    #define DISABLE_COMPILE_CACHE
#endif

// CBA XEH PREP macro override for when compile cache is disabled.
#ifdef DISABLE_COMPILE_CACHE
    #undef PREP
    #define PREP(function) TRIPLES(ADDON,fnc,function) = compile preprocessFileLineNumbers '\MAINPREFIX\PREFIX\SUBPREFIX\COMPONENT_F\functions\DOUBLES(fnc,function).sqf'
#else
    #undef PREP
    #define PREP(function) ['\MAINPREFIX\PREFIX\SUBPREFIX\COMPONENT_F\functions\DOUBLES(fnc,function).sqf', 'TRIPLES(ADDON,fnc,function)'] call SLX_XEH_COMPILE_NEW
#endif

// Fast Recompiling via function
// To Use: [] call ADDON_PREP_RECOMPILE; where ADDON is your prefix, e.g. TUT
#ifdef DISABLE_COMPILE_CACHE
    #define LINKFUNC(x) {call FUNC(x)}
    #define PREP_RECOMPILE_START    if (isNil QUOTE(DOUBLES(ADDON,PREP_RECOMPILE))) then {DOUBLES(ADDON,RECOMPILES) = []; DOUBLES(ADDON,PREP_RECOMPILE) = {{call _x} forEach DOUBLES(ADDON,RECOMPILES);}}; private _recomp = {
    #define PREP_RECOMPILE_END      }; call _recomp; DOUBLES(ADDON,RECOMPILES) pushBack _recomp;
#else
    #define LINKFUNC(x) FUNC(x)
    #define PREP_RECOMPILE_START ; // disabled
    #define PREP_RECOMPILE_END ; // disabled
#endif
