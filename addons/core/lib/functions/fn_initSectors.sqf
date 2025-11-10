/*
    File: fn_initSectors.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2020-04-29
    Last Update: 2025-11-10
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Sorts the placed sector markers to their category array.

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/

//TODO add functionality to have an instant return using hashmaps 
#include "../FunctionsInclude.hpp"

sectors_airspawn = [];
sectors_boatspawn = [];
sectors_allSectors = [];
sectors_bigtown = [];
sectors_capture = [];
sectors_factory = [];
sectors_military = [];
sectors_opfor = [];
sectors_tower = [];

sectors_hashmap = createHashMap;
//Type
//Name
//Position

{
    switch (true) do {
        case (_x find SECTOR_TYPE_BIGTOWN == 0): {
            sectors_bigtown pushBack _x; 
            sectors_allSectors pushBack _x;
            sectors_hashmap set [_x,[SECTOR_TYPE_BIGTOWN, markerText _x, markerPos _x]];
        };
        case (_x find SECTOR_TYPE_TOWN == 0): {
            sectors_capture pushBack _x; 
            sectors_allSectors pushBack _x;
            sectors_hashmap set [_x,[SECTOR_TYPE_TOWN, markerText _x, markerPos _x]];
        };
        case (_x find SECTOR_TYPE_FACTORY == 0): {
            sectors_factory pushBack _x; 
            sectors_allSectors pushBack _x;
            sectors_hashmap set [_x,[SECTOR_TYPE_FACTORY, markerText _x, markerPos _x]];
        };
        case (_x find SECTOR_TYPE_MILITARY == 0): {
            sectors_military pushBack _x; 
            sectors_allSectors pushBack _x;
            sectors_hashmap set [_x,[SECTOR_TYPE_MILITARY, markerText _x, markerPos _x]];
        };
        case (_x find SECTOR_TYPE_TOWER == 0): {
            sectors_tower pushBack _x; 
            _x setMarkerTextLocal format ["%1 %2",markerText _x, mapGridPosition (markerPos _x)];
            sectors_allSectors pushBack _x;
            sectors_hashmap set [_x,[SECTOR_TYPE_TOWER, markerText _x, markerPos _x]];
        };
        case (_x find "opfor_airspawn" == 0): {sectors_airspawn pushBack _x;};
        case (_x find "opfor_boatspawn" == 0): {sectors_boatspawn pushBack _x;};
        case (_x find "opfor_point" == 0): {sectors_opfor pushBack _x;};
    };
} forEach allMapMarkers;

true
