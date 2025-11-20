## 1.0.5
ADDED:

FIXED:
- Fixed _battlgroup_infantry and _battlegroup_vehicles arrays being edited but not saved to the PFH
- Crates not being carrayable

CHANGED:
- Disable Friendly AI ODST support
- Removed Squad colors broadcast script as its obsolete in current arma
- Replaced main menu music with halo music
- Reduced filesize by optimizing some images and removing extra

## 1.0.4
ADDED:

FIXED:

CHANGED:
- Reduced tower min squad spawn counts to 2
- Reduced required CR for random battlegroups by half
- Moved notification for where the attack is going to be to the start


## 1.0.3
ADDED:
- ODST drops added back
- Unique class definition for paratroopers
- Added battlegroup size notifications
- Added defiend battlegroup compositions
- Added additional optre resistance gear 

FIXED:
- Paratrooper aircraft slowing down over the sector
- Fixed optre resistance not spawning

CHANGED:
- Reduced town spawn lag by adding sleep commands to town scripts
- Refactored town spawing and update loop to pfh

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
