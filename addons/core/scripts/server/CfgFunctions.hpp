class COMMON_FUNCTIONS_NAMESPACE_SERVER {
    class server_highcommand {
        file = "scripts\server\highcommand";

        class highcommand                   {ext = ".fsm";};
    };

    class server_sector {
        file = "scripts\server\sector";

        class destroyFob                {};
        class sectorMonitor             {ext = ".fsm";};
        class spawnSectorCrates         {};
        class spawnSectorIntel          {};
        class attack_in_progress_fob    {};
        class attack_in_progress_sector {};
        class ied_manager               {};
        class manage_one_sector         {};
        class wait_to_spawn_sector      {};
    };

    class server_support {
        file = "scripts\server\support";

        class createSuppModules {};
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

    class server_asymmetric {
        file = "scripts\server\asymmetric";
        class logistic_convoy_ambush {};
        class manage_asymied {};
        class asym_sector_ambush {};
        class sector_guerilla {};
    };

    class server_battlegroup {
        file = "scripts\server\battlegroup";
        // class counter_battlegroup   {};
        class random_battlegroups   {};
        // class readiness_increase    {};
        class spawn_air             {};
        class spawn_battlegroup     {};
        class spawn_boat            {};
        class odstDrop              {};
    };

    class server_rnd_battlegroup {
        file = "scripts\server\battlegroup\random";
        class rnd_bg_update {};
        class rnd_bg_getNewSleeptime {};
    };

    class server_game {
        file = "scripts\server\game";
        // class apply_default_permissions {};
        // class cleanup_vehicles          {};
        class check_victory_conditions {};
    };

    class server_patrols {
        file = "scripts\server\patrols";
        class manage_one_civilian_patrol {};
        class manage_one_enemy_patrol {};
        class manage_one_patrol {};
        class reinforcements_manager {};
        class send_paratroopers {};
    };

    class server_secondary {
        file = "scripts\server\secondary";
        class civ_supplies      {};
        class convoy_hijack     {};
        class fob_hunting       {};
        class search_and_rescue {};
    };

    class server_civinformant {
        file = "scripts\server\civinformant";
        class civinfo_task {};
    };
};
