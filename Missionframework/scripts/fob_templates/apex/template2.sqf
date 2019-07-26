private _objects_to_build = [
    [opfor_flag, [-3.09, -13.03, 0.00], 0.00],
    ["Land_BarGate_F", [-20.99, -7.13, 0.00], 270.00],
    ["Land_Cargo_HQ_V4_F", [12.64, -4.76, 0.00], 0.00],
    ["Land_Cargo_Patrol_V4_F", [18.54, 14.75, 0.00], 180.00],
    ["Land_HBarrier_01_big_4_green_F", [-13.52, 18.55, 0.00], 180.00],
    ["Land_HBarrier_01_big_4_green_F", [-15.72, -15.44, 0.00], 180.00],
    ["Land_HBarrier_01_big_4_green_F", [-19.05, 15.24, 0.00], 270.00],
    ["Land_HBarrier_01_big_4_green_F", [-19.26, -2.85, 0.00], 270.00],
    ["Land_HBarrier_01_big_4_green_F", [-4.90, 18.58, 0.00], 180.00],
    ["Land_HBarrier_01_big_4_green_F", [-7.19, -15.46, 0.00], 180.00],
    ["Land_HBarrier_01_big_4_green_F", [1.42, -15.43, 0.00], 180.00],
    ["Land_HBarrier_01_big_4_green_F", [12.17, 18.58, 0.00], 180.00],
    ["Land_HBarrier_01_big_4_green_F", [18.50, -15.42, 0.00], 180.00],
    ["Land_HBarrier_01_big_4_green_F", [20.69, 18.51, 0.00], 180.00],
    ["Land_HBarrier_01_big_4_green_F", [23.87, -12.24, 0.00], 270.00],
    ["Land_HBarrier_01_big_4_green_F", [24.00, -3.73, 0.00], 270.00],
    ["Land_HBarrier_01_big_4_green_F", [24.08, 4.75, 0.00], 270.00],
    ["Land_HBarrier_01_big_4_green_F", [24.10, 13.14, 0.00], 270.00],
    ["Land_HBarrier_01_big_4_green_F", [3.55, 18.60, 0.00], 180.00],
    ["Land_HBarrier_01_big_4_green_F", [9.87, -15.40, 0.00], 180.00],
    ["Land_HBarrier_01_line_1_green_F", [-4.98, 2.23, 0.00], 0.00],
    ["Land_HBarrier_01_line_1_green_F", [-5.01, 0.74, 0.00], 0.00],
    ["Land_HBarrier_01_line_3_green_F", [0.30, 3.78, 0.00], 0.00],
    ["Land_HBarrier_01_line_3_green_F", [6.91, 11.77, 0.00], 270.00],
    ["Land_HBarrier_01_line_5_green_F", [-15.28, 3.84, 0.00], 0.00],
    ["Land_HBarrier_01_line_5_green_F", [-4.16, 3.81, 0.00], 0.00],
    ["Land_HBarrier_01_line_5_green_F", [-4.90, -5.79, 0.00], 270.00],
    ["Land_HBarrier_01_line_5_green_F", [-4.91, -11.49, 0.00], 270.00],
    ["Land_HBarrier_01_line_5_green_F", [-9.68, 3.85, 0.00], 0.00],
    ["Land_HBarrier_01_line_5_green_F", [14.49, 3.65, 0.00], 0.00],
    ["Land_HBarrier_01_line_5_green_F", [2.76, 14.38, 0.00], 270.00],
    ["Land_HBarrier_01_line_5_green_F", [2.77, 5.83, 0.00], 270.00],
    ["Land_HBarrier_01_line_5_green_F", [20.08, 3.65, 0.00], 0.00],
    ["Land_HBarrier_01_line_5_green_F", [6.90, 7.29, 0.00], 270.00],
    ["Land_HBarrier_01_line_5_green_F", [8.91, 3.67, 0.00], 0.00],
    ["Land_HBarrier_01_tower_green_F", [-21.15, 6.09, 0.00], 0.00],
    [opfor_mrap_armed, [-15.71, -1.05, -0.00], 0.00]
];

private _objectives_to_build = [
    [opfor_ammo_container, [-2.27, 6.72, 0.00], 270.00],
    [opfor_ammo_container, [-2.50, 14.76, 0.00], 270.00],
    [opfor_fuel_container, [-11.02, 13.18, 0.00], 0.00],
    [opfor_fuel_container, [-15.81, 13.28, 0.00], 0.00]
];

private _defenders_to_build = [
    [opfor_engineer, [-13.04, 1.42, 0.00], 145.49],
    [opfor_medic, [12.00, -11.32, 0.72], 0.00],
    [opfor_machinegunner, [9.36, -9.69, 3.13], 224.39],
    [opfor_rifleman, [-15.90, 6.20, 0.00], 53.33],
    [opfor_rifleman, [-18.61, -12.86, 0.00], 256.70],
    [opfor_rifleman, [-2.21, 2.14, 0.00], 154.38],
    [opfor_rifleman, [-21.42, 5.74, 0.00], 0.00],
    [opfor_rifleman, [-21.63, 3.43, 2.78], 259.20],
    [opfor_rifleman, [-7.60, 14.78, 0.00], 177.51],
    [opfor_rifleman, [17.97, -2.54, 0.60], 222.59],
    [opfor_at, [9.42, -3.19, 3.13], 299.23],
    [opfor_sentry, [-1.28, -12.69, 0.00], 0.00],
    [opfor_sentry, [21.72, 6.34, 0.00], 290.24],
    [opfor_marksman, [16.94, 14.54, 4.35], 333.07],
    [opfor_marksman, [19.91, 14.21, 4.35], 0.00],
    [opfor_team_leader, [10.12, -4.12, 0.60], 175.70],
    [opfor_grenadier, [-21.11, 7.85, 2.78], 285.67],
    [opfor_grenadier, [9.27, 7.95, 0.00], 0.00]
];

private _base_corners = [
    [40, 40, 0],
    [40, -40, 0],
    [-40, -40, 0],
    [-40, 40, 0]
];

[_objects_to_build, _objectives_to_build, _defenders_to_build, _base_corners]
