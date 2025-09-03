private _objects_to_build = [
     ["vn_o_pl_static_zpu4", [-4.28, 1.94, 0.00], 89.42],
     ["vn_o_prop_r311_01", [-5.28, 6.12, 0.72], 0.00],
     ["vn_gurney_mi2", [-2.45, 11.06, 0.00], 0.04],
     ["Land_vn_wf_vehicle_service_point_east", [-9.45, 7.53, 0.00], 180.97],
     [opfor_mrap_armed, [2.60, 12.42, 0.00], 146.64],
     ["Land_vn_wf_field_hospital_east", [-9.05, 13.72, 0.00], 0.00],
     ["Land_vn_cncwall4_f", [2.94, -18.05, 0.00], 358.53],
     ["Land_vn_cncwall4_f", [-2.25, -18.20, 0.00], 358.53],
     [opfor_mrap_armed, [10.40, -15.00, 0.00], 89.72],
     ["Land_vn_cncwall4_f", [8.13, -17.90, 0.00], 358.53],
     ["Land_vn_cncwall4_f", [-7.44, -18.35, 0.00], 358.53],
     ["Land_vn_cncwall4_f", [-20.42, -0.64, 0.00], 89.84],
     ["Land_vn_cncwall4_f", [-20.46, 4.55, 0.00], 89.84],
     ["Land_vn_cncwall4_f", [-20.39, -5.83, 0.00], 89.84],
     ["Land_vn_net_fence_gate_f", [21.14, -6.06, 0.00], 89.55],
     ["Land_vn_cncwall4_f", [20.80, 4.92, 0.00], 269.90],
     ["Land_vn_cncwall1_f", [21.04, -5.16, 0.00], 270.95],
     ["Land_vn_cncwall1_f", [21.03, -6.46, 0.00], 269.74],
     ["Land_vn_cncwall4_f", [13.32, -17.76, 0.00], 358.53],
     ["Land_vn_cncwall4_f", [-12.62, -18.50, 0.00], 358.53],
     ["Land_vn_cncwall4_f", [-20.49, 9.74, 0.00], 89.84],
     ["Land_vn_cncwall4_f", [-2.56, 22.82, 0.00], 179.78],
     ["Land_vn_cncwall4_f", [2.63, 22.86, 0.00], 179.78],
     ["Land_vn_guardtower_02_f", [-17.88, -16.37, -0.00], 235.97],
     ["Land_vn_cncwall4_f", [20.78, 10.11, 0.00], 269.90],
     ["Land_vn_cncwall4_f", [-20.37, -11.02, 0.00], 89.84],
     ["Land_vn_cncwall4_f", [21.08, -9.62, 0.00], 269.43],
     ["Land_vn_guardtower_02_f", [19.13, -15.44, -0.00], 135.25],
     ["Land_vn_cncwall4_f", [-7.75, 22.78, 0.00], 179.78],
     ["Land_vn_cncwall4_f", [7.82, 22.90, 0.00], 179.78],
     ["Land_vn_cncwall4_f", [-20.52, 14.93, 0.00], 89.84],
     ["Land_vn_guardtower_02_f", [17.72, 20.09, -0.00], 39.30],
     ["Land_vn_cncwall4_f", [18.51, -17.61, 0.00], 358.53],
     ["Land_vn_cncwall4_f", [20.76, 15.30, 0.00], 269.90],
     ["Land_vn_cncwall4_f", [-17.81, -18.64, 0.00], 358.53],
     ["Land_vn_cncwall4_f", [21.17, -14.83, 0.00], 268.76],
     ["Land_vn_guardtower_02_f", [-17.94, 20.46, -0.00], 307.59],
     ["Land_vn_cncwall4_f", [-20.34, -16.21, 0.00], 89.84],
     ["Land_vn_cncwall4_f", [-12.94, 22.75, 0.00], 179.78],
     ["Land_vn_cncwall4_f", [13.01, 22.93, 0.00], 179.78],
     ["Land_vn_cncwall4_f", [-20.55, 20.12, 0.00], 89.84],
     ["Land_vn_cncwall4_f", [-18.13, 22.72, 0.00], 179.78],
     ["Land_vn_cncwall4_f", [20.74, 20.49, 0.00], 269.90],
     ["Land_vn_cncwall4_f", [18.20, 22.96, 0.00], 179.78]
 ];
 
 private _objectives_to_build = [
     // Move all things which should be destroyed to accomplish the mission from the above to this array
	[opfor_fuel_truck, [-11.00, -10.68, 0.00], 90.78],
	[opfor_ammo_truck, [7.92, 20.04, 0.00], 89.34],
	[opfor_ammo_truck, [13.80, 16.67, 0.00], 179.44],
	[opfor_fuel_container, [-17.10, -3.80, 0.00], 269.86],
	[opfor_fuel_container, [-15.31, -0.30, 0.00], 88.57],
	[opfor_fuel_truck, [-10.97, -5.61, 0.00], 89.87]
 ];
 
 private _defenders_to_build = [
     [opfor_rifleman, [1.38, -0.29, 0.00], 0.00],
     [opfor_engineer, [-3.64, 6.34, 0.00], 0.00],
     [opfor_engineer, [-13.40, -1.44, 0.00], 0.00],
     [opfor_medic, [-6.76, 12.31, 0.10], 0.00],
     [opfor_rifleman, [-0.53, -14.47, 0.00], 0.00],
     [opfor_engineer, [-13.79, 4.57, 0.00], 0.00],
     [opfor_officer, [-5.91, 14.12, 0.10], 0.00],
     [opfor_rifleman, [4.71, 17.29, 0.00], 0.00],
     [opfor_medic, [-10.80, 15.15, 0.10], 0.00],
     [opfor_sentry, [18.15, -5.50, 0.00], 66.61],
     [opfor_sentry, [18.94, 2.17, 0.00], 95.05],
     [opfor_aa, [15.35, -11.93, 0.00], 0.00],
     [opfor_aa, [-17.19, 16.45, 0.00], 0.00],
     [opfor_sniper, [-17.72, -16.37, 5.06], 226.49],
     [opfor_sniper, [19.15, -15.26, 5.06], 136.01],
     [opfor_sniper, [17.72, 20.09, 5.06], 0.00],
     [opfor_sniper, [-17.78, 20.30, 5.06], 310.63]
 ];
 
 private _base_corners = [
     [40, 40, 0],
     [40, -40, 0],
     [-40, -40, 0],
     [-40, 40, 0]
 ];
 
 [_objects_to_build, _objectives_to_build, _defenders_to_build, _base_corners]