#define MAINPREFIX z
#define PREFIX slklib
#define SUBPREFIX addons

// Enables debug mode. Comment out on release.
//#define DEBUG_MODE_FULL

#include "script_version.hpp"

#define VERSION     MAJOR.MINOR
#define VERSION_STR MAJOR.MINOR.PATCH
#define VERSION_AR  MAJOR,MINOR,PATCH,BUILD

#define VERSION_CONFIG version = VERSION; versionStr = QUOTE(MAJOR.MINOR.PATCH); versionAr[] = {VERSION_AR}

// Define requried CBA version.
#define REQUIRED_VERSION 2.20

// Set your addon display name here.
#ifdef COMPONENT_BEAUTIFIED
    #define COMPONENT_NAME QUOTE(Selkie Liberation - COMPONENT_BEAUTIFIED)
#else
    #define COMPONENT_NAME QUOTE(Selkie Liberation - COMPONENT)
#endif
