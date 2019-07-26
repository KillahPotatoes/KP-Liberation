private _objects_to_build = [
    ["csj_VCbunk01", [-2.92, -19.96, 0.00], 17.74],
    ["csj_VCbunk01", [18.36, -8.12, 0.00], 284.30],
    ["csj_VCshelter01", [-12.86, -11.05, 0.00], 238.31],
    ["csj_VCshelter01", [-15.63, -5.00, 0.00], 253.72],
    ["csj_VCshelter01", [-16.15, 1.49, 0.00], 269.83],
    ["Land_Campfire_burning", [-6.25, -5.76, 0.00], 0.00],
    ["Land_CongCage", [12.43, -13.26, 0.00], 34.77],
    ["Land_CongCage", [13.73, -11.25, 0.00], 19.58],
    ["LAND_uns_vcshelter4", [12.02, 7.05, 0.00], 243.49],
    ["LAND_uns_vcshelter4", [14.64, 1.79, 0.00], 248.42],
    ["LAND_uns_vcshelter4", [8.44, 12.23, 0.00], 222.74],
    ["LAND_uns_vctower1", [-16.64, 9.00, 0.00], 88.93],
    ["LAND_uns_vctower1", [0.36, 19.12, 0.00], 179.83],
    ["LAND_uns_vctower2", [-10.19, 17.03, 0.00], 138.17],
    ["LAND_uns_villseat", [-3.60, -1.42, 0.00], 353.67],
    ["LAND_uns_villseat", [-3.72, 2.47, 0.00], 173.03],
    ["LAND_uns_villseat", [-5.30, -1.47, 0.00], 0.00],
    ["LAND_uns_villseat", [-5.43, 2.58, 0.00], 355.54],
    ["LAND_uns_villseat", [-7.23, 2.51, 0.00], 4.85],
    ["LAND_uns_villseat", [-7.24, -1.44, 0.00], 5.24],
    ["LAND_uns_villseat", [-9.06, 2.52, 0.00], 355.69],
    ["LAND_uns_villseat", [-9.11, -1.45, 0.00], 4.71],
    [opfor_mrap, [-3.07, 15.27, -0.00], 89.49],
    ["uns_bench1", [-4.67, -6.81, 0.00], 30.92],
    ["uns_bench1", [-7.78, -7.16, 0.00], 136.72],
    [opfor_flag, [12.70, -15.73, 0.00], 0.00],
    [opfor_flag, [4.94, -19.60, 0.00], 0.00],
    ["uns_villtable1", [-4.48, -1.54, 0.00], 0.00],
    ["uns_villtable1", [-4.62, 2.33, 0.00], 0.00],
    ["uns_villtable1", [-8.15, 2.62, 0.00], 0.00],
    ["uns_villtable1", [-8.18, -1.47, 0.00], 0.00],
    ["Vil_Fence", [-16.69, 12.13, 0.00], 129.93],
    ["Vil_Fence", [-2.38, 19.26, 0.00], 0.67],
    ["Vil_Fence", [-5.93, -17.85, 0.00], 36.44],
    ["Vil_Fence", [12.36, 14.38, 0.00], 232.54],
    ["Vil_Fence", [16.06, 9.59, 0.00], 246.56],
    ["Vil_Fence", [16.91, -11.44, 0.00], 307.87],
    ["Vil_Fence", [18.50, 4.07, 0.00], 261.70],
    ["Vil_Fence", [5.68, -20.35, 0.00], 0.67],
    ["Vil_Fence", [7.69, 18.17, 0.00], 218.47]
];

private _objectives_to_build = [
    [opfor_ammo_container, [11.83, 7.85, 0.00], 244.41],
    [opfor_fuel_container, [14.17, 2.33, 0.00], 247.91],
    [opfor_fuel_container, [7.65, 12.72, 0.00], 223.11]
];

private _defenders_to_build = [
    [opfor_engineer, [-4.18, 13.73, 0.00], 176.93],
    [opfor_heavygunner, [-12.66, -10.52, 0.00], 0.00],
    [opfor_heavygunner, [-4.12, -20.00, 0.00], 249.04],
    [opfor_medic, [-15.97, -6.49, 0.00], 0.00],
    [opfor_sharpshooter, [1.09, 18.82, 4.83], 0.00],
    [opfor_rifleman, [-1.82, -20.39, 0.00], 154.51],
    [opfor_rifleman, [-10.58, 17.79, 4.81], 143.79],
    [opfor_rifleman, [-15.11, 2.16, 0.00], 108.85],
    [opfor_rifleman, [-16.03, -3.77, 0.00], 91.87],
    [opfor_rifleman, [-4.67, -4.78, 0.00], 212.50],
    [opfor_rifleman, [18.35, -7.05, 0.00], 0.00],
    [opfor_rifleman, [6.01, -19.19, 0.00], 133.28],
    [opfor_rifleman, [7.52, 8.87, 0.00], 220.50],
    [opfor_rpg, [10.95, -10.90, 0.00], 291.65],
    [opfor_sentry, [11.95, 4.52, 0.00], 43.29],
    [opfor_marksman, [-0.29, 18.86, 4.87], 305.92],
    [opfor_marksman, [-16.39, 9.43, 4.84], 317.61],
    [opfor_marksman, [-16.53, 8.30, 4.87], 223.01],
    [opfor_grenadier, [-7.72, -4.93, 0.00], 120.76],
    [opfor_grenadier, [18.02, -9.31, 0.00], 141.02]
];

private _base_corners = [
    [40, 40, 0],
    [40, -40, 0],
    [-40, -40, 0],
    [-40, 40, 0]
];

[_objects_to_build, _objectives_to_build, _defenders_to_build, _base_corners]
