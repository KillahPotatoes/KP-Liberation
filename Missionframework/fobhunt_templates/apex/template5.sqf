private _objects_to_build = [
    ["Land_BarGate_F", [-1.56, -21.23, 0.00], 180.00],
    ["Land_Cargo_House_V4_F", [-15.99, -15.32, 0.00], 180.00],
    ["Land_Cargo_House_V4_F", [-8.30, -15.39, 0.00], 180.00],
    ["Land_Cargo_Patrol_V4_F", [-17.07, 15.12, 0.00], 90.00],
    ["Land_Cargo_Patrol_V4_F", [15.11, -18.26, 0.00], 0.00],
    ["Land_Cargo_Tower_V4_F", [14.91, 13.60, 0.00], 0.00],
    ["Land_HBarrier_01_big_4_green_F", [-15.68, 20.47, 0.00], 0.00],
    ["Land_HBarrier_01_big_4_green_F", [-16.02, -21.09, 0.00], 0.00],
    ["Land_HBarrier_01_big_4_green_F", [-20.99, 17.26, 0.00], 270.00],
    ["Land_HBarrier_01_big_4_green_F", [-21.00, -0.12, 0.00], 270.00],
    ["Land_HBarrier_01_big_4_green_F", [-21.00, 8.55, 0.00], 270.00],
    ["Land_HBarrier_01_big_4_green_F", [-21.13, -8.80, 0.00], 270.00],
    ["Land_HBarrier_01_big_4_green_F", [-21.39, -17.39, 0.00], 270.00],
    ["Land_HBarrier_01_big_4_green_F", [-7.33, 20.43, 0.00], 0.00],
    ["Land_HBarrier_01_big_4_green_F", [-7.69, -21.22, 0.00], 0.00],
    ["Land_HBarrier_01_big_4_green_F", [1.12, 20.34, 0.00], 0.00],
    ["Land_HBarrier_01_big_4_green_F", [11.11, -21.90, 0.00], 0.00],
    ["Land_HBarrier_01_big_4_green_F", [18.02, 20.28, 0.00], 0.00],
    ["Land_HBarrier_01_big_4_green_F", [19.55, -21.95, 0.00], 0.00],
    ["Land_HBarrier_01_big_4_green_F", [22.71, -16.70, 0.00], 270.00],
    ["Land_HBarrier_01_big_4_green_F", [22.81, -8.28, 0.00], 270.00],
    ["Land_HBarrier_01_big_4_green_F", [22.89, 0.29, 0.00], 270.00],
    ["Land_HBarrier_01_big_4_green_F", [23.00, 8.71, 0.00], 270.00],
    ["Land_HBarrier_01_big_4_green_F", [23.12, 17.03, 0.00], 270.00],
    ["Land_HBarrier_01_big_4_green_F", [9.57, 20.36, 0.00], 0.00],
    [KPLIB_o_mrap, [14.22, -4.50, -0.00], 270.00]
];

private _objectives_to_build = [
    [KPLIB_o_ammoTruck, [15.77, -10.81, 0.00], 270.00],
    [KPLIB_o_fuelTruck, [15.39, 1.95, 0.00], 270.00],
    [KPLIB_o_ammoContainer, [-12.54, 6.21, 0.00], 0.00],
    [KPLIB_o_ammoContainer, [-16.98, 6.38, 0.00], 0.00],
    [KPLIB_o_fuelContainer, [-12.00, -3.02, 0.00], 0.00],
    [KPLIB_o_fuelContainer, [-16.72, -3.11, 0.00], 0.00]
];

private _defenders_to_build = [
    [KPLIB_o_engineer, [16.86, -0.86, 0.00], 257.93],
    [KPLIB_o_heavyGunner, [2.53, -18.79, 0.00], 162.42],
    [KPLIB_o_medic, [-8.69, -15.93, 0.59], 0.00],
    [KPLIB_o_sharpshooter, [-17.05, 16.71, 4.35], 272.72],
    [KPLIB_o_sharpshooter, [10.26, 6.69, 17.79], 198.44],
    [KPLIB_o_machinegunner, [-15.20, 1.00, 0.00], 86.01],
    [KPLIB_o_rifleman, [-13.07, 16.89, 0.00], 139.62],
    [KPLIB_o_rifleman, [-16.95, 13.45, 4.35], 259.48],
    [KPLIB_o_rifleman, [-17.18, -17.18, 0.73], 0.00],
    [KPLIB_o_rifleman, [10.74, 10.43, 15.37], 81.16],
    [KPLIB_o_rifleman, [11.20, 10.90, 12.77], 0.00],
    [KPLIB_o_rifleman, [12.76, -16.90, 0.00], 323.09],
    [KPLIB_o_rifleman, [16.63, 12.67, 0.00], 229.50],
    [KPLIB_o_rifleman, [18.63, 15.47, 17.89], 46.70],
    [KPLIB_o_atSpecialist, [-17.43, -7.40, 0.00], 101.79],
    [KPLIB_o_riflemanLAT, [10.88, 16.67, 17.89], 313.11],
    [KPLIB_o_sentry, [18.68, 15.42, 15.37], 240.93],
    [KPLIB_o_marksman, [13.72, -18.55, 4.35], 210.97],
    [KPLIB_o_squadLeader, [-14.42, -16.98, 0.73], 333.26],
    [KPLIB_o_grenadier, [16.74, -18.14, 4.35], 172.08]
];

private _base_corners = [
    [40, 40, 0],
    [40, -40, 0],
    [-40, -40, 0],
    [-40, 40, 0]
];

[_objects_to_build, _objectives_to_build, _defenders_to_build, _base_corners]
