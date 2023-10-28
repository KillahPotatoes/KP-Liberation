scriptName "broadcast_squad_colors";

while { true } do {

    if ( local group player ) then {
        {
            if ( _x getVariable ["KPLIB_squad_color", "MAIN"] != assignedTeam _x ) then {
                _x setVariable ["KPLIB_squad_color", assignedTeam _x, true ];
            };
        } foreach (units group player);
    };

    sleep 5;
};
