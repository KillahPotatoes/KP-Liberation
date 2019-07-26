private _objects_to_build = [
    ["Land_BarGate_F", [3.08, -23.93, 0.00], 0.00],
    ["Land_Cargo_Patrol_V4_F", [-16.67, -17.67, 0.00], 0.00],
    ["Land_Cargo_Patrol_V4_F", [16.25, -17.52, 0.00], 0.00],
    ["Land_Cargo_Tower_V4_F", [14.05, 13.65, 0.00], 0.00],
    ["Land_HBarrier_01_big_4_green_F", [-0.88, 21.72, 0.00], 180.00],
    ["Land_HBarrier_01_big_4_green_F", [-16.20, 1.19, 0.00], 180.00],
    ["Land_HBarrier_01_big_4_green_F", [-16.62, -21.26, 0.00], 180.00],
    ["Land_HBarrier_01_big_4_green_F", [-18.34, 21.81, 0.00], 180.00],
    ["Land_HBarrier_01_big_4_green_F", [-21.59, -0.83, 0.00], 270.00],
    ["Land_HBarrier_01_big_4_green_F", [-21.67, 7.65, 0.00], 90.00],
    ["Land_HBarrier_01_big_4_green_F", [-21.74, 16.44, 0.00], 90.00],
    ["Land_HBarrier_01_big_4_green_F", [-21.75, -17.91, 0.00], 270.00],
    ["Land_HBarrier_01_big_4_green_F", [-21.78, -9.42, 0.00], 90.00],
    ["Land_HBarrier_01_big_4_green_F", [-4.29, -4.05, 0.00], 90.00],
    ["Land_HBarrier_01_big_4_green_F", [-4.32, 6.54, 0.00], 270.00],
    ["Land_HBarrier_01_big_4_green_F", [-7.45, 1.15, 0.00], 0.00],
    ["Land_HBarrier_01_big_4_green_F", [-8.11, -21.27, 0.00], 180.00],
    ["Land_HBarrier_01_big_4_green_F", [-9.19, -15.91, 0.00], 270.00],
    ["Land_HBarrier_01_big_4_green_F", [-9.61, 21.68, 0.00], 180.00],
    ["Land_HBarrier_01_big_4_green_F", [15.84, -21.56, 0.00], 180.00],
    ["Land_HBarrier_01_big_4_green_F", [16.21, 5.06, 0.00], 0.00],
    ["Land_HBarrier_01_big_4_green_F", [16.57, 21.48, 0.00], 0.00],
    ["Land_HBarrier_01_big_4_green_F", [21.40, -18.40, 0.00], 90.00],
    ["Land_HBarrier_01_big_4_green_F", [21.49, -9.60, 0.00], 270.00],
    ["Land_HBarrier_01_big_4_green_F", [21.52, 16.26, 0.00], 270.00],
    ["Land_HBarrier_01_big_4_green_F", [21.56, -1.31, 0.00], 90.00],
    ["Land_HBarrier_01_big_4_green_F", [21.59, 7.47, 0.00], 270.00],
    ["Land_HBarrier_01_big_4_green_F", [4.60, 16.17, 0.00], 270.00],
    ["Land_HBarrier_01_big_4_green_F", [6.21, -16.03, 0.00], 270.00],
    ["Land_HBarrier_01_big_4_green_F", [7.33, -21.54, 0.00], 180.00],
    ["Land_HBarrier_01_big_4_green_F", [7.51, 5.16, 0.00], 180.00],
    ["Land_HBarrier_01_big_4_green_F", [7.73, 21.59, 0.00], 180.00]
];

private _objectives_to_build = [
    [opfor_ammo_container, [-17.69, 6.55, 0.00], 0.00],
    [opfor_ammo_container, [-8.52, 6.50, 0.00], 0.00],
    [opfor_fuel_container, [-12.98, 6.80, 0.00], 0.00],
    [opfor_fuel_container, [-17.49, 15.73, 0.00], 0.00],
    [opfor_fuel_truck, [14.76, -3.44, 0.00], 270.00],
    [opfor_ammo_truck, [14.92, 1.33, 0.00], 270.00]
];

private _defenders_to_build = [
    [opfor_engineer, [15.07, -0.94, 0.00], 258.84],
    [opfor_heavygunner, [-18.40, -1.96, 0.00], 134.25],
    [opfor_heavygunner, [17.84, -17.31, 4.35], 162.32],
    [opfor_medic, [-0.88, -22.03, 0.00], 170.13],
    [opfor_medic, [-6.09, -18.08, 0.00], 106.59],
    [opfor_medic, [18.34, 12.30, 0.00], 229.95],
    [opfor_officer, [17.04, 14.01, 15.37], 228.55],
    [opfor_sharpshooter, [18.24, 16.25, 17.89], 60.85],
    [opfor_rifleman, [-10.67, 19.15, 0.00], 145.13],
    [opfor_rifleman, [-15.09, -17.86, 4.35], 152.65],
    [opfor_rifleman, [14.53, -17.52, 4.35], 183.66],
    [opfor_rifleman, [17.84, 9.35, 17.89], 120.37],
    [opfor_rifleman, [8.78, -18.50, 0.00], 38.44],
    [opfor_rifleman, [9.42, 8.60, 12.77], 0.00],
    [opfor_rpg, [10.13, 6.74, 17.79], 190.12],
    [opfor_sentry, [-15.34, 11.18, 0.00], 43.12],
    [opfor_sentry, [15.14, 9.85, 12.77], 0.00],
    [opfor_marksman, [-17.65, -17.73, 4.35], 192.66],
    [opfor_grenadier, [-7.66, -1.47, 0.00], 186.27],
    [opfor_grenadier, [18.23, -6.30, 0.00], 235.17]
];

private _base_corners = [
    [40, 40, 0],
    [40, -40, 0],
    [-40, -40, 0],
    [-40, 40, 0]
];

[_objects_to_build, _objectives_to_build, _defenders_to_build, _base_corners]
