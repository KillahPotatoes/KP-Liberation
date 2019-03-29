/*
    KP Liberation Garrison Dialog

    File: KPLIB_garrison.hpp
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-03-19
    Last Update: 2019-03-29
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Dialog for the commander to manage blufor sector garrisons.
*/

class KPLIB_garrison {
    idd = 75804;
    movingEnable = 0;

    class controlsBackground {

        class KPLIB_DialogTitle: KPGUI_PRE_DialogTitle {
            text = "$STR_KPLIB_DIALOG_GARRISON_TITLE";
        };

        class KPLIB_DialogArea: KPGUI_PRE_DialogBackground {};
    };

    class controls {
        class KPLIB_GarrisonList: KP_Listbox {
            idc = 758041;
            x = KP_GETCX(KP_X_VAL,KP_WIDTH_VAL,0,1);
            y = KP_GETCY(KP_Y_VAL,KP_HEIGHT_VAL,0,8);
            w = KP_GETW(KP_WIDTH_VAL,4);
            h = KP_GETH(KP_HEIGHT_VAL,1);
        };

        class KPLIB_DialogCross: KPGUI_PRE_DialogCross {};
    };
};
