private _objects_to_build = [
    ["Land_vn_t_leucaena_f", [0.51, -5.38, 0.00], 0.00],
    ["Land_vn_rubber_tree_01", [-2.26, -9.03, 0.00], 163.73],
    ["Land_vn_t_leucaena_f", [-5.58, -7.05, 0.00], 0.00],
    ["Land_vn_o_snipertree_03", [0.07, -1.93, 0.00], 74.93],
    ["Land_vn_t_leucaena_f", [-18.77, -1.53, 0.00], 0.00],
    ["Land_vn_t_leucaena_f", [-17.87, 6.50, 0.00], 0.00],
    ["Land_vn_o_shelter_03", [21.65, -2.60, 0.00], 182.41],
    ["Land_vn_rubber_tree_01", [-22.39, 1.34, 0.00], 163.73],
    ["vn_campfire_burning_f", [-15.37, -17.06, -0.00], 0.00],
    ["Land_vn_o_shelter_03", [20.59, -9.63, 0.00], 205.46],
    ["Land_vn_b_sambucusnigra_2s", [-1.12, 23.13, -0.00], 0.00],
    ["Land_vn_o_shelter_04", [-7.59, -23.22, 0.00], 281.39],
    ["Land_vn_fence_punji_01_10", [24.61, 2.91, 0.00], 80.72],
    ["Land_vn_o_shelter_02", [-17.06, 19.06, 0.00], 337.82],
    ["Land_vn_o_snipertree_02", [19.90, 12.94, 0.00], 222.80],
    ["Land_vn_fence_punji_01_10", [6.85, 24.47, 0.00], 26.94],
    ["Land_vn_o_shelter_04", [-14.36, -21.34, 0.00], 287.80],
    ["Land_vn_b_sambucusnigra_1s", [-3.92, 25.25, 0.00], 0.00],
    ["Land_vn_o_shelter_01", [-21.00, 16.15, 0.00], 143.85],
    ["Land_vn_rubber_tree_01", [16.87, -20.46, 0.00], 0.00],
    ["Land_vn_campfire_f", [-21.40, 15.93, 0.00], 0.00],
    ["Land_vn_o_shelter_03", [-19.24, -17.94, 0.00], 314.44],
    ["Land_vn_d_fallentrunk_branches_f", [2.96, -26.85, 0.00], 289.17],
    ["Land_vn_o_tower_01", [-6.98, 28.17, 0.00], 87.03],
    ["Land_vn_o_snipertree_01", [11.43, -26.51, 0.00], 319.30],
    ["Land_vn_fence_punji_01_05", [24.07, -14.80, 0.00], 99.56],
    ["Land_vn_o_tower_02", [-28.76, 10.08, 0.00], 31.40],
    ["Land_vn_rubber_tree_01", [15.76, -24.73, 0.00], 163.73],
    ["Land_vn_fence_punji_01_05", [-13.16, 26.90, 0.00], 150.94],
    ["Land_vn_fence_punji_01_05", [19.86, -22.76, 0.00], 131.39],
    ["Land_vn_fence_punji_01_10", [-12.55, -27.51, 0.00], 195.37],
    ["Land_vn_d_fallentrunk_clear_f", [-5.02, -29.74, 0.00], 254.61],
    ["Land_vn_fence_punji_01_03", [-26.23, 16.41, 0.00], 128.33],
    ["Land_vn_fence_punji_01_05", [-22.98, -20.90, 0.00], 226.77],
    ["Land_vn_fence_punji_01_03", [-23.96, 19.67, 0.00], 145.65],
    ["Land_vn_o_tower_02", [-28.68, -15.58, 0.00], 329.60]
];

private _objectives_to_build = [
    // Move all things which should be destroyed to accomplish the mission from the above to this array
    [opfor_ammo_truck, [14.97, -17.82, 0.00], 42.05],
    [opfor_ammo_truck, [-14.11, 2.04, -0.00], 17.81]
];

private _defenders_to_build = [
    [opfor_marksman, [-0.77, 1.26, 15.14], 0.00],
    [opfor_rifleman, [-17.67, 3.31, 0.00], 33.68],
    [opfor_heavygunner, [20.21, -2.26, 0.00], 231.13],
    [opfor_rifleman, [19.16, -8.03, 0.00], 322.23],
    [opfor_rifleman, [-12.63, -18.50, 0.00], 0.00],
    [opfor_rifleman, [11.02, -21.12, 0.00], 312.45],
    [opfor_rifleman, [-17.95, -15.85, 0.00], 74.00],
    [opfor_squad_leader, [-16.81, 17.70, 0.00], 170.83],
    [opfor_engineer, [19.80, 12.89, 10.16], 75.70],
    [opfor_marksman, [-7.04, 28.00, 4.44], 0.00],
    [opfor_grenadier, [11.37, -26.79, 5.13], 157.30],
    [opfor_rifleman, [-28.52, 9.88, 4.44], 0.00],
    [opfor_marksman, [-28.22, -15.35, 4.44], 245.20]
];

private _base_corners = [
    [40, 40, 0],
    [40, -40, 0],
    [-40, -40, 0],
    [-40, 40, 0]
];

[_objects_to_build, _objectives_to_build, _defenders_to_build, _base_corners]