private [ "_dialog", "_backpack", "_backpackcontents" ];

if ( isNil "GRLIB_last_halo_jump" ) then { GRLIB_last_halo_jump = -6000; };

if ( GRLIB_halo_param > 1 && ( GRLIB_last_halo_jump + ( GRLIB_halo_param * 60 ) ) >= time ) exitWith {
    hint format [ localize "STR_HALO_DENIED_COOLDOWN", ceil ( ( ( GRLIB_last_halo_jump + ( GRLIB_halo_param * 60 ) ) - time ) / 60 ) ];
};

_dialog = createDialog "liberation_halo";
dojump = 0;
halo_position = getpos player;

_backpackcontents = [];

[ "halo_map_event", "onMapSingleClick", { halo_position = _pos } ] call BIS_fnc_addStackedEventHandler;

"spawn_marker" setMarkerTextLocal (localize "STR_HALO_PARAM");

waitUntil { dialog };
while { dialog && alive player && dojump == 0 } do {
    "spawn_marker" setMarkerPosLocal halo_position;

    sleep 0.1;
};

if ( dialog ) then {
    closeDialog 0;
    sleep 0.1;
};

"spawn_marker" setMarkerPosLocal markers_reset;
"spawn_marker" setMarkerTextLocal "";

[ "halo_map_event", "onMapSingleClick" ] call BIS_fnc_removeStackedEventHandler;

if ( dojump > 0 ) then {
    GRLIB_last_halo_jump = time;
    halo_position = halo_position getPos [random 10, random 360];
    halo_position = [ halo_position select 0, halo_position select 1, GRLIB_halo_altitude];
    halojumping = true;
    sleep 0.1;
    [halo_position,[player],"frigate",30,2,-1,4000,3500,1500,400,200,true,true,600,true] remoteExec["OPTRE_fnc_HEV",2];
    sleep 4;
    halojumping = false;
    
};
