 private _objects_to_build = [
     ["OPTRE_FC_Cov_Deployable_Shield", [-28.86, -3.81, 0.22], 0.00],
     ["OPTRE_FC_T26_AT", [-29.04, 2.73, 0.22], 273.32],
     ["OPTRE_FC_Watchtower", [27.44, 5.09, 0.22], 337.52],
     ["OPTRE_FC_Cov_Deployable_Shield", [-29.00, 9.56, 0.22], 179.55],
     ["OPTRE_FC_Barricade", [-1.71, 30.83, 0.22], 0.00],
     ["OPTRE_FC_Barricade", [2.12, 30.88, 0.22], 0.00],
     ["OPTRE_FC_Barricade", [5.84, 30.90, 0.22], 0.00],
     ["OPTRE_FC_Barricade", [9.68, 30.96, 0.22], 0.00]
 ];
 
 private _objectives_to_build = [
     // Move all things which should be destroyed to accomplish the mission from the above to this array
	["OPTRE_FC_TyrantAA", [-0.31, -0.17, 0.22], 5.26]
 ];
 
 private _defenders_to_build = [
     ["OPTRE_Jackal_F", [-7.46, -0.34, 4.05], 0.00],
     ["OPTRE_Jackal_F", [-7.17, 2.15, 4.05], 0.00],
     ["OPTRE_Jackal_F", [-8.73, 4.47, 4.05], 0.00],
     ["OPTRE_Jackal_F", [-10.25, 2.35, 4.05], 0.00],
     ["OPTRE_Jackal_F", [-11.03, -1.68, 4.05], 0.00],
     ["OPTRE_FC_Elite_SpecOps3", [9.79, 1.62, 9.48], 0.00],
     ["OPTRE_Jackal_F", [-13.00, -7.00, 4.05], 0.00],
     ["OPTRE_FC_Elite_FieldMarshal2", [10.5, -10.5, 4.05], 268.04],
     ["OPTRE_FC_Elite_MinorAA", [4.52, 15.27, 11.63], 6.86],
     ["OPTRE_FC_Elite_MinorAT", [0.91, -16.46, 11.62], 132.40],
     ["OPTRE_FC_Elite_SpecOps2", [0.80, 27.90, 0.23], 6.46],
     ["OPTRE_FC_Elite_SpecOps2", [6.03, 27.25, 0.23], 6.46],
     ["OPTRE_FC_Elite_Minor", [-28.84, 2.72, 0.53], 273.32],
     ["OPTRE_Jackal_Sniper_F", [28.76, 2.98, 8.37], 24.46]
 ];
 
 private _base_corners = [
     [40, 40, 0],
     [40, -40, 0],
     [-40, -40, 0],
     [-40, 40, 0]
 ];
 
 [_objects_to_build, _objectives_to_build, _defenders_to_build, _base_corners]