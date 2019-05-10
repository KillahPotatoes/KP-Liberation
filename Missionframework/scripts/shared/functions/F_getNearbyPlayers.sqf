params [ "_searchposition", "_distance"];

allPlayers select {alive _x && _x distance _searchposition < _distance}
