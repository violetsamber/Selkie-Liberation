if ( GRLIB_civilian_activity > 0 ) then {
    for [ {_i=0}, {_i < GRLIB_civilians_amount}, {_i=_i+1} ] do { [] spawn KPLIB_server_fnc_manage_one_civilian_patrol };
};
