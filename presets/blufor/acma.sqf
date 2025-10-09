/*
    Needed Mods:
    - Operation Trebuchet
    - Operation Trebuchet: First Contact
    - HEV Patch
*/

/*
    --- Support classnames ---
    Each of these should be unique.
    The same classnames for different purposes may cause various unpredictable issues with player actions.
    Or not, just don't try!
*/
FOB_typename = "Land_Cargo_HQ_V1_F";                                    // This is the main FOB HQ building.
FOB_box_typename = "B_Slingload_01_Cargo_F";                            // This is the FOB as a container.
FOB_truck_typename = "OPTRE_m1087_stallion_device_unsc";                                // This is the FOB as a vehicle.
Arsenal_typename = "OPTRE_Weapon_Crate_Marines_S";                                   // This is the virtual arsenal as portable supply crates.
Respawn_truck_typename = "OPTRE_M12_FAV_APC_MED";                        // This is the mobile respawn (and medical) truck.
huron_typename = "14TH_D77H_TCI_ARMED";                       // This is Spartan 01, a multipurpose mobile respawn as a helicopter.
crewman_classname = "14CAT_ACMA_Crewman";                                         // This defines the crew for vehicles.
pilot_classname = "14CAT_ACMA_Pilot";                                      // This defines the pilot for helicopters.
KP_liberation_little_bird_classname = "14th_falcon_armed";              // These are the little birds which spawn on the Freedom or at Chimera base.
KP_liberation_boat_classname = "optre_catfish_mg_f";                         // These are the boats which spawn at the stern of the Freedom.
KP_liberation_truck_classname = "OPTRE_m1087_stallion_unsc";            // These are the trucks which are used in the logistic convoy system.
KP_liberation_small_storage_building = "ContainmentArea_02_forest_F";     // A small storage area for resources.
KP_liberation_large_storage_building = "ContainmentArea_01_forest_F";     // A large storage area for resources.
KP_liberation_recycle_building = "Land_RepairDepot_01_green_F";           // The building defined to unlock FOB recycling functionality.
KP_liberation_air_vehicle_building = "B_Radar_System_01_F";             // The building defined to unlock FOB air vehicle functionality.
KP_liberation_spartan_building = "Land_OPTRE_hard_tent_urban";          // The building defined to unlock FOB Spartan recruiting.
KP_liberation_ODST_building = "OPTRE_RS_ConsoleDoor";            // The building defined to allow ODST call-ins.
KP_liberation_heli_slot_building = "Land_HelipadSquare_F";              // The helipad used to increase the GLOBAL rotary-wing cap.
KP_liberation_plane_slot_building = "Land_TentHangar_V1_F";             // The hangar used to increase the GLOBAL fixed-wing cap.
KP_liberation_supply_crate = "CargoNet_01_box_F";                       // This defines the supply crates, as in resources.
KP_liberation_ammo_crate = "B_CargoNet_01_ammo_F";                      // This defines the ammunition crates.
KP_liberation_fuel_crate = "CargoNet_01_barrels_F";                     // This defines the fuel crates.

/*
    --- Friendly classnames ---
    Each array below represents one of the 7 pages within the build menu.
    Format: ["vehicle_classname",supplies,ammunition,fuel],
    Example: ["B_APC_Tracked_01_AA_F",300,150,150],
    The above example is the NATO IFV-6a Cheetah, it costs 300 supplies, 150 ammunition and 150 fuel to build.
    IMPORTANT: The last element inside each array must have no comma at the end!
*/
infantry_units = [
	["14CAT_ACMA_Autorifleman",5,0,0],
    ["14CAT_ACMA_Crewman",5,0,0],
    ["14CAT_ACMA_Breacher",10,0,0],
    ["14CAT_ACMA_Rifleman_BR45",10,0,0],
    ["14CAT_ACMA_Rifleman_MA3A",10,0,0],
    ["14CAT_ACMA_Medic_MA3A",10,0,0]
];

spartan_units = [
    ["OPTRE_Spartan2_Soldier_TeamLeader",50,15,0],
    ["OPTRE_Spartan2_Soldier_Rifleman_AR",50,15,0],
    ["OPTRE_Spartan2_Soldier_Rifleman_BR",50,15,0],
    ["OPTRE_Spartan2_Soldier_Rifleman_AT",50,15,0],
    ["OPTRE_Spartan2_Soldier_Corpsman",50,15,0],
    ["OPTRE_Spartan2_Soldier_Scout",50,15,0],
    ["OPTRE_Spartan2_Soldier_Engineer",50,15,0],
    ["OPTRE_Spartan2_Soldier_Scout_Sniper",50,15,0],
    ["OPTRE_Spartan2_Soldier_Automatic_Rifleman",50,15,0],
    ["OPTRE_Spartan2_Soldier_Marksman",50,15,0],
    ["OPTRE_Spartan3_Soldier_TeamLeader",40,10,0],
    ["OPTRE_Spartan3_Soldier_Rifleman_AR",40,10,0],
    ["OPTRE_Spartan3_Soldier_Rifleman_BR",40,10,0],
    ["OPTRE_Spartan3_Soldier_Rifleman_AT",40,10,0],
    ["OPTRE_Spartan3_Soldier_Corpsman",40,10,0],
    ["OPTRE_Spartan3_Soldier_Scout",40,10,0],
    ["OPTRE_Spartan3_Soldier_Engineer",40,10,0],
    ["OPTRE_Spartan3_Soldier_Scout_Sniper",40,10,0],
    ["OPTRE_Spartan3_Soldier_Automatic_Rifleman",40,10,0],
    ["OPTRE_Spartan3_Soldier_Marksman",40,10,0]
];

light_vehicles = [
    ["OPTRE_m1087_stallion_unsc",0,0,50],                               // Truck
    ["OPTRE_M1087_stallion_cover_unsc",0,0,50],                         // Covered Truck
    ["OPTRE_M274_ATV",0,0,10],                                           // Mongoose
    ["OPTRE_M12_FAV",0,0,20],                                           // Open back Warthog with 2 seats
	["OPTRE_M813_TT",0,0,40],                                           // Open Back Warthog with 6 seats
	["OPTRE_M12_FAV_APC",0,0,40],                                       // Covered back Warthog with 4 seats
	["OPTRE_M12_LRV",0,15,50],                                          // Classic Warthog
	["OPTRE_M12A1_LRV",0,50,50],                                        // Rocket Hog
	["OPTRE_M12G1_LRV",0,100,50],                                        // Gauss Hog
	["OPTRE_M12R_AA",0,100,50],                                          // Guided AA Hog
	["optre_catfish_mg_f",0,5,10],                                      // MG Boat
    ["optre_catfish_atgm_f",0,10,10],						            // ATGM Boat
    ["optre_catfish_gauss_f",0,10,10],							        // Gauss Boat
    ["optre_catfish_aa_f",0,10,10]							            // AA Boat
];

heavy_vehicles = [
    ["OPTRE_M411_APC_UNSC",0,0,150],                                   // Bison APC
	["OPTRE_M412_IFV_UNSC",0,200,150],                                    // Bison IFV
	["OPTRE_M413_MGS_UNSC",0,300,150],                                 // Bison MGS
	["OPTRE_M494",0,250,200],                                            // Oryx IFV
	["OPTRE_M808B_UNSC",0,500,400],                                   // Classic Scorpion
	["OPTRE_M808BM_UNSC",0,550,400],                                  // Scorpion with RCWS Turret
	["OPTRE_M808S",0,600,500],                                        // Advanced Scorpion with larger cannon
    ["OPTRE_M808L",0,600,500],                                        // SpecOps Advanced Scorpion with larger cannon and dozer blade
	["OPTRE_M808B2",0,500,400],                                        // AA Scorpion
    ["OPTRE_M808B2A1",0,600,400],                                      // AA Scorpion with Guided Missiles
	["OPTRE_M850_UNSC",0,800,800],                                    // Grizzly (Double barrel tank)
	["OPTRE_M875_SPH",0,1500,400],								        // Artillery Tank
    ["OPTRE_M313_UNSC",0,0,250]                                       // Elephant
];

air_vehicles = [
	["OPTRE_Wombat_S",0,0,30],                                         // Wombat Drone
	["OPTRE_Wombat_B",0,150,30],                                        // Wombat Drone with Missile pods
	["OPTRE_Wombat",0,50,30],                                          // Wombat Drone with Gunpods
    ["14th_falcon_unarmed",0,0,100],                                      // Unarmed Falcon
    ["14th_falcon_armed",0,210,100],                                // Armed Falcon with Doorguns
	["OPTRE_AV22_Sparrowhawk",0,300,200],								// Sparrowhawk with fixed and turret autocannons
	["OPTRE_AV22A_Sparrowhawk",0,300,200],                            // Sparrowhawk with fixed gatlings and laser turret
	["OPTRE_AV22B_Sparrowhawk",0,300,200],                            // Sparrowhawk with fixed autocannons and laser turret
	["OPTRE_AV22C_Sparrowhawk",0,300,200],                            // Sparrowhawk with fixed gatlings and autocannon turret
	["OPTRE_UNSC_hornet_CAP",0,75,125],                                 // Hornet
	["OPTRE_UNSC_hornet_CAS",0,75,125],                                 // Hornet
    ["14TH_D77H_TCI_ARMED",0,400,400],                               // SOCOM Pelican (extra seats in back)
	["OPTRE_YSS_1000_A_VTOL",0,600,400]                               // Sabre
];

static_vehicles = [
	["OPTRE_Static_M247T_Tripod",0,5,0],
    ["OPTRE_Static_M247T_Spartan_Tripod",0,5,0],	
	["OPTRE_Static_M247H_Tripod",0,5,0],
    ["OPTRE_Static_M247H_Spartan_Tripod",0,5,0],
    ["OPTRE_Static_M247H_Shielded_Tripod",0,5,0],	
    ["OPTRE_Static_M247H_Shielded_Spartan_Tripod",0,5,0],													
	["OPTRE_Static_M41",0,15,0],
    ["OPTRE_LAU65D_pod",0,30,0],
	["OPTRE_Static_Gauss",0,50,0],
    ["OPTRE_Static_ATGM",0,40,0],
	["OPTRE_Static_AA",0,100,0],
	["OPTRE_Static_FG75_CMA",0,40,0],
    ["OPTRE_Lance",0,150,0],       
    ["OPTRE_Scythe",0,400,0],
    ["OPTRE_Scythe_AA",0,300,0]  	  	
];

buildings = [
	["Land_OPTRE_blast_barrier",0,0,0],
	["Land_optre_milwall_segment",0,0,0],
	["Land_optre_milwall_hub",0,0,0],
	["Land_optre_milwall_corner",0,0,0],
	["Land_optre_milwall_gateXL",0,0,0],	
	["Land_optre_milwall_gate",0,0,0],
	["Land_OPTRE_M72_barrier",0,0,0],
	["Land_OPTRE_M72S_barrier",0,0,0],	
	["Land_OPTRE_ONI_barrier",0,0,0],
    ["Land_OPTRE_Monument",0,0,0],
    ["Land_OPTRE_hard_tent_grn",0,0,0],
    ["Land_OPTRE_field_bunk_open",0,0,0],
    ["Land_OPTRE_field_bunk_double",0,0,0],
    ["Land_OPTRE_generator",0,0,0],
    ["Land_OPTRE_FridgeONI_Drab",0,0,0],
    ["Land_OPTRE_FridgeONI",0,0,0],
    ["Land_OPTRE_Holotable",0,0,0],
    ["OPTRE_holotable_sm",0,0,0],
    ["OPTRE_holotable_sm_wd",0,0,0],
    ["OPTRE_holotable_sm_dt",0,0,0],
    ["OPTRE_holotable_sm_at",0,0,0],
    ["OPTRE_serverrack",0,0,0],
    ["Land_OPTRE_IV_Drip",0,0,0],
    ["Land_OPTRE_Stretcher",0,0,0],
	["Land_OPTRE_medical_tent_grn",0,0,0],
	["Land_OPTRE_watchtower_woodland",0,0,0],
    ["Land_OPTRE_unsc_airpad_light",0,0,0],
    ["Land_Small_Light_Column",0,0,0],
    ["Land_OPTRE_Light_Column_Orange",0,0,0],
    ["Land_OPTRE_Light_Column_snow_orange",0,0,0],
    ["Land_Colony_Light_Street",0,0,0],
    ["Land_OPTRE_fusion_coil",0,0,0],
    ["Land_Cargo_House_V1_F",0,0,0],
    ["Land_Cargo_Patrol_V1_F",0,0,0],
    ["Land_Cargo_Tower_V1_F",0,0,0],
    ["Land_Cargo_House_V1_F",0,0,0],
    ["Land_Cargo_Patrol_V1_F",0,0,0],
    ["Land_Cargo_Tower_V1_F",0,0,0],
    ["OPTRE_CTF_Flag_UNSCBlue",0,0,0],
    ["OPTRE_CTF_Flag_GreenArmy",0,0,0],
    ["OPTRE_CTF_Flag_UNSCWhite",0,0,0],
    ["OPTRE_CTF_Flag_UNSCRed",0,0,0],
    ["Flag_NATO_F",0,0,0],
    ["Flag_US_F",0,0,0],
    ["BWA3_Flag_Ger_F",0,0,0],
    ["Flag_UK_F",0,0,0],
    ["Flag_White_F",0,0,0],
    ["Land_Medevac_house_V1_F",0,0,0],
    ["Land_Medevac_HQ_V1_F",0,0,0],
    ["Flag_RedCrystal_F",0,0,0],
    ["CamoNet_BLUFOR_F",0,0,0],
    ["CamoNet_BLUFOR_open_F",0,0,0],
    ["CamoNet_BLUFOR_big_F",0,0,0],
    ["Land_PortableLight_single_F",0,0,0],
    ["Land_PortableLight_double_F",0,0,0],
    ["Land_LampSolar_F",0,0,0],
    ["Land_LampHalogen_F",0,0,0],
    ["Land_LampStreet_small_F",0,0,0],
    ["Land_LampAirport_F",0,0,0],
    ["Land_HelipadCircle_F",0,0,0],                                     // Strictly aesthetic - as in it does not increase helicopter cap!
    ["Land_HelipadRescue_F",0,0,0],                                     // Strictly aesthetic - as in it does not increase helicopter cap!
    ["PortableHelipadLight_01_blue_F",0,0,0],
    ["PortableHelipadLight_01_green_F",0,0,0],
    ["PortableHelipadLight_01_red_F",0,0,0],
    ["Land_CampingChair_V1_F",0,0,0],
    ["Land_CampingChair_V2_F",0,0,0],
    ["Land_CampingTable_F",0,0,0],
    ["MapBoard_altis_F",0,0,0],
    ["MapBoard_stratis_F",0,0,0],
    ["MapBoard_seismic_F",0,0,0],
    ["Land_Pallet_MilBoxes_F",0,0,0],
    ["Land_PaperBox_open_empty_F",0,0,0],
    ["Land_PaperBox_open_full_F",0,0,0],
    ["Land_PaperBox_closed_F",0,0,0],
    ["Land_DieselGroundPowerUnit_01_F",0,0,0],
    ["Land_ToolTrolley_02_F",0,0,0],
    ["Land_WeldingTrolley_01_F",0,0,0],
    ["Land_Workbench_01_F",0,0,0],
    ["Land_GasTank_01_blue_F",0,0,0],
    ["Land_GasTank_01_khaki_F",0,0,0],
    ["Land_GasTank_01_yellow_F",0,0,0],
    ["Land_GasTank_02_F",0,0,0],
    ["Land_BarrelWater_F",0,0,0],
    ["Land_BarrelWater_grey_F",0,0,0],
    ["Land_WaterBarrel_F",0,0,0],
    ["Land_WaterTank_F",0,0,0],
    ["Land_BagFence_Round_F",0,0,0],
    ["Land_BagFence_Short_F",0,0,0],
    ["Land_BagFence_Long_F",0,0,0],
    ["Land_BagFence_Corner_F",0,0,0],
    ["Land_BagFence_End_F",0,0,0],
    ["Land_BagBunker_Small_F",0,0,0],
    ["Land_BagBunker_Large_F",0,0,0],
    ["Land_BagBunker_Tower_F",0,0,0],
    ["Land_HBarrier_1_F",0,0,0],
    ["Land_HBarrier_3_F",0,0,0],
    ["Land_HBarrier_5_F",0,0,0],
    ["Land_HBarrier_Big_F",0,0,0],
    ["Land_HBarrierWall4_F",0,0,0],
    ["Land_HBarrierWall6_F",0,0,0],
    ["Land_HBarrierWall_corner_F",0,0,0],
    ["Land_HBarrierWall_corridor_F",0,0,0],
    ["Land_HBarrierTower_F",0,0,0],
    ["Land_CncBarrierMedium_F",0,0,0],
    ["Land_CncBarrierMedium4_F",0,0,0],
    ["Land_Concrete_SmallWall_4m_F",0,0,0],
    ["Land_Concrete_SmallWall_8m_F",0,0,0],
    ["Land_CncShelter_F",0,0,0],
    ["Land_CncWall1_F",0,0,0],
    ["Land_CncWall4_F",0,0,0],
    ["Land_Sign_WarningMilitaryArea_F",0,0,0],
    ["Land_Sign_WarningMilAreaSmall_F",0,0,0],
    ["Land_Sign_WarningMilitaryVehicles_F",0,0,0],
    ["Land_Razorwire_F",0,0,0],
    ["Land_ClutterCutter_large_F",0,0,0]
];

support_vehicles = [
    [KP_liberation_small_storage_building,0,0,0],
    [KP_liberation_large_storage_building,0,0,0],
    [KP_liberation_recycle_building,250,0,0],
    [KP_liberation_air_vehicle_building,1000,0,0],
    [KP_liberation_spartan_building,300,200,0],
    [KP_liberation_ODST_building,400,0,0],
    [KP_liberation_heli_slot_building,200,0,0],
    [KP_liberation_plane_slot_building,400,0,0],
    [Arsenal_typename,0,50,0],
    [Respawn_truck_typename,100,0,25],
    [FOB_box_typename,250,500,0],
    [FOB_truck_typename,250,500,75],
    ["OPTRE_m1087_stallion_unsc_resupply",0,200,50],
	["OPTRE_m1087_stallion_unsc_refuel",0,0,250],
	["OPTRE_m1087_stallion_unsc_repair",200,0,50],
    ["ACE_medicalSupplyCrate_advanced",50,0,0],
    ["ACE_Box_82mm_Mo_HE",50,40,0],
    ["ACE_Box_82mm_Mo_Smoke",50,10,0],
    ["ACE_Box_82mm_Mo_Illum",50,10,0],
    ["ACE_Wheel",10,0,0],
    ["ACE_Track",10,0,0],
    ["USAF_missileCart_W_AGM114",50,150,0],                             // Missile Cart (AGM-114)
    ["USAF_missileCart_AGMMix",50,150,0],                               // Missile Cart (AGM-65 Mix)
    ["USAF_missileCart_AGM1",50,150,0],                                 // Missile Cart (AGM-65D)
    ["USAF_missileCart_AGM2",50,150,0],                                 // Missile Cart (AGM-65E)
    ["USAF_missileCart_AGM3",50,150,0],                                 // Missile Cart (AGM-65K)
    ["USAF_missileCart_AA1",50,150,0],                                  // Missile Cart (AIM-9M/AIM-120)
    ["USAF_missileCart_AA2",50,150,0],                                  // Missile Cart (AIM-9X/AIM-120)
    ["USAF_missileCart_GBU12_green",50,150,0],                          // Missile Cart (GBU12 Green)
    ["USAF_missileCart_GBU12_maritime",50,150,0],                       // Missile Cart (GBU12 Maritime)
    ["USAF_missileCart_GBU12",50,150,0],                                // Missile Cart (GBU12)
    ["USAF_missileCart_Gbu31",50,150,0],                                // Missile Cart (GBU31)
    ["USAF_missileCart_GBU39",50,150,0],                                // Missile Cart (GBU39)
    ["USAF_missileCart_Mk82",50,150,0],                                 // Missile Cart (Mk82)
    ["CUP_B_TowingTractor_NATO",50,0,25],                               // Towing Tractor
    ["rhsusf_M977A4_REPAIR_BKIT_usarmy_wd",325,0,75],                   // M977A4 Repair
    ["rhsusf_M978A4_BKIT_usarmy_wd",125,0,275],                         // M978A4 Fuel
    ["rhsusf_M977A4_AMMO_BKIT_usarmy_wd",125,200,75],                   // M977A4 Ammo
    ["B_Slingload_01_Repair_F",200,0,0],                                // Huron Repair
    ["B_Slingload_01_Fuel_F",0,0,200],                                 // Huron Fuel
    ["B_Slingload_01_Ammo_F",0,200,0]                                  // Huron Ammo
];

/*
    --- Squads ---
    Pre-made squads for the commander build menu.
    These shouldn't exceed 10 members.
*/

// Light infantry squad.
blufor_squad_inf_light = [
	"14CAT_ACMA_TeamLeader_MA3A",
	"14CAT_ACMA_Rifleman_BR45",
	"14CAT_ACMA_Rifleman_MA3A",
	"14CAT_ACMA_Rifleman_MA3A",
	"14CAT_ACMA_TeamLeader_BR45",
	"14CAT_ACMA_Autorifleman",
	"14CAT_ACMA_Autorifleman",
	"14CAT_ACMA_Marksman",
	"14CAT_ACMA_Medic_MA3A",
	"14CAT_ACMA_Breacher"
];

// Heavy infantry squad.
blufor_squad_inf = [
	"14CAT_ACMA_TeamLeader_MA3A",
	"14CAT_ACMA_Rifleman_MA3A",
	"14CAT_ACMA_Rifleman_MA3A",
	"14CAT_ACMA_TeamLeader_BR45",
	"14CAT_ACMA_Autorifleman",
	"14CAT_ACMA_Autorifleman",
	"14CAT_ACMA_Autorifleman",
	"14CAT_ACMA_Autorifleman",
	"14CAT_ACMA_Marksman",
	"14CAT_ACMA_Medic_MA3A",
	"14CAT_ACMA_Breacher"
];

// AT specialists squad.
blufor_squad_at = [
	"14CAT_ACMA_TeamLeader_BR45",
	"14CAT_ACMA_Rifleman_BR45",
	"14CAT_ACMA_Rifleman_BR45",
	"OPTRE_UNSC_Marine_Soldier_AT_Specialist",
	"OPTRE_UNSC_Marine_Soldier_AT_Specialist",
	"OPTRE_UNSC_Marine_Soldier_AT_Specialist",
	"14CAT_ACMA_Medic_MA3A",
	"14CAT_ACMA_Rifleman_BR45"
];

// AA specialists squad.
blufor_squad_aa = [
	"14CAT_ACMA_TeamLeader_BR45",
	"14CAT_ACMA_Rifleman_MA3A",
	"14CAT_ACMA_Rifleman_MA3A",
	"OPTRE_UNSC_Marine_Soldier_AA_Specialist",
	"OPTRE_UNSC_Marine_Soldier_AA_Specialist",
	"OPTRE_UNSC_Marine_Soldier_AA_Specialist",
	"14CAT_ACMA_Medic_MA3A",
	"14CAT_ACMA_Rifleman_BR45"
];

// Force recon squad.
blufor_squad_recon = [
	"14CAT_ACMA_Rifleman_MA3A",
	"14CAT_ACMA_Rifleman_MA3A",
	"14CAT_ACMA_Rifleman_MA3A",
	"14CAT_ACMA_Rifleman_MA3A",
	"14CAT_ACMA_Rifleman_BR45",
	"14CAT_ACMA_Rifleman_BR45",
	"14CAT_ACMA_Rifleman_BR45",
	"14CAT_ACMA_Rifleman_BR45",
	"14CAT_ACMA_Medic_MA3A",
	"14CAT_ACMA_Breacher"
];

// Paratroopers squad (The units of this squad will automatically get parachutes on build)
blufor_squad_para = [
	"14CAT_ACMA_Rifleman_MA3A",
	"14CAT_ACMA_Rifleman_MA3A",
	"14CAT_ACMA_Rifleman_MA3A",
	"14CAT_ACMA_Rifleman_MA3A",
	"14CAT_ACMA_Rifleman_BR45",
	"14CAT_ACMA_Rifleman_BR45",
	"14CAT_ACMA_Rifleman_BR45",
	"14CAT_ACMA_Medic_MA3A",
	"14CAT_ACMA_Breacher"
];

/*
    --- Elite vehicles ---
    Classnames below have to be unlocked by capturing military bases.
    Which base locks a vehicle is randomized on the first start of the campaign.
*/
elite_vehicles = [
	"OPTRE_YSS_1000_A_VTOL",												//F/A-181 Black Wasp II
	"OPTRE_M850_UNSC",
    "OPTRE_M808B2A1",
    "OPTRE_M313_UNSC",
    "OPTRE_M808L",
    "OPTRE_AV22_Sparrowhawk",
    "OPTRE_AV22A_Sparrowhawk",
    "OPTRE_AV22B_Sparrowhawk",
    "OPTRE_AV22C_Sparrowhawk",
    "OPTRE_M875_SPH",
    "OPTRE_M494",
    "OPTRE_Scythe",
    "OPTRE_Scythe_AA",
    "OPTRE_M808BM_UNSC",
    "OPTRE_M808S",
    "OPTRE_M808B2"
];
