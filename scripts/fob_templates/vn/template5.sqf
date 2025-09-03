private _objects_to_build = [
     ["Land_vn_hut_mont_02", [0.70, 1.85, 0.00], 0.00],
     ["vn_bar_01_table_01", [0.19, 1.43, 0.54], 89.98],
     ["vn_o_prop_t102e_01", [0.48, 1.43, 1.00], 164.73],
     ["vn_o_nva_static_rpd_high", [0.02, -7.56, -0.00], 189.41],
     ["Land_vn_b_trench_20_02", [0.90, -7.95, 0.00], 182.15],
     ["vn_o_nva_static_rpd_high", [3.89, 11.23, -0.00], 0.00],
     ["Land_vn_guardtower_02_f", [-11.82, -8.30, -0.00], 234.23],
     ["Land_vn_b_trench_20_02", [-0.21, 11.43, 0.00], 1.08],
     ["Land_vn_guardtower_02_f", [13.41, -9.52, -0.00], 138.33],
     ["Land_vn_guardtower_02_f", [12.51, 12.02, -0.00], 53.15],
     ["Land_vn_guardtower_02_f", [-12.75, 12.76, -0.00], 317.25],
     ["Land_vn_b_trench_cross_02", [-11.84, 2.33, 0.00], 271.44],
     ["Land_vn_b_trench_cross_02", [12.13, 1.48, 0.00], 91.94],
     [opfor_mrap, [-22.26, 2.95, 0.00], 180.92],
     [opfor_mrap, [22.57, 1.29, 0.00], 359.05]
 ];
 
 private _objectives_to_build = [
     // Move all things which should be destroyed to accomplish the mission from the above to this array
	[opfor_fuel_container, [7.67, 2.72, 0.00], 268.79],
	[opfor_fuel_truck, [-1.31, 6.07, 0.00], 89.61]
 ];
 
 private _defenders_to_build = [
     [opfor_officer, [-3.09, -1.62, 0.54], 55.31],
     [opfor_machinegunner, [-3.37, 3.72, 0.54], 122.98],
     [opfor_grenadier, [5.12, -0.86, 0.54], 349.15],
     [opfor_at, [-0.32, -5.50, 0.00], 89.71],
     [opfor_aa, [0.73, 9.63, 0.00], 0.00],
     [opfor_rifleman, [-8.60, -7.22, 0.00], 0.00],
     [opfor_rifleman, [9.18, -7.42, 0.00], 0.00],
     [opfor_rifleman, [-12.05, -3.47, 0.00], 0.00],
     [opfor_medic, [11.96, -4.36, 0.00], 0.00],
     [opfor_medic, [-6.68, 11.64, 0.00], 0.00],
     [opfor_rifleman, [-11.98, 6.85, 0.00], 0.00],
     [opfor_rifleman, [9.23, 11.00, 0.00], 0.00],
     [opfor_rifleman, [12.81, 7.37, 0.00], 0.00],
     [opfor_sentry, [-11.79, -8.28, 5.06], 232.48],
     [opfor_sentry, [13.44, -9.47, 5.06], 136.84],
     [opfor_sentry, [12.43, 11.99, 5.06], 55.16],
     [opfor_sentry, [-12.76, 12.82, 5.06], 314.77]
 ];
 
 private _base_corners = [
     [40, 40, 0],
     [40, -40, 0],
     [-40, -40, 0],
     [-40, 40, 0]
 ];
 
 [_objects_to_build, _objectives_to_build, _defenders_to_build, _base_corners]