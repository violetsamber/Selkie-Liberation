/*
    Needed Mods:
    - None

    Optional Mods:
    - None
*/

// Enemy infantry classes
opfor_officer = 	  "Selkie_UNSC_Army_Officer_WoodlandB";
opfor_squad_leader =  "Selkie_UNSC_Army_SquadLeader_WoodlandB";				
opfor_team_leader =   "Selkie_UNSC_Army_TeamLead_WoodlandB";								
opfor_sentry =        "Selkie_UNSC_Army_RiflemaidB_WoodlandB";								
opfor_rifleman =      "Selkie_UNSC_Army_RiflemaidA_WoodlandB";									        
opfor_rpg =           "Selkie_UNSC_Army_MissileSpecialist_WoodlandB";						                        
opfor_grenadier =     "Selkie_UNSC_Army_GrenadierMA37_WoodlandB";							    	    
opfor_machinegunner = "Selkie_UNSC_Army_Autoriflemaid_WoodlandB";						    		
opfor_heavygunner =   "Selkie_UNSC_Army_HeavyGunner_WoodlandB";							        	
opfor_marksman =      "Selkie_UNSC_Army_Marksmaid_WoodlandB";			    				
opfor_sharpshooter =  "Selkie_UNSC_Army_Marksmaid_WoodlandB";						
opfor_sniper =        "Selkie_UNSC_Army_Sniper_WoodlandB";									
opfor_at =            "Selkie_UNSC_Army_MissileSpecialist_WoodlandB";									        	
opfor_aa =            "Selkie_UNSC_Army_MissileSpecialist_WoodlandB";									            
opfor_medic =         "Selkie_UNSC_Army_Medic_WoodlandB";							        		
opfor_engineer =      "Selkie_UNSC_Army_Engineer_WoodlandB";						            		
opfor_paratrooper =   "OPTRE_UNSC_ODST_Soldier_TeamLeader";

// Enemy vehicles used by secondary objectives.
opfor_mrap =              "OPTRE_M813_TT";
opfor_mrap_armed =        "Selkie_UNSC_Army_Hog_LAAG_WoodlandB";                                 
opfor_transport_helo =    "Selkie_UNSC_Army_Pelican_Unarmed_Woodland";						
opfor_transport_truck =   "OPTRE_m1087_stallion_cover_unsc";
opfor_ammobox_transport = "OPTRE_m1087_stallion_unsc";
opfor_fuel_truck =        "OPTRE_m1087_stallion_unsc_refuel";
opfor_ammo_truck =        "OPTRE_m1087_stallion_unsc_resupply";
opfor_fuel_container =    "B_Slingload_01_Fuel_F";
opfor_ammo_container =    "B_Slingload_01_Ammo_F";
opfor_flag =              "land_optre_bootcamp_UNSC_Flag";

/* Adding a value to these arrays below will add them to a one out of however many in the array, random pick chance.
Therefore, adding the same value twice or three times means they are more likely to be chosen more often. */

/* Militia infantry. Lightweight soldier classnames the game will pick from randomly as sector defenders.
Think of them like garrison or military police forces, which are more meant to control the local population instead of fighting enemy armies. */
militia_squad = [
	"Selkie_UNSC_Army_RiflemaidA_WoodlandB",
	"Selkie_UNSC_Army_RiflemaidB_WoodlandB",
	"Selkie_UNSC_Army_Marksmaid_WoodlandB",
	"Selkie_UNSC_Army_Marksmaid_WoodlandB",
	"Selkie_UNSC_Army_Breacher_WoodlandB",
	"Selkie_UNSC_Army_Breacher_WoodlandB",
	"Selkie_UNSC_Army_Medic_WoodlandB",
	"Selkie_UNSC_Army_TeamLead_WoodlandB"
];

// Militia vehicles. Lightweight vehicle classnames the game will pick from randomly as sector defenders. Can also be empty for only infantry milita.
militia_vehicles = [
	"Selkie_UNSC_Army_Hog_LAAG_WoodlandB",
	"Selkie_UNSC_Army_Hog_LAAG_WoodlandB",
	"Selkie_UNSC_Army_Hog_LAAG_WoodlandB",
	"Selkie_UNSC_Army_Hog_Gauss_WoodlandB"       
];

// All enemy vehicles that can spawn as sector defenders and patrols at high enemy combat readiness (aggression levels).
opfor_vehicles = [
	"OPTRE_M808B_UNSC",
	"OPTRE_M808B_UNSC",
	"Selkie_UNSC_Army_Hog_LAAG_WoodlandB",
	"Selkie_UNSC_Army_Hog_LAAG_WoodlandB",
	"Selkie_UNSC_Army_Hog_LAAG_WoodlandB",
	"Selkie_UNSC_Army_Hog_LAAG_WoodlandB"
];

// All enemy vehicles that can spawn as sector defenders and patrols but at a lower enemy combat readiness (aggression levels).
opfor_vehicles_low_intensity = [
	"Selkie_UNSC_Army_Hog_LAAG_WoodlandB",
	"Selkie_UNSC_Army_Hog_LAAG_WoodlandB",
	"Selkie_UNSC_Army_Hog_LAAG_WoodlandB",
	"OPTRE_M808B_UNSC"

];

// All enemy vehicles that can spawn as battlegroups, either assaulting or as reinforcements, at high enemy combat readiness (aggression levels).
opfor_battlegroup_vehicles = [
	"Selkie_UNSC_Army_Pelican_Armed_Woodland",
	"Selkie_UNSC_Army_Pelican_Armed_Woodland",
	"Selkie_UNSC_Army_Falcon_Armed_WoodlandB",
	"Selkie_UNSC_Army_Falcon_Armed_WoodlandB",
	"Selkie_UNSC_Army_Falcon_Armed_WoodlandB",
	"Selkie_UNSC_Army_Hog_LAAG_WoodlandB",
	"Selkie_UNSC_Army_Hog_LAAG_WoodlandB",
	"Selkie_UNSC_Army_Hog_LAAG_WoodlandB",
	"Selkie_UNSC_Army_Hog_LAAG_WoodlandB",
	"OPTRE_M808B_UNSC",
	"OPTRE_M808B_UNSC",
	"OPTRE_M808B_UNSC"
];

// All enemy vehicles that can spawn as battlegroups, either assaulting or as reinforcements, at lower enemy combat readiness (aggression levels).
opfor_battlegroup_vehicles_low_intensity = [
	"Selkie_UNSC_Army_Pelican_Armed_Woodland",
	"Selkie_UNSC_Army_Falcon_Armed_WoodlandB",
	"Selkie_UNSC_Army_Falcon_Armed_WoodlandB",
	"Selkie_UNSC_Army_Hog_LAAG_WoodlandB",
	"Selkie_UNSC_Army_Hog_LAAG_WoodlandB",
	"Selkie_UNSC_Army_Hog_LAAG_WoodlandB",
	"Selkie_UNSC_Army_Hog_LAAG_WoodlandB",
	"OPTRE_M808B_UNSC",
	"OPTRE_M808B_UNSC"
];

/* All vehicles that spawn within battlegroups (see the above 2 arrays) and also hold 8 soldiers as passengers.
If something in this array can't hold all 8 soldiers then buggy behaviours may occur.    */
opfor_troup_transports = [
	"Selkie_UNSC_Army_Falcon_Unarmed_Woodland",
	"Selkie_UNSC_Army_Falcon_Unarmed_Woodland",
	"Selkie_UNSC_Army_Falcon_Unarmed_Woodland",
	"Selkie_UNSC_Army_Falcon_Unarmed_Woodland"
];

// Enemy rotary-wings that will need to spawn in flight.
opfor_choppers = [
	"Selkie_UNSC_Army_Pelican_Armed_Woodland",
	"Selkie_UNSC_Army_Falcon_Armed_WoodlandB",
	"Selkie_UNSC_Army_Falcon_Armed_WoodlandB",
	"Selkie_UNSC_Army_Falcon_Armed_WoodlandB",
	"Selkie_UNSC_Army_Falcon_Armed_WoodlandB",
	"Selkie_UNSC_Army_Falcon_Armed_WoodlandB"
];

// Enemy fixed-wings that will need to spawn in the air.
opfor_air = [
	"OPTRE_YSS_1000_A",
	"Selkie_UNSC_Army_Falcon_Armed_WoodlandB",
	"Selkie_UNSC_Army_Falcon_Armed_WoodlandB"
];

opfor_boat = [
	"optre_catfish_mg_f"
];

//----NEW VARIBLES----
opfor_breacher =      "Selkie_UNSC_Army_Breacher_WoodlandB";

// Patrol vehicles
patrol_vehicles = [
	"Selkie_UNSC_Army_Hog_LAAG_WoodlandB",
	"Selkie_UNSC_Army_Hog_Gauss_WoodlandB",
	"OPTRE_m1087_stallion_cover_unsc",
	"OPTRE_m1087_stallion_cover_unsc",
	"OPTRE_m1087_stallion_unsc",
	"OPTRE_m1087_stallion_unsc",
	"OPTRE_M813_TT",
	"OPTRE_M813_TT",
	"OPTRE_M12_FAV",
	"OPTRE_M12_FAV",
	"OPTRE_M12_FAV_APC",
	"OPTRE_M12_FAV_APC",
];

// Patrol vehicles transport
patrol_transport_vehicles = [
	"OPTRE_m1087_stallion_cover_unsc",
	"OPTRE_m1087_stallion_unsc"
];