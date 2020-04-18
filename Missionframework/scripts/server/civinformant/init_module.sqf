// Scripts
// Task selection and spawning
civinfo_task = compileFinal preprocessFileLineNumbers "scripts\server\civinformant\tasks\civinfo_task.sqf";

// Start spawn loop
execVM "scripts\server\civinformant\civinfo_loop.sqf";
