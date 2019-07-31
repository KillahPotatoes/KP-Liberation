private _objects_to_build = [
    ["Land_BarGate_F", [25.69, 12.03, 0.00], 257.61],
    ["Land_Cargo_House_V3_F", [6.05, 17.88, 0.00], 0.00],
    ["Land_Cargo_Patrol_V3_F", [-18.68, 18.47, 0.00], 180.00],
    ["Land_Cargo_Patrol_V3_F", [23.76, -10.91, 0.00], 270.00],
    ["Land_Cargo_Tower_V3_F", [-4.99, -5.71, 0.00], 180.00],
    ["Land_HBarrier_Big_F", [-10.92, 22.43, 0.00], 0.00],
    ["Land_HBarrier_Big_F", [-11.55, -10.66, 0.00], 270.00],
    ["Land_HBarrier_Big_F", [-11.58, -2.00, 0.00], 270.00],
    ["Land_HBarrier_Big_F", [-12.47, -28.10, 0.00], 25.81],
    ["Land_HBarrier_Big_F", [-12.81, 16.72, 0.00], 270.00],
    ["Land_HBarrier_Big_F", [-13.96, 3.47, 0.00], 0.00],
    ["Land_HBarrier_Big_F", [-19.69, 22.10, 0.00], 0.00],
    ["Land_HBarrier_Big_F", [-19.71, -23.42, 0.00], 222.44],
    ["Land_HBarrier_Big_F", [-2.15, 22.72, 0.00], 0.00],
    ["Land_HBarrier_Big_F", [-22.39, 3.29, 0.00], 180.12],
    ["Land_HBarrier_Big_F", [-25.43, -16.67, 0.00], 63.49],
    ["Land_HBarrier_Big_F", [-26.11, 17.30, 0.00], 299.18],
    ["Land_HBarrier_Big_F", [-27.46, -8.47, 0.00], 270.00],
    ["Land_HBarrier_Big_F", [-27.75, 0.13, 0.00], 270.00],
    ["Land_HBarrier_Big_F", [-28.03, 8.89, 0.00], 270.00],
    ["Land_HBarrier_Big_F", [-3.88, -30.03, 0.00], 6.18],
    ["Land_HBarrier_Big_F", [-5.77, 3.82, 0.00], 0.00],
    ["Land_HBarrier_Big_F", [-6.24, -13.67, 0.00], 0.00],
    ["Land_HBarrier_Big_F", [-7.83, -24.34, 0.00], 270.00],
    ["Land_HBarrier_Big_F", [1.02, -18.87, 0.00], 0.00],
    ["Land_HBarrier_Big_F", [11.27, 17.63, 0.00], 270.00],
    ["Land_HBarrier_Big_F", [11.46, -0.32, 0.00], 270.00],
    ["Land_HBarrier_Big_F", [11.64, -11.36, 0.00], 270.00],
    ["Land_HBarrier_Big_F", [11.87, -20.07, 0.00], 270.00],
    ["Land_HBarrier_Big_F", [13.46, -27.49, 0.00], 341.74],
    ["Land_HBarrier_Big_F", [14.74, -5.71, 0.00], 0.00],
    ["Land_HBarrier_Big_F", [15.58, 22.08, 0.00], 198.74],
    ["Land_HBarrier_Big_F", [2.81, 3.93, 0.00], 0.00],
    ["Land_HBarrier_Big_F", [20.94, -23.33, 0.00], 324.95],
    ["Land_HBarrier_Big_F", [22.75, 17.19, 0.00], 230.73],
    ["Land_HBarrier_Big_F", [23.45, -5.60, 0.00], 0.00],
    ["Land_HBarrier_Big_F", [26.55, -16.84, 0.00], 299.95],
    ["Land_HBarrier_Big_F", [28.45, -0.09, 0.00], 263.54],
    ["Land_HBarrier_Big_F", [28.92, -8.70, 0.00], 274.95],
    ["Land_HBarrier_Big_F", [4.95, -29.68, 0.00], 354.59],
    ["Land_HBarrier_Big_F", [6.30, -1.30, 0.00], 270.00],
    ["Land_HBarrier_Big_F", [6.52, -9.98, 0.00], 270.00],
    ["Land_HBarrier_Big_F", [6.78, -18.56, 0.00], 270.00],
    ["Land_HBarrier_Big_F", [6.93, 23.16, 0.00], 180.13],
    [opfor_flag, [14.12, 19.01, 0.00], 0.00],
    [opfor_mrap_armed, [23.49, 2.01, -0.00], 0.00],
    [opfor_mrap, [16.54, 1.76, -0.00], 0.00]
];

private _objectives_to_build = [
    [opfor_ammo_container, [-20.65, -16.90, 0.00], 326.51],
    [opfor_ammo_container, [-13.62, -23.20, 0.00], 306.22],
    [opfor_ammo_truck, [-9.16, 16.70, 0.00], 0.00],
    [opfor_fuel_container, [-18.07, -7.63, 0.00], 270.00],
    [opfor_fuel_truck, [-4.62, 16.86, 0.00], 0.00],
    [opfor_fuel_container, [-18.02, -2.18, 0.00], 270.00]
];

private _defenders_to_build = [
    [opfor_engineer, [1.33, 20.43, 0.00], 224.42],
    [opfor_heavygunner, [-9.34, -1.30, 17.89], 0.00],
    [opfor_medic, [-15.26, 18.70, 0.00], 198.18],
    [opfor_officer, [4.52, 20.27, 0.73], 121.81],
    [opfor_sharpshooter, [23.62, -12.61, 4.35], 90.59],
    [opfor_rifleman, [-2.12, -1.42, 12.77], 205.28],
    [opfor_rifleman, [-20.20, 18.70, 4.35], 0.00],
    [opfor_rifleman, [-6.93, -5.71, 15.37], 0.00],
    [opfor_rifleman, [20.35, -0.20, 0.00], 0.00],
    [opfor_rifleman, [3.38, 0.09, 0.00], 182.65],
    [opfor_rpg, [0.18, -8.11, 17.79], 129.88],
    [opfor_sentry, [-25.60, 0.02, 0.00], 156.91],
    [opfor_marksman, [-17.47, 18.68, 4.35], 0.00],
    [opfor_marksman, [23.70, -9.01, 4.35], 74.26],
    [opfor_grenadier, [14.67, -8.28, 0.00], 160.61]
];

private _base_corners = [
    [40, 40, 0],
    [40, -40, 0],
    [-40, -40, 0],
    [-40, 40, 0]
];

[_objects_to_build, _objectives_to_build, _defenders_to_build, _base_corners]
