_source = _this select 1;
_unit = _this select 0;

if(_source == true) then {
[_unit] call ACE_medical_treatment_fnc_fullHealLocal;	
} else {
	{
		[_x] call ACE_medical_treatment_fnc_fullHealLocal;
	} foreach _unit;
};