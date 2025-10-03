/*
    Needed Mods:
    - None

    Optional Mods:
    - None
*/

// Enemy infantry classes
opfor_officer = "OPTRE_FC_Elite_Major";									//Major
opfor_squad_leader = "OPTRE_FC_Elite_Minor";							//Minor
opfor_team_leader = "OPTRE_FC_Elite_Major";								//Major
opfor_sentry = "OPTRE_Jackal_F";										//Shield Jackal
opfor_rifleman = "WBK_Grunt_2";									        //Grunt Major
opfor_rpg = "WBK_Grunt_3";						                        //Grunt Fuel Rod
opfor_grenadier = "WBK_Grunt_1";							    	    //Grunt Minor
opfor_machinegunner = "WBK_Grunt_2";						    		//Grunt Major
opfor_heavygunner = "WBK_Grunt_5";							        	//Grunt Basic 2
opfor_marksman = "OPTRE_Jackal_Marksman_F";			    				//Jackal (Needle Rifle)
opfor_sharpshooter = "OPTRE_Jackal_Sharpshooter_F";						//Jackal (Carbine)
opfor_sniper = "OPTRE_Jackal_Sniper_F";									//Jackal (Beam Rifle)
opfor_at = "WBK_Grunt_3";									        	//Grunt Fuel Rod
opfor_aa = "WBK_Grunt_3";									            //Grunt Fuel Rod
opfor_medic = "WBK_Grunt_1";							        		//Grunt Basic
opfor_engineer = "WBK_Grunt_5";						            		//Grunt Basic 2
opfor_paratrooper = "OPTRE_FC_Elite_Zealot";						    //Zealot

// Enemy vehicles used by secondary objectives.
opfor_mrap = "OPTRE_FC_Spectre_Transport";                                 	// Transport Spectre 
opfor_mrap_armed = "OPTRE_FC_Spectre_AI";                                   // Anti-Infantry Spectre
opfor_transport_helo = "OPTRE_FC_Spirit";									// Spirit Dropship
opfor_transport_truck = "OPTRE_FC_Spectre_Transport";					    // Specter Transport
opfor_ammobox_transport = "OPTRE_m1015_mule_ins";							// Tempest Transport (Open) -> Has to be able to transport resource crates! (There's no Covenant equivalent that can carry crates, fortunately this only affects the convoy hijack mission.)
opfor_fuel_truck = "OPTRE_m1015_mule_fuel_ins";								//Tempest Fuel (No covenant equivalent, but only used in FOB hunts...unless you completely exclude them from the template like I did!)
opfor_ammo_truck = "OPTRE_m1015_mule_ammo_ins";								//Tempest Ammo (No covenant equivalent, but only used in FOB hunts...unless you completely exclude them from the template like I did!)
opfor_fuel_container = "Land_Pod_Heli_Transport_04_fuel_F";					//Taru Fuel Pod (No covenant equivalent, but only used in FOB hunts...unless you completely exclude them from the template like I did!)
opfor_ammo_container = "Land_Pod_Heli_Transport_04_ammo_F";					//Taru Ammo Pod (No covenant equivalent, but only used in FOB hunts...unless you completely exclude them from the template like I did!)
opfor_flag = "OPTRE_FC_Cov_Node";											//Covenant spire...stick...thing

/* Adding a value to these arrays below will add them to a one out of however many in the array, random pick chance.
Therefore, adding the same value twice or three times means they are more likely to be chosen more often. */

/* Militia infantry. Lightweight soldier classnames the game will pick from randomly as sector defenders.
Think of them like garrison or military police forces, which are more meant to control the local population instead of fighting enemy armies. */
militia_squad = [
	"OPTRE_Jackal_F",
	"OPTRE_Jackal_F",
	"OPTRE_Jackal_Major_F",
	"OPTRE_Jackal_Infantry2_F",
	"OPTRE_Jackal_Infantry2_F",
	"OPTRE_Jackal_Infantry2_F",
	"OPTRE_Jackal_Infantry_F",
	"OPTRE_Jackal_Infantry_F",
	"OPTRE_Jackal_Sharpshooter_F"
];

// Militia vehicles. Lightweight vehicle classnames the game will pick from randomly as sector defenders. Can also be empty for only infantry milita.
militia_vehicles = [
	"OPTRE_FC_Ghost",
	"OPTRE_FC_Ghost_Needler",
	"OPTRE_FC_T26_AI"
                                                
];

// All enemy vehicles that can spawn as sector defenders and patrols at high enemy combat readiness (aggression levels).
opfor_vehicles = [
	"OPTRE_FC_Wraith_Tank",
	"OPTRE_FC_Wraith_Tank",
	"OPTRE_FC_Wraith",
	"OPTRE_FC_Wraith",
	"OPTRE_FC_Spectre_AI",
	"OPTRE_FC_Ghost"
];

// All enemy vehicles that can spawn as sector defenders and patrols but at a lower enemy combat readiness (aggression levels).
opfor_vehicles_low_intensity = [
	"OPTRE_FC_Wraith",
	"OPTRE_FC_Spectre_AI",
	"OPTRE_FC_Ghost_Armor",
	"OPTRE_FC_Ghost"

];

// All enemy vehicles that can spawn as battlegroups, either assaulting or as reinforcements, at high enemy combat readiness (aggression levels).
opfor_battlegroup_vehicles = [
	"OPTRE_FC_Spirit",
	"OPTRE_FC_Spirit_Concussion",
	"OPTRE_FC_Spirit",
	"OPTRE_FC_Spirit_Concussion",
	"OPTRE_FC_Type26B_Banshee",
	"OPTRE_FC_Wraith_Tank",
	"OPTRE_FC_Wraith",
	"OPTRE_FC_Wraith_Tank",
	"OPTRE_FC_Wraith",
	"OPTRE_FC_Spectre_AI",
	"OPTRE_FC_Spectre_Transport"
];

// All enemy vehicles that can spawn as battlegroups, either assaulting or as reinforcements, at lower enemy combat readiness (aggression levels).
opfor_battlegroup_vehicles_low_intensity = [
	"OPTRE_FC_Spirit",
	"OPTRE_FC_Spirit",
	"OPTRE_FC_Type26B_Banshee",
	"OPTRE_FC_Wraith",
	"OPTRE_FC_Spectre_AI",
	"OPTRE_FC_Spectre_AI",
	"OPTRE_FC_Spectre_Transport",
	"OPTRE_FC_Spectre_Transport"

];

/* All vehicles that spawn within battlegroups (see the above 2 arrays) and also hold 8 soldiers as passengers.
If something in this array can't hold all 8 soldiers then buggy behaviours may occur.    */
opfor_troup_transports = [
	"OPTRE_FC_Spirit",
	"OPTRE_FC_Spirit_Concussion",
	"OPTRE_FC_Spectre_Transport"
];

// Enemy rotary-wings that will need to spawn in flight.
opfor_choppers = [
	"OPTRE_FC_Type26B_Banshee",
	"OPTRE_FC_Spirit_Concussion"
];

// Enemy fixed-wings that will need to spawn in the air.
opfor_air = [
	"OPTRE_FC_Type26B_Banshee"									// Banshee
];

opfor_boat = [];												//Covenant don't use boats
