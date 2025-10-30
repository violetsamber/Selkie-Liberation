while {true} do {
    if (GRLIB_shorter_nights && (dayTime > 20 || dayTime < 4)) then {
        setTimeMultiplier (GRLIB_time_factor * 4);
    } else {
        setTimeMultiplier GRLIB_time_factor;
    };
    sleep 10;
};
