private _objects_to_build = [
    [opfor_flag, [-19.05, -5.29, 0.00], 0.00],
    [opfor_flag, [2.55, 4.91, 0.00], 0.00],
    ["Land_BarGate_F", [-18.53, 3.79, 0.00], 270.00],
    ["Land_Cargo_HQ_V3_F", [8.99, 1.74, 0.00], 0.00],
    ["Land_Cargo_Patrol_V3_F", [-3.15, 24.19, 0.00], 180.00],
    ["Land_HBarrier_Big_F", [-11.04, -17.98, 0.00], 0.00],
    ["Land_HBarrier_Big_F", [-11.45, 19.44, 0.00], 0.00],
    ["Land_HBarrier_Big_F", [-16.53, -7.99, 0.00], 270.00],
    ["Land_HBarrier_Big_F", [-16.80, 9.31, 0.00], 270.00],
    ["Land_HBarrier_Big_F", [-2.23, -17.62, 0.00], 0.00],
    ["Land_HBarrier_Big_F", [-3.20, 28.38, 0.00], 0.00],
    ["Land_HBarrier_Big_F", [-8.29, 25.01, 0.00], 270.00],
    ["Land_HBarrier_Big_F", [14.65, 20.26, 0.00], 0.00],
    ["Land_HBarrier_Big_F", [15.06, -17.16, 0.00], 0.00],
    ["Land_HBarrier_Big_F", [2.51, 25.17, 0.00], 270.00],
    ["Land_HBarrier_Big_F", [20.34, 10.15, 0.00], 270.00],
    ["Land_HBarrier_Big_F", [20.43, 1.59, 0.00], 270.00],
    ["Land_HBarrier_Big_F", [20.60, -7.15, 0.00], 270.00],
    ["Land_HBarrier_Big_F", [5.93, 20.00, 0.00], 0.00],
    ["Land_HBarrier_Big_F", [6.34, -17.42, 0.00], 0.00],
    ["Land_HBarrierTower_F", [-17.31, -15.72, 0.00], 90.00],
    ["Land_HBarrierTower_F", [-17.88, 17.11, 0.00], 90.00],
    ["Land_HBarrierTower_F", [21.12, 18.04, 0.00], 270.00],
    ["Land_HBarrierTower_F", [21.43, -14.52, 0.00], 270.00],
    [opfor_mrap, [-12.85, -10.52, -0.00], 180.00],
    [opfor_transport_truck, [-8.65, -8.70, 0.00], 180.00]
];
private _objectives_to_build = [
    [opfor_ammo_container, [12.70, -11.73, 0.00], 0.00],
    [opfor_ammo_container, [8.19, -11.71, 0.00], 0.00],
    [opfor_fuel_container, [12.28, 15.45, 0.00], 0.00],
    [opfor_fuel_container, [7.56, 15.24, 0.00], 0.00],
    [opfor_ammo_truck, [-12.86, 10.58, 0.00], 0.00],
    [opfor_fuel_truck, [-8.32, 10.38, 0.00], 0.00]
];
private _defenders_to_build = [
    [opfor_engineer, [-10.53, -4.64, 0.00], 0.00],
    [opfor_heavygunner, [-18.74, -15.05, 2.28], 270.00],
    [opfor_heavygunner, [22.80, 18.84, 2.28], 0.00],
    [opfor_heavygunner, [6.31, -14.37, 0.00], 318.61],
    [opfor_medic, [12.50, 1.07, 0.60], 244.47],
    [opfor_squad_leader, [7.16, -3.84, 0.60], 308.87],
    [opfor_at, [5.57, 4.09, 3.13], 270.00],
    [opfor_rifleman, [-10.39, 6.70, 0.00], 181.51],
    [opfor_rifleman, [-18.42, -16.71, 2.28], 263.48],
    [opfor_rifleman, [-19.11, 5.66, 0.00], 251.10],
    [opfor_rifleman, [-19.58, 16.36, 2.28], 262.09],
    [opfor_rifleman, [-4.32, 24.55, 4.35], 0.00],
    [opfor_rifleman, [22.19, -15.53, 2.28], 155.63],
    [opfor_rifleman, [23.32, -13.89, 2.28], 84.56],
    [opfor_rifleman, [5.96, -3.84, 3.13], 265.58],
    [opfor_sentry, [-20.00, 17.92, 2.28], 0.00],
    [opfor_sentry, [10.18, 11.45, 0.00], 214.49],
    [opfor_marksman, [-2.31, 24.52, 4.35], 0.00],
    [opfor_grenadier, [-6.11, -14.77, 0.00], 0.00],
    [opfor_grenadier, [22.96, 17.33, 2.28], 82.66]
];
private _base_corners = [
    [40, 40, 0],
    [40, -40, 0],
    [-40, -40, 0],
    [-40, 40, 0]
];

[_objects_to_build, _objectives_to_build, _defenders_to_build, _base_corners]
