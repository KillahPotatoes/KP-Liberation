// this addeventhandler ["fired", {_this execvm "RHS_disposables.sqf"}];
// "rhs_weap_rpg26_used"
// "rhs_weap_M136_used"
// "rhs_weap_rshg2_used"
// "rhs_weap_rpg18_used"


_unit = _this select 0;
_weapon = _this select 1;


_disposables = ["rhs_weap_rpg26","rhs_weap_M136","rhs_weap_rshg2","rhs_weap_rpg18", "launch_NLAW_F", "rhs_weap_M136_hedp", "rhs_weap_M136_hp"];

if (!(_weapon in _disposables)) exitwith {};

_oldtube = format ["%1_used",_weapon];

//debug
//hint format ["%1 fired",_weapon];


waituntil { _oldtube in weapons _unit };
//waituntil { "rhs_weap_rpg26_used" in weapons _unit };


//Remove tube
_unit removeWeapon _oldtube;
_unit switchmove "AmovPercMstpSlowWrflDnon_AmovPercMstpSrasWrflDnon";
//Throw tube
_tube = "GroundWeaponHolder" createVehicle getpos _unit;
_tube setposatl (getposatl _unit);
_tube setdir (getdir _unit + 90);
_tube addweaponcargo [_oldtube, 1];