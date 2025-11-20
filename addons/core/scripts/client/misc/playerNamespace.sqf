/*
    File: playerNamespace.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2020-04-12
    Last Update: 2025-11-19
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Tracks player state values to provide this information for other scripts.
*/

scriptName "KPLIB_playerNamespace";

waitUntil {!isNil "one_synchro_done"};
waitUntil {!isNil "one_eco_done"};
waitUntil {one_synchro_done};
waitUntil {one_eco_done};

private _fobPos = [0, 0, 0];
private _fobDist = 99999;
private _fobName = "";

while {true} do {

    //TODO THIS SHOULD USE TRIGGERS
    // FOB distance, name and position
    if (GRLIB_all_fobs isNotEqualTo []) then {
        _fobPos = [] call KPLIB_fnc_getNearestFob;
        _fobDist = player distance2D _fobPos;
        _fobName = ["", ["FOB", [_fobPos] call KPLIB_fnc_getFobName] joinString " "] select (_fobDist < GRLIB_fob_range);
    } else {
        _fobPos = [0, 0, 0];
        _fobDist = 99999;
        _fobName = "";
    };
    // TODO more self explanatory names, KPLIB_nearestFobDist, KPLIB_currentFobName, KPLIB_nearestFobPos
    player setVariable ["KPLIB_fobDist", _fobDist];
    player setVariable ["KPLIB_fobName", _fobName];
    player setVariable ["KPLIB_fobPos", _fobPos];

    //TODO THIS SHOULD USE AN EVENT
    // Direct acces due to config, commander or admin
    player setVariable ["KPLIB_hasDirectAccess", (getPlayerUID player) in KP_liberation_commander_actions || {player == ([] call KPLIB_fnc_getCommander)} || {serverCommandAvailable "#kick"}];

    //TODO THIS SHOULD USE TRIGGERS
    // Outside of startbase "safezone"
    player setVariable ["KPLIB_isAwayFromStart", (player distance2D startbase) > 1000];

    // Is near an arsenal object | TODO Change this to the arsenal telling players they can access it.  
    if (KP_liberation_mobilearsenal) then {
        player setVariable ["KPLIB_isNearArsenal", (((player nearObjects [Arsenal_typeName, 5]) select {getObjectType _x >= 8}) isNotEqualTo [])];
    };

    // Is near a mobile respawn | TODO Change this to the mobile respawn telling players they can access it.  
    if (KP_liberation_mobilerespawn) then {
        player setVariable ["KPLIB_isNearMobRespawn", ((player nearEntities [[Respawn_truck_typeName, huron_typeName], 10]) isNotEqualTo [])];
    };

    //TODO THIS SHOULD USE TRIGGERS
    // Is near startbase
    player setVariable ["KPLIB_isNearStart", (player distance2D startbase) < 200];


    //TODO THIS SHOULD USE TRIGGERS
    // Nearest activated sector and possible production data
    player setVariable ["KPLIB_nearProd", KP_liberation_production param [KP_liberation_production findIf {(_x select 1) isEqualTo ([100] call KPLIB_fnc_getNearestSector)}, []]];
    player setVariable ["KPLIB_nearSector", [GRLIB_sector_size] call KPLIB_fnc_getNearestSector];

    //HEY WHY IS THIS NOT EVENT BASED
    // Zeus module synced to player
    player setVariable ["KPLIB_ownedZeusModule", getAssignedCuratorLogic player];

    //TODO This should be opt in or removed, also event based
    // Update state in Discord rich presence
    [] call KPLIB_fnc_setDiscordState;

    sleep 1;
};
