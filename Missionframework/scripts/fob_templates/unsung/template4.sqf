private _objects_to_build = [
    ["Land_Campfire_burning", [-2.54, 0.11, -0.03], 0.00],
    ["LAND_uns_vcshelter1", [-3.90, 0.16, 0.00], 0.00],
    ["LAND_uns_vcshelter2", [5.75, 9.72, 0.00], 90.00],
    ["LAND_uns_vcshelter2", [9.24, 6.72, 0.00], 175.56],
    ["LAND_uns_vctower1", [-13.31, 13.96, 0.00], 144.79],
    ["LAND_uns_vctower1", [-14.13, -13.21, 0.00], 42.90],
    ["LAND_uns_vctower1", [12.95, -12.88, 0.00], 318.28],
    ["LAND_uns_vctower1", [13.68, 14.05, 0.00], 224.50],
    [opfor_mrap, [9.04, -7.43, -0.00], 270.00],
    [opfor_flag, [-6.05, -13.43, 0.00], 0.00],
    [opfor_flag, [0.55, 14.33, 0.00], 0.00],
    ["Vil_Fence", [-14.66, 12.34, 0.00], 270.00],
    ["Vil_Fence", [-14.71, 6.41, 0.00], 270.00],
    ["Vil_Fence", [-14.77, 0.42, 0.00], 270.00],
    ["Vil_Fence", [-14.86, -5.61, 0.00], 270.00],
    ["Vil_Fence", [-6.15, 14.69, 0.00], 0.00],
    ["Vil_Fence", [-6.50, -14.03, 0.00], 0.00],
    ["Vil_Fence", [11.80, -13.94, 0.00], 0.00],
    ["Vil_Fence", [12.15, 14.78, 0.00], 0.00],
    ["Vil_Fence", [14.65, -5.31, 0.00], 270.00],
    ["Vil_Fence", [14.74, 0.72, 0.00], 270.00],
    ["Vil_Fence", [14.79, 6.71, 0.00], 270.00],
    ["Vil_Fence", [14.85, 12.65, 0.00], 270.00],
    ["Vil_Fence", [5.86, -13.88, 0.00], 0.00],
    ["Vil_Fence", [6.21, 14.84, 0.00], 0.00],
    ["wx_chair", [-3.49, 1.43, 0.00], 322.25],
    ["wx_chair", [-4.20, -0.30, 0.00], 283.18]
];

private _objectives_to_build = [
    [opfor_ammo_truck, [9.96, -2.73, 0.00], 270.00],
    [opfor_fuel_truck, [10.24, 2.73, 0.00], 270.00],
    [opfor_ammo_container, [-10.12, -7.24, 0.00], 270.00],
    [opfor_ammo_container, [-9.74, -2.72, 0.00], 270.00],
    [opfor_fuel_container, [-9.75, 2.07, 0.00], 270.00],
    [opfor_fuel_container, [-9.82, 6.30, 0.00], 270.00]
];

private _defenders_to_build = [
    [opfor_engineer, [12.94, -4.11, 0.00], 93.06],
    [opfor_heavygunner, [-13.52, -13.88, 4.88], 186.59],
    [opfor_medic, [8.98, 11.77, 0.00], 210.35],
    [opfor_rifleman, [-13.37, 0.92, 0.00], 271.85],
    [opfor_rifleman, [-13.78, 13.34, 4.87], 235.25],
    [opfor_rifleman, [-4.09, 0.81, 0.00], 114.75],
    [opfor_rifleman, [-6.94, 13.46, 0.00], 0.00],
    [opfor_rifleman, [14.09, 13.37, 4.83], 98.03],
    [opfor_at, [6.97, 0.37, 0.00], 285.40],
    [opfor_sentry, [-14.61, -12.85, 4.83], 239.93],
    [opfor_sentry, [-4.64, -1.39, 0.00], 147.93],
    [opfor_sentry, [12.63, -13.31, 4.83], 197.32],
    [opfor_marksman, [-13.29, 14.03, 4.85], 323.41],
    [opfor_marksman, [12.96, 14.41, 4.87], 0.00],
    [opfor_marksman, [13.41, -12.52, 4.86], 126.65],
    [opfor_squad_leader, [9.30, 8.28, 0.00], 250.30],
    [opfor_grenadier, [1.15, -12.96, 0.00], 206.96]
];

private _base_corners = [
    [40, 40, 0],
    [40, -40, 0],
    [-40, -40, 0],
    [-40, 40, 0]
];

[_objects_to_build, _objectives_to_build, _defenders_to_build, _base_corners]
