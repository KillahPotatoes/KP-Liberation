/*
    --- USAGE ---

    Place this file in the Eden mission folder where you want to build your FOB templates.
    After building your FOB in Eden, place down a center object in the middle of your FOB.
    I recommend a small cluttercutter object (Land_ClutterCutter_small_F) for this.

    In the init field of the center object add:
        _ = [this] execVM "export_template.sqf";

    Then preview the mission in eden to execute the script.

    The fetched information can be found in your client rpt (between the START and END line) for copy/paste.
    Ref for finding your RPT file: https://community.bistudio.com/wiki/Crash_Files#Arma_3

    --- RECOMMENDATIONS ---

    !IMPORTANT! Don't (!) exceed an area with a radius of 35m for the FOB. !IMPORTANT!

    You could create a trigger with that radius and use it as "build area helper".
    After exporting the template, you should replace possible placed vehicles or crates etc. with the Liberation variables.
    Have a look at the other templates to get an idea of it.
*/

params [
    ["_center", player, [objNull]]
];

diag_log text "";
diag_log text "";
diag_log text "[KP LIBERATION] [FOB EXPORT] ---------- START ----------";

// Fetch all objects
diag_log text "";
diag_log text "private _objects_to_build = [";
{
    diag_log text format [
        "    [""%1"", [%2, %3, %4], %5],",
        typeof _x,
        ((getpos _x select 0) - (getpos _center select 0)) toFixed 2,
        ((getpos _x select 1) - (getpos _center select 1)) toFixed 2,
        (getposatl _x select 2) toFixed 2,
        (getdir _x) toFixed 2
    ];
} forEach ((nearestObjects [_center, ["All"], 40]) - ((nearestObjects [_center, ["Man","Animal"], 40]) + [_center]));
diag_log text "];";

diag_log text "";
diag_log text "private _objectives_to_build = [";
diag_log text "    // Move all things which should be destroyed to accomplish the mission from the above to this array";
diag_log text "];";

// Fetch all infantry/guards
diag_log text "";
diag_log text "private _defenders_to_build = [";
{
    diag_log text format [
        "    [""%1"", [%2, %3, %4], %5],",
        typeof _x,
        ((getpos _x select 0) - (getpos _center select 0)) toFixed 2,
        ((getpos _x select 1) - (getpos _center select 1)) toFixed 2,
        (getposatl _x select 2) toFixed 2,
        (getdir _x) toFixed 2
    ];
} forEach ((nearestObjects [_center, ["Man"], 40]) - ((nearestObjects [_center, [ "Animal" ], 40]) + [_center]));
diag_log text "];";

diag_log text "";
diag_log text "private _base_corners = [";
diag_log text "    [40, 40, 0],";
diag_log text "    [40, -40, 0],";
diag_log text "    [-40, -40, 0],";
diag_log text "    [-40, 40, 0],";
diag_log text "];";

diag_log text "";
diag_log text "[_objects_to_build, _objectives_to_build, _defenders_to_build, _base_corners]";

diag_log text "";
diag_log text "[KP LIBERATION] [FOB EXPORT] ---------- END ----------";
diag_log text "";
diag_log text "";

true
