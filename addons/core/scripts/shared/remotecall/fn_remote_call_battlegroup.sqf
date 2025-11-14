if ( isDedicated ) exitWith {};

params [ 
    "_battlegroup_position",
    "_size"
 ];

"opfor_bg_marker" setMarkerPosLocal ( markerPos _battlegroup_position );
private _attack_size_name = [_size] call KPLIB_fnc_getAttackSizeName;
private _battlegroup_sector_name = (markerText ( [ 10000, markerPos _battlegroup_position ] call KPLIB_fnc_getNearestSector ));

[ "lib_battlegroup", [_battlegroup_sector_name, _attack_size_name] ] call BIS_fnc_showNotification;

sleep 600;

"opfor_bg_marker" setMarkerPosLocal markers_reset;
