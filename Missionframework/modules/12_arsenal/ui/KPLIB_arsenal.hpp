/*
    KP Liberation arsenal dialog

    File: KPLIB_arsenal.hpp
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-11-12
    Last Update: 2018-12-14
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        A lightweight pre arsenal dialog which provides several features, like equipment loading/copying and the arsenal access.
*/

class KPLIB_arsenal {
    idd = 758012;
    movingEnable = 0;

    class controlsBackground {

        class KPLIB_DialogTitle: KPGUI_PRE_DialogTitleC {
            text = "$STR_KPLIB_DIALOG_ARSENAL_TITLE";
        };

        class KPLIB_DialogArea: KPGUI_PRE_DialogBackgroundC {};

    };

    class controls {

        class KPLIB_LoadoutList: KPGUI_PRE_ListBox {
            idc = 68740;
            x = KP_GETCX(KP_X_VAL_C,KP_WIDTH_VAL_C,0,1);
            y = KP_GETCY(KP_Y_VAL_C,KP_HEIGHT_VAL_C,0,48);
            w = KP_GETW(KP_WIDTH_VAL_C,1);
            h = KP_GETH(KP_HEIGHT_VAL_C,(48/32));
        };

        class KPLIB_ButtonLoad: KPGUI_PRE_InlineButton {
            text = "$STR_KPLIB_DIALOG_ARSENAL_LOAD";
            x = KP_GETCX(KP_X_VAL_C,KP_WIDTH_VAL_C,0,1);
            y = KP_GETCY(KP_Y_VAL_C,KP_HEIGHT_VAL_C,32,48);
            w = KP_GETW(KP_WIDTH_VAL_C,1);
            h = KP_GETH(KP_HEIGHT_VAL_C,16);
            onButtonClick = "[] call KPLIB_fnc_arsenal_applyLoadout";
        };

        class KPLIB_ButtonSetDefault: KPLIB_ButtonLoad {
            text = "$STR_KPLIB_DIALOG_ARSENAL_DEFAULT";
            y = KP_GETCY(KP_Y_VAL_C,KP_HEIGHT_VAL_C,35,48);
            h = KP_GETH(KP_HEIGHT_VAL_C,24);
            onButtonClick = "[] call KPLIB_fnc_arsenal_setDefaultLoadout";
        };

        class KPLIB_ComboNear: KPGUI_PRE_Combo {
            idc = 68741;
            x = KP_GETCX(KP_X_VAL_C,KP_WIDTH_VAL_C,0,1);
            y = KP_GETCY(KP_Y_VAL_C,KP_HEIGHT_VAL_C,39,48);
            w = KP_GETW(KP_WIDTH_VAL_C,(12/11));
            h = KP_GETH(KP_HEIGHT_VAL_C,24);
        };

        class KPLIB_RefreshNear: KPGUI_PRE_CloseCross {
            text = "KPGUI\res\icon_refresh.paa";
            x = KP_GETCX(KP_X_VAL_C,KP_WIDTH_VAL_C,11,12);
            y = KP_GETCY(KP_Y_VAL_C,KP_HEIGHT_VAL_C,39,48);
            w = KP_GETW(KP_WIDTH_VAL_C,12);
            h = KP_GETH(KP_HEIGHT_VAL_C,24);
            tooltip = "$STR_KPLIB_DIALOG_ARSENAL_REFRESH_TT";
            action = "[] call KPLIB_fnc_arsenal_getNearPlayers";
        };

        class KPLIB_ButtonLoadNear: KPLIB_ButtonSetDefault {
            text = "$STR_KPLIB_DIALOG_ARSENAL_LOADNEAR";
            y = KP_GETCY(KP_Y_VAL_C,KP_HEIGHT_VAL_C,41,48);
            onButtonClick = "[] call KPLIB_fnc_arsenal_copyLoadout";
        };

        class KPLIB_ButtonOpen: KPLIB_ButtonLoad {
            text = "$STR_KPLIB_DIALOG_ARSENAL_OPEN";
            y = KP_GETCY(KP_Y_VAL_C,KP_HEIGHT_VAL_C,45,48);
            onButtonClick = "[] call KPLIB_fnc_arsenal_openArsenal";
        };

        class KPLIB_DialogCross: KPGUI_PRE_DialogCrossC {};

    };

};
