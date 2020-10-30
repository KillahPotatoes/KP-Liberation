private _objects_to_build = [
    ["Land_Cargo_HQ_V3_F", [10.61, -10.99, 0.00], 0.00],
    ["Land_Cargo_Patrol_V3_F", [-17.12, 17.91, 0.00], 90.00],
    ["Land_Cargo_Patrol_V3_F", [-6.10, -17.32, 0.00], 0.00],
    ["Land_Cargo_Patrol_V3_F", [16.21, 19.89, 0.00], 270.00],
    ["Land_HBarrier_Big_F", [-0.63, 24.21, 0.00], 0.00],
    ["Land_HBarrier_Big_F", [-11.09, -16.24, 0.00], 270.00],
    ["Land_HBarrier_Big_F", [-11.31, -7.55, 0.00], 270.00],
    ["Land_HBarrier_Big_F", [-11.58, 9.48, 0.00], 270.00],
    ["Land_HBarrier_Big_F", [-17.32, 12.59, 0.00], 0.00],
    ["Land_HBarrier_Big_F", [-17.75, 23.50, 0.00], 0.00],
    ["Land_HBarrier_Big_F", [-20.65, 17.97, 0.00], 270.00],
    ["Land_HBarrier_Big_F", [-7.86, -21.51, 0.00], 0.00],
    ["Land_HBarrier_Big_F", [-9.08, 23.97, 0.00], 0.00],
    ["Land_HBarrier_Big_F", [0.86, -21.32, 0.00], 0.00],
    ["Land_HBarrier_Big_F", [16.73, 24.67, 0.00], 0.00],
    ["Land_HBarrier_Big_F", [18.13, -20.90, 0.00], 0.00],
    ["Land_HBarrier_Big_F", [20.43, 19.27, 0.00], 270.00],
    ["Land_HBarrier_Big_F", [20.71, 10.54, 0.00], 270.00],
    ["Land_HBarrier_Big_F", [21.02, 1.91, 0.00], 270.00],
    ["Land_HBarrier_Big_F", [21.24, -6.77, 0.00], 270.00],
    ["Land_HBarrier_Big_F", [21.51, -15.29, 0.00], 270.00],
    ["Land_HBarrier_Big_F", [8.11, 24.41, 0.00], 0.00],
    ["Land_HBarrier_Big_F", [9.42, -21.10, 0.00], 0.00],
    [KPLIB_o_mrapArmed, [12.38, 7.12, -0.00], 270.00],
    [KPLIB_o_transportTruck, [13.36, 2.53, 0.00], 270.00]
];

private _objectives_to_build = [
    [KPLIB_o_ammoContainer, [-1.20, 20.76, 0.00], 270.00],
    [KPLIB_o_ammoContainer, [-1.59, 15.88, 0.00], 270.00],
    [KPLIB_o_fuelContainer, [6.70, 15.99, 0.00], 270.00],
    [KPLIB_o_fuelContainer, [6.82, 21.17, 0.00], 270.00],
    [KPLIB_o_ammoTruck, [13.86, -1.90, 0.00], 270.00]
];

private _defenders_to_build = [
    [KPLIB_o_engineer, [16.56, 0.29, 0.00], 272.36],
    [KPLIB_o_heavyGunner, [15.94, 21.60, 4.35], 0.00],
    [KPLIB_o_medic, [13.96, -10.08, 0.60], 212.28],
    [KPLIB_o_sharpshooter, [-16.85, 16.02, 4.35], 262.35],
    [KPLIB_o_machinegunner, [-7.51, -17.34, 4.35], 172.74],
    [KPLIB_o_rifleman, [-8.52, -15.95, 0.00], 25.64],
    [KPLIB_o_rifleman, [-9.09, 6.77, 0.00], 198.94],
    [KPLIB_o_rifleman, [14.18, -6.52, 3.08], 0.00],
    [KPLIB_o_rifleman, [16.20, 18.42, 4.35], 94.53],
    [KPLIB_o_rifleman, [2.83, 18.98, 0.00], 179.03],
    [KPLIB_o_rifleman, [7.46, -17.77, 0.72], 0.00],
    [KPLIB_o_atSpecialist, [7.10, -9.09, 3.13], 279.26],
    [KPLIB_o_sentry, [16.67, 16.95, 0.00], 231.16],
    [KPLIB_o_marksman, [-17.06, 19.60, 4.35], 273.13],
    [KPLIB_o_squadLeader, [9.67, -10.00, 0.60], 198.89],
    [KPLIB_o_grenadier, [-14.41, 20.23, 0.00], 137.98],
    [KPLIB_o_grenadier, [-4.67, -17.54, 4.35], 177.14]
];

private _base_corners = [
    [40, 40, 0],
    [40, -40, 0],
    [-40, -40, 0],
    [-40, 40, 0]
];

[_objects_to_build, _objectives_to_build, _defenders_to_build, _base_corners]
