/*
    KP Liberation mission dialog

    File: KPLIB_mission.hpp
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-06-15
    Last Update: 2019-06-15
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

    Description:
        A lightweight mission dialog to buy and start sidemissions.
*/

class KPLIB_mission {
    idd = KPLIB_IDC_MISSION_DIALOG;
    movingEnable = 0;

    class controlsBackground {

        class KPLIB_DialogTitle: KPGUI_PRE_DialogTitleC {
            text = "Mission selection";
        };

        class KPLIB_DialogArea: KPGUI_PRE_DialogBackgroundC {};

    };

    class controls {

    };

};
