private _objects_to_build = [
    ["Land_vn_o_shelter_06", [-4.75, 3.22, 0.00], 169.95],
    ["Land_vn_o_prop_cong_cage_03", [7.36, -2.13, -0.00], 80.95],
    ["Land_vn_o_shelter_06", [-7.76, 1.93, 0.00], 148.87],
    ["Land_vn_o_shelter_06", [-10.63, -0.64, 0.00], 107.98],
    ["Land_vn_o_prop_cong_cage_03", [4.30, -9.79, 0.00], 160.63],
    ["Land_vn_t_cyathea_f", [-5.31, 13.16, 0.00], 0.00],
    ["Land_vn_o_bunker_04", [7.03, 14.88, 0.00], 41.22],
    ["Land_vn_fence_punji_01_05", [-3.10, 15.42, 0.00], 0.00],
    ["Land_vn_t_palaquium_f", [-12.29, 3.13, 0.00], 95.83],
    ["Land_vn_fence_punji_01_10", [15.66, 3.03, 0.00], 61.75],
    ["Land_vn_o_snipertree_02", [13.26, -6.76, 0.00], 258.65],
    ["Land_vn_t_cyathea_f", [1.14, 17.25, 0.00], 0.00],
    ["Land_vn_fence_punji_01_03", [-11.63, 13.38, 0.00], 146.40],
    ["Land_vn_t_cyathea_f", [-5.58, -17.32, 0.00], 0.00],
    ["Land_vn_o_bunker_03", [-18.86, 9.02, 0.00], 324.41],
    ["Land_vn_t_cyathea_f", [-10.99, -16.95, 0.00], 0.00],
    ["Land_vn_fence_punji_01_05", [18.41, -12.07, 0.00], 104.22],
    ["Land_vn_o_bunker_03", [-17.76, -15.86, 0.00], 236.35],
    ["Land_vn_t_palaquium_f", [-8.72, -19.05, 0.00], 210.99],
    ["Land_vn_fence_punji_01_03", [-22.95, 3.14, 0.00], 280.26],
    ["Land_vn_fence_punji_01_10", [5.78, -22.92, 0.00], 166.17],
    ["Land_vn_fence_punji_01_03", [-22.14, -8.48, 0.00], 242.52],
    ["Land_vn_fence_punji_01_05", [-9.35, -22.27, 0.00], 205.31],
    ["Land_vn_o_bunker_02", [14.43, -21.35, 0.00], 160.18]
];
private _objectives_to_build = [
    // Move all things which should be destroyed to accomplish the mission from the above to this array
    [opfor_ammo_truck, [0.44, -4.42, 0.00], 17.81]
];
private _defenders_to_build = [
    [opfor_rifleman, [-3.89, 0.85, 0.00], 210.66],
    [opfor_engineer, [4.16, -4.55, 0.00], 0.00],
    [opfor_rifleman, [-7.85, -1.04, 0.00], 99.18],
    [opfor_medic, [5.31, 13.03, 0.25], 303.40],
    [opfor_marksman, [13.25, -6.67, 10.16], 109.01],
    [opfor_heavygunner, [-18.88, 8.63, 0.15], 330.14],
    [opfor_rifleman, [-17.60, -16.01, 0.14], 228.17],
    [opfor_rifleman, [13.99, -20.32, 0.15], 157.66]
];
private _base_corners = [
    [40, 40, 0],
    [40, -40, 0],
    [-40, -40, 0],
    [-40, 40, 0]
];
[_objects_to_build, _objectives_to_build, _defenders_to_build, _base_corners]