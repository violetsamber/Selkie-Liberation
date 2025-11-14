## 1.0.3
ADDED:
- ODST drops added back
- Unique class definition for paratroopers
- Added battlegroup size notifications
- Added defiend battlegroup compositions

FIXED:
- Paratrooper aircraft slowing down over the sector 

CHANGED:
- Reduced town spawn lag by adding sleep commands to town scripts

## 1.0.2
ADDED:
- Selkie Liberation logo thanks to: multicarinata

FIXED:
- Not being able to abort logi routes

CHANGED:
- combat_readiness to SLKLIB_combat_readiness
- refactored spawn battlegroup to CBA pfh, reducing stutter when spawning
- refactored battlegroup ai smoothing out the calls over muliple frames reducing stutter
- refactored send paratroopers to CBA pfh, reducing stutter when spawning

## 1.0.1

ADDED:
- Add defined minimum time for random battlegroups

FIXED:
- Fixed sectors not being captured properly and respawning enemy units

CHANGED:

## 1.0

ADDED:
- Alternate system for enemy patrols between waypoints

FIXED:

CHANGED:
- Refactored entire project to use the hemtt build system
- Refactored large amount of code to use the CFGFunctions system
- Battlegroups changed to be static set of spawns for a proof of concept
- Combat Readiness capped at the SLKLIB_combat_readiness_cap
