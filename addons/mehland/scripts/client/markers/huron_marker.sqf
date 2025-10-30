private [ "_huronlocal" ];

"huronmarker" setmarkerTextLocal "Echo 419";

while { true } do {
    _huronlocal = [] call KPLIB_fnc_potatoScan;
    if ( !( isNull _huronlocal) ) then {
        "huronmarker" setMarkerPosLocal (getPos _huronlocal);
    } else {
        "huronmarker" setMarkerPosLocal markers_reset;
    };
    sleep 4.9;
};
