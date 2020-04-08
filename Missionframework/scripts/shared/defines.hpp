// Get parameter
#define GET_PARAM(outVar, paramName, paramDefault)          outVar = [paramName,paramDefault] call KPLIB_fnc_getSaveableParam;\
                                                            publicVariable #outVar;\
                                                            diag_log format ["[KP LIBERATION] [PARAM] %1: %2", paramName, outVar]

// Get parameter and convert to bool
#define GET_PARAM_BOOL(outVar, paramName, paramDefault)     outVar = ([paramName,paramDefault] call KPLIB_fnc_getSaveableParam) isEqualTo 1;\
                                                            publicVariable #outVar;\
                                                            diag_log format ["[KP LIBERATION] [PARAM] %1: %2", paramName, outVar]
