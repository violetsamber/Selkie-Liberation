 private _objects_to_build = [
    ["Land_vn_wf_field_hospital_east", [-0.21, -0.07, 0.00], 0.00],
    ["Land_vn_o_shelter_03", [-0.34, 4.50, 0.00], 95.75],
    ["vn_o_prop_r311_01", [-7.71, 3.83, 0.86], 155.75],
    ["Land_WoodenTable_large_F", [-8.39, 4.06, 0.00], 92.91],
    ["Land_vn_chairwood_f", [-8.30, 4.79, 0.00], 4.13],
    ["Land_vn_camonetb_east", [-11.86, 0.43, 0.00], 274.80],
    ["Land_vn_shelveswooden_f", [-13.15, -4.06, 0.00], 272.84],
    ["vn_o_snipertree_04", [8.04, -7.20, 0.00], 306.20],
    [opfor_mrap_armed, [16.84, 6.10, 0.00], 56.92],
    ["vn_sign_town_d_11_01", [-18.52, -3.96, 0.00], 228.33],
    ["Land_vn_o_trench_firing_01", [2.50, 24.78, 0.00], 2.45],
    ["Land_vn_o_trench_firing_01", [1.75, -25.04, 0.00], 180.25],
    ["Land_vn_o_platform_06", [19.72, -23.38, 0.00], 39.38],
    ["Land_vn_o_bunker_03", [-30.15, -1.42, 0.00], 269.06],
    ["Land_vn_o_bunker_03", [30.68, -0.12, 0.00], 87.90],
    ["Land_vn_o_platform_06", [-25.81, 17.97, 0.00], 216.63],
    ["Land_vn_o_platform_06", [-22.90, -21.62, 0.00], 133.36],
    ["Land_vn_o_platform_06", [24.64, 20.67, 0.00], 309.91]
];

private _objectives_to_build = [
    // Move all things which should be destroyed to accomplish the mission from the above to this array
	[opfor_fuel_container, [-14.90, 3.27, 0.00], 271.56],
    [opfor_fuel_container, [-16.88, 2.07, 0.00], 91.40]
];

private _defenders_to_build = [
    [opfor_medic, [1.75, 1.22, 0.10], 176.77],
    [opfor_officer, [-2.29, 1.30, 0.10], 0.00],
    [opfor_medic, [1.62, -2.23, 0.10], 0.00],
    [opfor_medic, [-3.51, 1.48, 0.10], 0.00],
    [opfor_aa, [0.20, -5.22, 0.00], 180.33],
    [opfor_sentry, [6.32, 2.79, 0.00], 87.17],
    [opfor_sentry, [6.90, -2.24, 0.00], 86.48],
    [opfor_aa, [-0.67, 8.20, 0.00], 4.52],
    [opfor_officer, [-8.99, 5.24, 0.00], 176.12],
    [opfor_engineer, [15.98, 7.86, 0.00], 45.47],
    [opfor_rifleman, [2.00, -25.00, 0.00], 187.39],
    [opfor_rifleman, [2.33, 25.11, 0.00], 356.92],
    [opfor_machinegunner, [-29.98, -1.37, 0.15], 267.95],
    [opfor_machinegunner, [30.33, 0.12, 0.15], 83.74],
    [opfor_sentry, [20.05, -23.34, 2.17], 127.28],
    [opfor_sentry, [-22.96, -21.67, 2.16], 221.36],
    [opfor_sentry, [-26.00, 18.22, 2.17], 304.60],
    [opfor_sentry, [24.93, 20.90, 2.17], 37.90]
];

private _base_corners = [
    [40, 40, 0],
    [40, -40, 0],
    [-40, -40, 0],
    [-40, 40, 0]
];

[_objects_to_build, _objectives_to_build, _defenders_to_build, _base_corners]
