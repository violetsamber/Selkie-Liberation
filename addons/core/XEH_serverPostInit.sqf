["[XEH_serverPostInit] ServerPostInit","INIT"] call KPLIB_fnc_log;

[] call compileFinal preprocessFileLineNumbers "scripts\server\init_server.sqf";

if (isDedicated && !hasInterface){
    setViewDistance 1600;
};

KPLIB_init = true;

if (isServer) then {
    ["[XEH_serverPostInit] Nofifying clients server is ready","INIT"] call KPLIB_fnc_log;
    KPLIB_initServer = true;
    publicVariable "KPLIB_initServer";
};

