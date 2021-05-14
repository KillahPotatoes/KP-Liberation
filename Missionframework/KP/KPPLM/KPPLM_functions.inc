/*
    KP PLAYER MENU FUNCTIONS

    File: KPPLM_functions.inc
    Author: Wyqer - https://github.com/KillahPotatoes
    Date: 2018-06-02
    Last Update: 2020-04-08
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Defines for all functions for the KP Player Menu.
*/

class KPPLM {
    class main {
        file = "KP\KPPLM\fnc";

        // Apply and save settings
        class apply {};

        // Creates a new group
        class create {};

        // Apply view distance and sound volume
        class getInOut {};

        // Joins selected group
        class join {};

        // Open the dialog
        class openDialog {};

        // Module post initialization
        class postInit {};

        // Module pre initialization
        class preInit {
            preInit = 1;
        };

        // Applies new name to group
        class rename {};

        // Save dialog settings
        class save {};

        // Get and display KP Ranks data
        class showRankData {};
    };
};
