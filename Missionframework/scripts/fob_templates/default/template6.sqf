private _objects_to_build = [
    ["Land_HBarrier_Big_F", [1.26, 3.05, 0.00], 270.00],
    ["Land_HBarrierWall_corridor_F", [3.15, -3.47, 0.00], 0.00],
    ["Land_HBarrier_3_F", [6.63, -1.77, 0.00], 0.00],
    ["Land_HBarrier_Big_F", [1.30, -10.24, 0.00], 270.00],
    ["Land_HBarrier_3_F", [-11.31, -3.66, 0.00], 0.00],
    ["Land_HBarrier_3_F", [10.17, -1.77, 0.00], 0.00],
    ["Land_HBarrier_Big_F", [1.30, 11.84, 0.00], 270.00],
    ["Land_HBarrier_3_F", [10.39, -5.08, 0.00], 0.00],
    ["Land_HBarrier_5_F", [-17.00, -3.61, 0.00], 0.00],
    ["Land_HBarrier_3_F", [13.91, -4.95, 0.00], 0.00],
    ["Land_HBarrier_Big_F", [4.46, -15.53, 0.00], 0.00],
    ["Land_Cargo_Patrol_V3_F", [14.31, -9.82, 0.00], 270.00],
    ["Land_BarGate_F", [-2.24, -15.93, 0.00], 0.00],
    ["Land_HBarrier_Big_F", [2.95, 17.31, 0.00], 0.00],
    ["Land_HBarrier_Big_F", [17.88, -2.95, 0.00], 270.00],
    ["Land_HBarrier_Big_F", [-5.57, 17.11, 0.00], 0.00],
    ["Land_Cargo_Patrol_V3_F", [-13.93, 12.36, 0.00], 180.00],
    ["Land_HBarrier_Big_F", [17.64, 5.67, 0.00], 270.00],
    ["Land_HBarrier_Big_F", [-18.70, -3.80, 0.00], 270.00],
    ["Land_HBarrier_Big_F", [12.73, -15.14, 0.00], 0.00],
    ["Land_HBarrier_Big_F", [-19.06, 4.79, 0.00], 270.00],
    ["Land_HBarrier_Big_F", [11.68, 17.41, 0.00], 0.00],
    ["Land_HBarrier_Big_F", [18.24, -11.71, 0.00], 270.00],
    ["Land_HBarrierTower_F", [-14.27, -16.29, 0.00], 0.00],
    ["Land_HBarrier_Big_F", [-14.18, 16.76, 0.00], 0.00],
    ["Land_HBarrier_Big_F", [-18.39, -12.33, 0.00], 270.00],
    ["Land_HBarrier_Big_F", [17.25, 14.49, 0.00], 270.00],
    ["Land_HBarrier_Big_F", [-19.27, 13.26, 0.00], 270.00]
];

private _objectives_to_build = [
    [opfor_fuel_truck, [-13.32, -0.24, 0.00], 270.00],
    [opfor_ammo_truck, [-13.24, 3.86, 0.00], 270.00],
    [opfor_fuel_container, [6.71, 13.81, 0.00], 270.00],
    [opfor_ammo_container, [7.09, 1.62, 0.00], 270.00],
    [opfor_fuel_container, [6.87, 7.71, 0.00], 270.00]
];

private _defenders_to_build = [
    [opfor_machinegunner, [3.87, -7.16, 0.00], 102.55],
    [opfor_rpg, [4.48, 10.62, 0.00], 90.00],
    [opfor_rpg, [-1.45, 14.18, 0.00], 199.35],
    [opfor_sentry, [4.03, -13.81, 0.00], 45.23],
    [opfor_engineer, [14.05, -8.39, 4.35], 58.33],
    [opfor_grenadier, [-16.46, -5.86, 0.00], 90.00],
    [opfor_machinegunner, [-16.45, 6.53, 0.00], 90.00],
    [opfor_sentry, [-12.40, 12.03, 4.35], 0.00],
    [opfor_rifleman, [14.11, -11.35, 4.35], 134.48],
    [opfor_rifleman, [-15.71, 12.02, 4.35], 355.76],
    [opfor_rifleman, [14.62, 15.10, 0.00], 180.00],
    [opfor_rifleman, [-13.29, -17.54, 2.28], 163.03],
    [opfor_heavygunner, [-14.64, -17.31, 2.28], 180.00]
];

private _base_corners = [
    [40, 40, 0],
    [40, -40, 0],
    [-40, -40, 0],
    [-40, 40, 0]
];

[_objects_to_build, _objectives_to_build, _defenders_to_build, _base_corners]
