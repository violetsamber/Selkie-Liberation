manage_asymIED = compileFinal preprocessFileLineNumbers "scripts\server\asymmetric\ied\manage_asymIED.sqf";
sector_guerilla = compileFinal preprocessFileLineNumbers "scripts\server\asymmetric\random\sector_guerilla.sqf";
asym_sector_ambush = compileFinal preprocessFileLineNumbers "scripts\server\asymmetric\random\asym_sector_ambush.sqf";
civinfo_task = compileFinal preprocessFileLineNumbers "scripts\server\civinformant\tasks\civinfo_task.sqf";

execVM "scripts\client\misc\synchronise_vars.sqf";
execVM "scripts\client\misc\synchronise_eco.sqf";
execVM "scripts\server\offloading\show_fps.sqf";
