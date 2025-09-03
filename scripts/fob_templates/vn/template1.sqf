private _objects_to_build = [
     [opfor_mrap, [-2.02, 8.35, 0.00], 180.37],
     [opfor_mrap, [-5.42, 8.30, 0.00], 179.70],
     ["vn_o_prop_t102e_01", [-6.14, 12.73, 1.12], 0.00],
     ["Land_vn_helipadcircle_f", [-9.13, -11.11, 0.00], 89.99],
     [opfor_transport_helo, [-9.88, -11.04, -0.01], 89.79],
     ["Land_vn_wf_vehicle_service_point_east", [-3.07, 15.07, 0.00], 179.42],
     ["vn_camonet_blufor_open_f", [9.72, 13.42, 0.00], 179.34],
     ["Land_vn_lampshabby_f", [-8.74, 15.45, 0.00], 161.27],
     [opfor_flag, [1.70, 17.11, 0.00], 0.00],
     ["Land_vn_o_bunker_01", [19.67, -4.09, 0.00], 274.31],
     ["Land_vn_o_trench_firing_01", [17.72, 9.10, 0.00], 90.00],
     ["Land_vn_o_trench_firing_01", [-18.88, -11.12, 0.00], 270.06],
     ["Land_vn_o_trench_firing_01", [-18.55, 10.66, 0.00], 270.06],
     ["Land_vn_guardtower_03_f", [-17.46, 18.41, -0.00], 327.01],
     ["Land_vn_o_trench_firing_01", [10.43, 20.13, 0.00], 359.71],
     ["Land_vn_o_trench_firing_01", [-11.36, 20.33, 0.00], 359.71],
     ["Land_vn_o_trench_firing_01", [10.22, -21.45, 0.00], 182.06],
     ["Land_vn_o_trench_firing_01", [-11.54, -20.35, 0.00], 182.06],
     ["Land_vn_lampshabby_f", [16.71, 19.62, 0.00], 234.09]
 ];
 
 private _objectives_to_build = [
    // Move all things which should be destroyed to accomplish the mission from the above to this array
	[opfor_fuel_truck, [-12.95, 0.48, 0.00], 91.13],
	[opfor_ammo_truck, [12.34, 9.72, 0.00], 180.52]
 ];
 
 private _defenders_to_build = [
     [opfor_engineer, [0.15, 7.52, 0.00], 176.60],
     [opfor_squad_leader, [-7.16, -8.11, 0.00], 87.43],
     [opfor_engineer, [-7.67, 11.63, 0.00], 37.54],
     [opfor_officer, [2.86, 13.80, 0.00], 175.43],
     [opfor_team_leader, [-9.98, -12.74, 0.00], 190.56],
     [opfor_sentry, [16.26, -3.31, 0.00], 90.46],
     [opfor_medic, [2.81, 16.81, 0.00], 0.00],
     [opfor_rifleman, [-4.73, -19.97, 0.00], 178.36],
     [opfor_grenadier, [-18.13, 10.79, 0.00], 280.06],
     [opfor_engineer, [16.32, 14.31, 0.00], 179.54],
     [opfor_rifleman, [10.76, 19.16, 0.00], 0.00],
     [opfor_rifleman, [-10.58, 19.35, 0.00], 0.00],
     [opfor_rifleman, [10.11, -20.30, 0.00], 177.29],
     [opfor_sharpshooter, [-17.36, 18.29, 5.06], 329.43],
     [opfor_sentry, [17.10, -21.74, 0.00], 98.47]
 ];
 
 private _base_corners = [
     [40, 40, 0],
     [40, -40, 0],
     [-40, -40, 0],
     [-40, 40, 0]
 ];
 
 [_objects_to_build, _objectives_to_build, _defenders_to_build, _base_corners]