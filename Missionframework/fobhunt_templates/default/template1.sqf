private _objects_to_build = [
    ["Land_HBarrierBig_F",[-15,-8,0],90],
    ["Land_HBarrierBig_F",[-15,-16.5,0],90],
    ["Land_HBarrierBig_F",[-15,-25,0],90],
    ["Land_HBarrierBig_F",[-15,8,0],90],
    ["Land_HBarrierBig_F",[-15,16.5,0],90],
    ["Land_HBarrierBig_F",[-15,25,0],90],
    ["Land_HBarrierBig_F",[15,-8,0],90],
    ["Land_HBarrierBig_F",[15,-16.5,0],90],
    ["Land_HBarrierBig_F",[15,-25,0],90],
    ["Land_HBarrierBig_F",[15,8,0],90],
    ["Land_HBarrierBig_F",[15,16.5,0],90],
    ["Land_HBarrierBig_F",[15,25,0],90],
    ["Land_HBarrierBig_F",[11,30,0],0],
    ["Land_HBarrierBig_F",[4,30,0],0],
    ["Land_HBarrierBig_F",[-4,30,0],0],
    ["Land_HBarrierBig_F",[-11,30,0],0],
    ["Land_HBarrierBig_F",[11,-30,0],0],
    ["Land_HBarrierBig_F",[4,-30,0],0],
    ["Land_HBarrierBig_F",[-4,-30,0],0],
    ["Land_HBarrierBig_F",[-11,-30,0],0],
    ["Land_Cargo_Patrol_V3_F",[-10,-26,0],0],
    ["Land_Cargo_HQ_V3_F",[4,-20,0],0],
    ["Land_Cargo_House_V3_F",[-9,24,0],0],
    ["Land_Cargo_House_V3_F",[-1,24,0],0],
    ["Land_Cargo_Patrol_V3_F",[10,24,0],180],
    ["Land_CncBarrierMedium4_F",[-21,-5,0],180],
    ["Land_CncBarrierMedium4_F",[-21,5,0],180],
    ["Land_CncBarrierMedium4_F",[21,-5,0],180],
    ["Land_CncBarrierMedium4_F",[21,5,0],180],
    ["Land_Razorwire_F",[-22,-7,0],180],
    ["Land_Razorwire_F",[-22,7,0],180],
    ["Land_Razorwire_F",[19,-7,0],180],
    ["Land_Razorwire_F",[19,7,0],180],
    ["Land_Tank_rust_F",[-9,10,0],180],
    ["Land_Tank_rust_F",[-9,14,0],180],
    ["Land_Tank_rust_F",[-9,6,0],180],
    [KPLIB_o_flag,[-14,-5,0],180],
    [KPLIB_o_flag,[-14,5,0],180],
    [KPLIB_o_flag,[14,-5,0],90],
    ["Land_BarGate_F",[20,0,0],90],
    ["Land_BarGate_F",[-13,0,0],270],
    [KPLIB_o_mrap,[7,-7,0],60]
];

private _objectives_to_build = [
    [KPLIB_o_fuelTruck,[10,8,0],185],
    [KPLIB_o_fuelTruck,[5,8.5,0],190],
    [KPLIB_o_fuelTruck,[0,9,0],192],
    [KPLIB_o_ammoTruck,[-9,-8,0],10],
    [KPLIB_o_ammoTruck,[-3,-8,0],15]
];

private _defenders_to_build = [
    [KPLIB_o_marksman,[11,26.5,4.5],0],
    [KPLIB_o_marksman,[-11,-26.5,4.5],180],
    [KPLIB_o_heavyGunner,[9,26.5,4.5],0],
    [KPLIB_o_heavyGunner,[-9,-26.5,4.5],180],
    [KPLIB_o_rifleman,[12,23,4.5],90],
    [KPLIB_o_rifleman,[-12,-23,4.5],270],
    [KPLIB_o_sentry,[6,-20,1],0],
    [KPLIB_o_sentry,[3,-23,1],90],
    [KPLIB_o_rifleman,[3,-20,1],180],
    [KPLIB_o_teamLeader,[6,-23,1],270],
    [KPLIB_o_teamLeader,[3,-18,1],180],
    [KPLIB_o_sentry,[6,-18,1],270],
    [KPLIB_o_rifleman,[-9,25,1],180],
    [KPLIB_o_sentry,[-11,25,1],180],
    [KPLIB_o_rifleman,[-1,25,1],180],
    [KPLIB_o_sentry,[-3,25,1],180],
    [KPLIB_o_sentry,[0,-5,0],0],
    [KPLIB_o_sentry,[2,5,0],180]
];

private _base_corners = [
    [30,40,0],
    [30,-40,0],
    [-30,-40,0],
    [-30,40,0]
];

[_objects_to_build, _objectives_to_build, _defenders_to_build, _base_corners]
