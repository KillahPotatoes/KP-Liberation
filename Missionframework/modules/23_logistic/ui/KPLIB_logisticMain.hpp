/*
    KP Liberation logistic main dialog

    File: KPLIB_logisticMain.hpp
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-01-16
    Last Update: 2019-04-05
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        A small logistic dialog for the logistic station to choose one of the added menus.
        Can be easily expanded, as it's basically just a button list.
*/

class KPLIB_logisticMain {
    idd = 7580231;
    movingEnable = 0;

    class controlsBackground {

        class KPLIB_DialogTitle: KPGUI_PRE_DialogTitleC {
            text = "$STR_KPLIB_DIALOG_LOGISTICMAIN_TITLE";
        };

    };

    class controls {

        class KPLIB_DialogCross: KPGUI_PRE_DialogCrossC {};

    };
};
