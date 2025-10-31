
private _objects_to_build = [
     ["OPTRE_FC_Cov_Antenna", [-17.68, -13.00, 0.00], 0.00],
     ["OPTRE_FC_T26_AI", [-28.05, 5.61, 0.00], 293.25],
     ["OPTRE_FC_T26_AI", [22.51, -19.49, 0.00], 129.43],
     ["OPTRE_FC_Cov_Deployable_Shield", [-20.46, 25.48, 0.00], 139.21],
     ["OPTRE_FC_Cov_Deployable_Shield", [-20.78, -26.29, 0.00], 41.09],
     ["OPTRE_FC_Cov_Deployable_Shield", [-8.21, 32.71, 0.00], 162.87],
     ["OPTRE_FC_Cov_Deployable_Shield", [-6.90, -33.70, 0.00], 17.84]
 ];
 
 private _objectives_to_build = [
     // Move all things which should be destroyed to accomplish the mission from the above to this array
	 ["OPTRE_FC_Tyrant", [0.02, -0.30, 0.01], 0.00]
 ];
 
 private _defenders_to_build = [
     ["OPTRE_FC_Elite_Minor", [-5.88, -6.73, 3.85], 236.76],
     ["OPTRE_FC_Elite_Minor", [8.18, 8.30, 3.85], 0.00],
     ["OPTRE_FC_Elite_Ultra3", [-10.03, 6.29, 3.85], 110.72],
     ["OPTRE_FC_Elite_FieldMarshal2", [-9.71, -0.96, 9.88], 0.00],
     ["OPTRE_FC_Elite_Zealot", [14.29, -3.87, 3.85], 0.00],
     ["OPTRE_Jackal_Sniper_F", [2.97, 18.80, 11.43], 0.00],
     ["OPTRE_Jackal_Sniper_F", [3.54, -18.93, 11.42], 193.18],
     ["OPTRE_Jackal_Marksman_F", [21.20, 0.28, 9.82], 87.96]
 ];
 
 private _base_corners = [
     [40, 40, 0],
     [40, -40, 0],
     [-40, -40, 0],
     [-40, 40, 0]
 ];
 
 [_objects_to_build, _objectives_to_build, _defenders_to_build, _base_corners]
