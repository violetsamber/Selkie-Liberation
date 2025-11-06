class Extended_PreInit_EventHandlers {
    class ADDON {
        // This will be executed once in 3DEN, main menu and before briefing has started for every mission.
        clientInit = "call compile preprocessFileLineNumbers 'XEH_clientPreInit.sqf'";
        serverInit = "call compile preprocessFileLineNumbers 'XEH_serverPreInit.sqf'";
        init =       "call compile preprocessFileLineNumbers 'XEH_sharedPreInit.sqf'";
    };
};

class Extended_PostInit_EventHandlers {
    class ADDON {
        // This will be executed once for each mission, once the mission has started.
        clientInit = "call compile preprocessFileLineNumbers 'XEH_clientPostInit.sqf'";
        serverInit = "call compile preprocessFileLineNumbers 'XEH_serverPostInit.sqf'";
        init =       "call compile preprocessFileLineNumbers 'XEH_sharedPostInit.sqf'";
    };
};
