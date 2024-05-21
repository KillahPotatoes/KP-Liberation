if ( KPLIB_param_civActivity > 0 ) then {
    for [ {_i=0}, {_i < KPLIB_civilians_amount}, {_i=_i+1} ] do { [] spawn manage_one_civilian_patrol };
};
