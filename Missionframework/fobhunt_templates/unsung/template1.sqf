private _objects_to_build = [
    ["csj_VCshelter01", [-3.22, -7.46, 0.00], 180.00],
    ["Land_Campfire_burning", [-1.45, -2.75, -0.04], 0.00],
    ["LAND_uns_firepit1", [-5.16, 6.73, 0.00], 0.00],
    ["LAND_uns_vcshelter4", [13.86, 2.46, 0.00], 270.00],
    ["LAND_uns_vcshelter4", [13.93, -2.34, 0.00], 270.00],
    ["LAND_uns_vcshelter6", [-10.17, 4.53, 0.00], 61.07],
    ["LAND_uns_vcshelter6", [-3.45, 11.60, 0.00], 0.00],
    ["LAND_uns_vcshelter6", [-8.32, 9.97, 0.00], 153.44],
    ["LAND_uns_vctower1", [10.47, -11.34, 0.00], 324.04],
    ["LAND_uns_vctower1", [12.42, 14.10, 0.00], 211.82],
    ["LAND_uns_vctower2", [-11.86, -6.29, 0.00], 57.67],
    [KPLIB_o_mrapArmed, [5.61, 12.49, -0.00], 90.00],
    [KPLIB_o_flag, [0.39, -10.73, 0.00], 0.00],
    ["Vil_Fence", [-13.37, 11.66, 0.00], 270.00],
    ["Vil_Fence", [-13.42, 5.62, 0.00], 270.00],
    ["Vil_Fence", [-2.75, 15.24, 0.00], 0.00],
    ["Vil_Fence", [-2.98, -11.88, 0.00], 0.00],
    ["Vil_Fence", [-8.69, 15.22, 0.00], 323.79],
    ["Vil_Fence", [17.07, 6.81, 0.00], 270.00],
    ["Vil_Fence", [17.13, 0.67, 0.00], 270.00],
    ["Vil_Fence", [2.98, -11.87, 0.00], 0.00],
    ["Vil_Fence", [3.49, 15.37, 0.00], 0.00],
    ["Vil_Fence", [9.04, -11.90, 0.00], 0.00],
    ["Vil_Fence", [9.63, 15.27, 0.00], 0.00]
];

private _objectives_to_build = [
    [KPLIB_o_fuelContainer, [13.71, -1.74, 0.00], 270.00],
    [KPLIB_o_ammoContainer, [13.61, 3.38, 0.00], 270.00]
];

private _defenders_to_build = [
    [KPLIB_o_engineer, [4.25, 10.00, 0.00], 176.53],
    [KPLIB_o_heavyGunner, [12.59, 14.31, 4.85], 35.26],
    [KPLIB_o_medic, [-2.52, -5.68, 0.00], 209.23],
    [KPLIB_o_officer, [-2.23, -8.35, 0.00], 336.06],
    [KPLIB_o_rifleman, [-12.16, 0.48, 0.00], 258.30],
    [KPLIB_o_rifleman, [-4.69, -7.79, 0.00], 23.76],
    [KPLIB_o_rifleman, [-4.84, 8.98, 0.00], 165.32],
    [KPLIB_o_rifleman, [1.21, -9.56, 0.00], 157.97],
    [KPLIB_o_rifleman, [10.06, 1.24, 0.00], 255.76],
    [KPLIB_o_rifleman, [10.65, -11.13, 4.86], 155.65],
    [KPLIB_o_rifleman, [15.96, 6.35, 0.00], 78.60],
    [KPLIB_o_riflemanLAT, [-7.23, 13.95, 0.00], 312.21],
    [KPLIB_o_sentry, [-7.64, 5.85, 0.00], 99.50],
    [KPLIB_o_marksman, [-12.80, -6.27, 4.80], 248.21]
];

private _base_corners = [
    [40, 40, 0],
    [40, -40, 0],
    [-40, -40, 0],
    [-40, 40, 0]
];

[_objects_to_build, _objectives_to_build, _defenders_to_build, _base_corners]
