private _objects_to_build = [
     ["OPTRE_FC_Cov_Antenna", [-19.48, 5.67, 0.1], 0.00],
     ["OPTRE_FC_Barricade", [22.65, 12.86, 0.1], 50.58],
     ["OPTRE_FC_T29B_NVar", [27.69, -0.84, 0.1], 94.28],
     ["OPTRE_FC_Barricade", [-0.22, 28.97, 0.1], 0.00],
     ["OPTRE_FC_T29B_NVar", [-29.74, -1.37, 0.1], 269.35],
     ["OPTRE_FC_Barricade", [-26.23, -15.26, 0.1], 250.71],
     ["OPTRE_FC_Cov_Deployable_Shield", [-21.25, -24.91, 0.1], 50.89]
 ];
 
 private _objectives_to_build = [
     // Move all things which should be destroyed to accomplish the mission from the above to this array
	      ["OPTRE_FC_TyrantAA", [-0.68, -0.77, 0.1], 0.00]
 ];
 
 private _defenders_to_build = [
     ["OPTRE_Jackal_SpecOps2_F", [1.26, -8.38, 5.62], 286.66],
     ["OPTRE_Jackal_Major_F", [-9.86, 4.98, 4.21], 37.39],
     ["OPTRE_Jackal_SpecOps3_F", [-10.23, -5.98, 4.21], 114.37],
     ["OPTRE_FC_Elite_Ultra", [13.71, 4.20, 4.21], 290.37],
     ["OPTRE_FC_Elite_Major", [11.07, -11.00, 4.21], 258.11],
     ["OPTRE_FC_Elite_FieldMarshal2", [2.80, -13.14, 11.78], 205.05],
     ["OPTRE_Jackal_Marksman_F", [2.26, 17.20, 11.79], 0.00],
     ["OPTRE_Jackal_Sniper_F", [2.59, -18.22, 11.78], 186.68],
     ["OPTRE_Jackal_Sharpshooter_F", [19.67, -0.56, 10.19], 98.86],
     ["OPTRE_Jackal_Marksman_F", [-20.31, -23.85, 0.1], 262.13]
 ];
 
 private _base_corners = [
     [40, 40, 0],
     [40, -40, 0],
     [-40, -40, 0],
     [-40, 40, 0]
 ];
 
 [_objects_to_build, _objectives_to_build, _defenders_to_build, _base_corners]