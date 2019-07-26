private _objects_to_build = [
    ["Land_BarGate_F", [-1.35, -21.90, 0.00], 0.00],
    ["Land_BarGate_F", [-25.97, 14.85, 0.00], 270.00],
    ["Land_Cargo_HQ_V4_F", [12.54, 8.46, 0.00], 270.00],
    ["Land_Cargo_Patrol_V4_F", [-4.11, 12.99, 0.00], 141.00],
    ["Land_HBarrier_01_big_4_green_F", [-13.36, 0.92, 0.00], 0.00],
    ["Land_HBarrier_01_big_4_green_F", [-19.91, -15.83, 0.00], 0.00],
    ["Land_HBarrier_01_big_4_green_F", [-22.01, 1.08, 0.00], 0.00],
    ["Land_HBarrier_01_big_4_green_F", [-25.39, -12.68, 0.00], 270.00],
    ["Land_HBarrier_01_big_4_green_F", [-25.39, -4.13, 0.00], 270.00],
    ["Land_HBarrier_01_big_4_green_F", [-4.64, 0.77, 0.00], 0.00],
    ["Land_HBarrier_01_big_4_green_F", [-6.31, 20.00, 0.00], 0.00],
    ["Land_HBarrier_01_big_4_green_F", [-9.46, 6.24, 0.00], 270.00],
    ["Land_HBarrier_01_big_4_green_F", [-9.47, 14.79, 0.00], 270.00],
    ["Land_HBarrier_01_big_4_green_F", [-9.67, -4.48, 0.00], 270.00],
    ["Land_HBarrier_01_big_4_green_F", [10.62, 19.99, 0.00], 0.00],
    ["Land_HBarrier_01_big_4_green_F", [10.68, -16.06, 0.00], 0.00],
    ["Land_HBarrier_01_big_4_green_F", [19.16, 19.99, 0.00], 0.00],
    ["Land_HBarrier_01_big_4_green_F", [19.22, -16.07, 0.00], 0.00],
    ["Land_HBarrier_01_big_4_green_F", [2.23, 20.00, 0.00], 0.00],
    ["Land_HBarrier_01_big_4_green_F", [22.25, -10.84, 0.00], 270.00],
    ["Land_HBarrier_01_big_4_green_F", [22.25, -2.29, 0.00], 270.00],
    ["Land_HBarrier_01_big_4_green_F", [22.34, 14.71, 0.00], 270.00],
    ["Land_HBarrier_01_big_4_green_F", [22.35, 6.16, 0.00], 270.00],
    ["Land_HBarrier_01_big_tower_green_F", [-12.34, -16.79, 0.00], 0.00],
    ["Land_HBarrier_01_big_tower_green_F", [2.99, -16.95, 0.00], 0.00],
    ["Land_HBarrier_01_line_1_green_F", [-22.72, 19.94, 0.00], 270.00],
    ["Land_HBarrier_01_line_5_green_F", [-13.55, 19.94, 0.00], 0.00],
    ["Land_HBarrier_01_line_5_green_F", [-19.12, 19.94, 0.00], 0.00],
    ["Land_HBarrier_01_line_5_green_F", [-24.19, 5.00, 0.00], 270.00],
    ["Land_HBarrier_01_line_5_green_F", [-24.22, 17.71, 0.00], 270.00],
    [opfor_mrap_armed, [-17.72, 14.91, -0.00], 270.00],
    [opfor_transport_truck, [-16.45, 7.09, 0.00], 270.00]
];

private _objectives_to_build = [
    [opfor_fuel_truck, [14.36, -11.61, 0.00], 270.00],
    [opfor_fuel_container, [-19.81, -11.27, 0.00], 270.00],
    [opfor_fuel_container, [-19.85, -3.96, 0.00], 270.00]
];

private _defenders_to_build = [
    [opfor_engineer, [-13.45, 3.53, 0.00], 280.96],
    [opfor_heavygunner, [17.42, 5.17, 3.13], 137.06],
    [opfor_medic, [17.92, 5.97, 0.60], 274.39],
    [opfor_officer, [12.32, 11.76, 0.60], 140.46],
    [opfor_sharpshooter, [-5.79, 11.84, 4.35], 297.99],
    [opfor_machinegunner, [-11.76, -18.72, 2.28], 152.95],
    [opfor_machinegunner, [-12.18, -3.17, 0.00], 204.36],
    [opfor_rifleman, [-13.48, -17.94, 2.28], 170.62],
    [opfor_rifleman, [-21.78, 17.73, 0.00], 176.87],
    [opfor_rifleman, [-5.56, -18.04, 0.00], 155.59],
    [opfor_rifleman, [10.34, 6.15, 0.60], 99.59],
    [opfor_rifleman, [19.16, 0.25, 0.00], 252.60],
    [opfor_rifleman, [4.08, 16.23, 0.00], 195.28],
    [opfor_rifleman, [8.68, -11.60, 0.00], 258.53],
    [opfor_rpg, [11.21, 13.16, 3.13], 309.16],
    [opfor_sentry, [-21.30, -7.60, 0.00], 97.63],
    [opfor_sentry, [-6.04, 4.12, 0.00], 80.41],
    [opfor_sentry, [2.14, -17.64, 2.28], 246.88],
    [opfor_marksman, [-3.27, 13.64, 4.35], 332.14],
    [opfor_marksman, [11.79, 5.74, 3.13], 224.23],
    [opfor_grenadier, [3.70, -19.06, 2.28], 179.85]
];

private _base_corners = [
    [40, 40, 0],
    [40, -40, 0],
    [-40, -40, 0],
    [-40, 40, 0]
];

[_objects_to_build, _objectives_to_build, _defenders_to_build, _base_corners]
