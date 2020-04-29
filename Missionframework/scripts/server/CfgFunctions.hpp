class server_highcommand
{
    file = "scripts\server\highcommand";
    class highcommand               {ext = ".fsm";};
};

class server_sector
{
    file = "scripts\server\sector";
    class destroyFob                {};
    class sectorMonitor             {ext = ".fsm";};
    class spawnSectorCrates         {};
};

class server_support
{
    file = "scripts\server\support";
    class createSuppModules         {};
};
