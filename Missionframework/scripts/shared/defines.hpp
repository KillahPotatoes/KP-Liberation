
/*
	Methods
*/

// Get parameter
#define GET_PARAM(outVar, paramName, paramDefault)		outVar = [paramName,paramDefault] call F_getSaveableParam;publicVariable #outVar

// Get parameter and convert to bool
#define GET_PARAM_BOOL(outVar, paramName, paramDefault)	outVar = [paramName,paramDefault] call F_getSaveableParam;\
														if (outVar == 1) then {outVar = true} else {outVar = false};publicVariable #outVar

/*
	Modifiers for params conversion to float
*/

// Difficulty
#define MOD_DIFFICULTY_TOURIST							0.5
#define MOD_DIFFICULTY_EASY								0.75
#define MOD_DIFFICULTY_NORMAL							1
#define MOD_DIFFICULTY_MODERATE							1.25
#define MOD_DIFFICULTY_HARD								1.5
#define MOD_DIFFICULTY_EXTREME							2
#define MOD_DIFFICULTY_LUDICROUS						4
#define MOD_DIFFICULTY_IMPOSSIBLE						10									
// Unitcap
#define MOD_UNITCAP_50									0.5
#define MOD_UNITCAP_75									0.75
#define MOD_UNITCAP_100									1
#define MOD_UNITCAP_125									1.25
#define MOD_UNITCAP_150									1.50
#define MOD_UNITCAP_200									2
// Aggressivity
#define MOD_AGGRESSIVTY_ANEMIC							0.25
#define MOD_AGGRESSIVTY_WEAK							0.50
#define MOD_AGGRESSIVTY_NORMAL							1
#define MOD_AGGRESSIVTY_STRONG							2
#define MOD_AGGRESSIVTY_EXTREME							4
// Civilian Activity
#define MOD_CIVILIANS_NONE								0
#define MOD_CIVILIANS_REDUCED							0.5
#define MOD_CIVILIANS_NORMAL							1
#define MOD_CIVILIANS_INCREASED							2
// Resources multipier
#define MOD_RESOURCES_25								0.25
#define MOD_RESOURCES_50								0.50
#define MOD_RESOURCES_75								0.75
#define MOD_RESOURCES_100								1
#define MOD_RESOURCES_125								1.25
#define MOD_RESOURCES_150								1.50
#define MOD_RESOURCES_200								2
#define MOD_RESOURCES_300								3
