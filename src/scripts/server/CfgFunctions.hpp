class COMMON_FUNCTIONS_NAMESPACE_SERVER {
    class server_highcommand {
        file = "scripts\server\highcommand";

        class highcommand                   {ext = ".fsm";};
    };

    class server_sector {
        file = "scripts\server\sector";

        class destroyFob                    {};
        class sectorMonitor                 {ext = ".fsm";};
        class spawnSectorCrates             {};
        class spawnSectorIntel              {};
    };

    class server_support {
        file = "scripts\server\support";

        class createSuppModules             {};
    };

    class server_ai {
        file = "scripts\server\ai";
        class add_civ_waypoints     {};
        class add_defense_waypoints {};
        class battlegroup_ai        {};
        class building_defence_ai   {};
        class patrol_ai             {};
        class KPLIB_server_fnc_prisonner_ai          {};
        class troup_transport       {};
    };
};