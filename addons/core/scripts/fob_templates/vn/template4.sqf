private _objects_to_build = [
     ["Land_vn_camonetb_east", [-0.04, 1.71, 0.00], 1.08],
     [opfor_mrap, [5.62, -0.36, 0.00], 178.60],
     ["vn_o_ammobox_08", [-2.30, 6.45, 0.00], 309.26],
     ["vn_o_ammobox_08", [-4.22, 6.34, 0.00], 0.00],
     ["Land_vn_o_wallfoliage_01", [-9.61, -1.25, 0.00], 357.55],
     ["Land_vn_o_wallfoliage_01", [-9.92, 2.92, 0.00], 357.55],
     ["Land_vn_o_wallfoliage_01", [-9.37, -5.35, 0.00], 357.55],
     ["Land_vn_o_trench_firing_01", [0.65, 9.36, 0.00], 0.00],
     ["Land_vn_o_wallfoliage_01", [-10.16, 7.03, 0.00], 357.55],
     ["Land_vn_o_trench_firing_01", [11.22, 2.01, 0.00], 87.80]
 ];
 
 private _objectives_to_build = [
     // Move all things which should be destroyed to accomplish the mission from the above to this array
	[opfor_ammo_truck, [1.70, 0.22, 0.00], 178.88],
	[opfor_ammo_truck, [-1.98, -0.46, 0.00], 177.91]
 ];
 
 private _defenders_to_build = [
     [opfor_team_leader, [-0.23, -4.00, 0.00], 159.47],
     [opfor_engineer, [-0.54, 5.15, 0.00], 0.00],
     [opfor_rifleman, [-8.02, 8.41, 0.00], 322.98],
     [opfor_at, [10.99, -5.10, 0.00], 89.89],
     [opfor_sharpshooter, [9.60, 7.79, 0.00], 47.45]
 ];
 
 private _base_corners = [
     [40, 40, 0],
     [40, -40, 0],
     [-40, -40, 0],
     [-40, 40, 0]
 ];
 
 [_objects_to_build, _objectives_to_build, _defenders_to_build, _base_corners]
