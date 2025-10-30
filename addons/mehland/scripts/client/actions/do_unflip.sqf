params [ "_veh" ];

if ( !isNull _veh ) then {
    _veh setpos [(getPos _veh) select 0,(getPos _veh) select 1, 0.5];
    _veh setVectorUp surfaceNormal position _veh;
};
