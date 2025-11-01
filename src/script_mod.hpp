#define MAINPREFIX z
// Set your prefix here.
#define PREFIX slklib
#define SUBPREFIX addons

// Enables debug mode. Comment out on release.
//#define DEBUG_MODE_FULL

#include "script_version.hpp"

// Define requried CBA version.
#define REQUIRED_VERSION 2.20

// Set your addon display name here.
#ifdef COMPONENT_BEAUTIFIED
    #define COMPONENT_NAME QUOTE(Selkie Liberation - COMPONENT_BEAUTIFIED)
#else
    #define COMPONENT_NAME QUOTE(Selkie Liberation - COMPONENT)
#endif
