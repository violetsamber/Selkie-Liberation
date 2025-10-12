if ( GRLIB_civilian_activity > 0 ) then {
    for [ {_i=0}, {_i < GRLIB_enemy_patrols_amount}, {_i=_i+1} ] do { [] spawn manage_one_enemy_patrol };
};