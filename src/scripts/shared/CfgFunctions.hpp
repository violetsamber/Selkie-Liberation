class COMMON_FUNCTIONS_NAMESPACE_SHARED {
    class shared_root {
        file = "scripts\shared";
        class kill_manager {};
    };

    class shared_asymm {
        file = "scripts\asymmetric";
        class asymm_notifications {};
    };

    class shared_civinformant {
        file = "scripts\civinformant";
        class civinfo_delivered {};
        class civinfo_escort {};
        class civinfo_notifications {};
    };

    class shared_remotecall_ailogistics {
        file = "scripts\shared\remotecall\ailogistics";
        class add_logiGroup_remote_call {};
        class add_logiTruck_remote_call {};
        class del_logiGroup_remote_call {};
        class del_logiTruck_remote_call {};
        class save_logi_remote_call {};
    };

    class shared_remotecall {
        file = "scripts\shared\remotecall";
        class remote_call_battlegroup {};
        class remote_call_endgame {};
        class remote_call_fob {};
        class remote_call_incoming {};
        class remote_call_intel {};
        class remote_call_prisonner {};
        class remote_call_sector {};
    };
};