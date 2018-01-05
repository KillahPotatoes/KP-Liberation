class init {
    file = "modules\00_init\fnc";
    
    // Checks if given classname is inside CfgVehicles
    class init_checkClass {};

    // Create local client markers
    class init_clientMarkers {};

    // Fetches the mission parameters
    class init_fetchParams {
        preInit = 1;
    };

    // Initializes the virtual arsenal
    class init_fillArsenal {};

    // Filters not available classnames out of a given array of classnames
    class init_filterMods {};

    // Loads module specific data from the save
    class init_loadData {};

    // Loads and checks the configured unit presets
    class init_loadPresets {};

    // Client function for processing init data which was published by the server
    class init_receiveInit {};

    // Saves module specific data for the save
    class init_saveData {};

    // Sorts sector markers and fills global sector arrays 
    class init_sortSectors {};  
};
