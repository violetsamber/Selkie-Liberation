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
        class prisonner_ai          {};
        class troup_transport       {};
    };

    class server_battlegroup {
        file = "scripts\server\battlegroup";
        // class counter_battlegroup   {};
        // class random_battlegroups   {};
        // class readiness_increase    {};
        class spawn_air             {};
        class spawn_battlegroup     {};
        class spawn_boat            {};
        class odstDrop              {};
    };

    // class server_game {
    //     file = "scripts\server\game";
    //     class apply_default_permissions {};
    //     class cleanup_vehicles          {};
    // };
};