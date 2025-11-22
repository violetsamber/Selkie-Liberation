class COMMON_FUNCTIONS_NAMESPACE_CLIENT {
    class client_tutorial {
        file = "scripts\client\tutorial";

        class handleCrateStorageTask        {};
        class handleHealCivTask             {};
        class handleTakePowTask             {};
        class tutorial                      {ext = ".fsm";};
    };

    class client_spawn {
        file = "scripts\client\spawn";
        class spawn_camera {}; 
    };

    class client_ui {
        file = "scripts\client\ui";
        class cinematic_camera {};
        class write_credit_line {};
    };

    class client_ammoboxes {
        file = "scripts\client\ammoboxes";
        class do_load_box {};
    };

    class client_misc {
        file = "scripts\client\misc";
        class kp_fuel_consumption {};
        class kp_vehicle_permissions {};
        class init_markers {};
    };

    class client_notifications {
        file = "scripts\client\notifications";
        class taskNotificationHandler {};
    };

    class client_tasks {
        file = "scripts\client\tasks";
        class taskUpdateHandler {};
    };

    class client_debug {
        file = "scripts\client\debug";
        class setSectorDefenseTime {};  
    };
};
