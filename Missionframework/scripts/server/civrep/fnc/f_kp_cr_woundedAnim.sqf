/*
f_kp_cr_woundedAnim.sqf
Author: veteran29

Description:
Play random wounded animation on given unit
*/
params ["_unit"];

private _anim = selectRandom ["Acts_CivilInjuredHead_1", "Acts_CivilInjuredArms_1", "Acts_CivilInjuredChest_1", "Acts_CivilInjuredLegs_1", "Acts_CivilInjuredGeneral_1", "Acts_SittingWounded_loop"];
[_unit, _anim] remoteExec ["switchMove"]; 
