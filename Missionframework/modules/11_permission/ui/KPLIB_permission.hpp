/*
    KP Liberation permission dialog

    File: KPLIB_permission.hpp
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-12-07
    Last Update: 2018-12-25
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        A lightweight permission dialog for the commander and admin.
*/

class KPLIB_permission {
    idd = 758011;
    movingEnable = 0;
    onUnload = "[KPLIB_permission_list, KPLIB_permission_default, [], []] remoteExecCall ['KPLIB_fnc_permission_syncClients', 2]";

    class controlsBackground {

        class KPLIB_DialogTitle: KPGUI_PRE_DialogTitleC {
            text = "$STR_KPLIB_DIALOG_PERMISSION_TITLE";
        };

        class KPLIB_DialogArea: KPGUI_PRE_DialogBackgroundC {};

    };

    class controls {

        class KPLIB_PlayerList: KPGUI_PRE_ListBox {
            idc = 68740;
            x = KP_GETCX(KP_X_VAL_C,KP_WIDTH_VAL_C,0,1);
            y = KP_GETCY(KP_Y_VAL_C,KP_HEIGHT_VAL_C,0,48);
            w = KP_GETW(KP_WIDTH_VAL_C,2);
            h = KP_GETH(KP_HEIGHT_VAL_C,1);
            onLBSelChanged = "[] call KPLIB_fnc_permission_setupPermissionControls";
        };

        class KPLIB_DialogCross: KPGUI_PRE_DialogCrossC {};

        class KPLIB_ResetButton: KPGUI_PRE_DialogButtonC {
            text = "$STR_KPLIB_DIALOG_BUTTON_RESET";
            onButtonClick = "[] call KPLIB_fnc_permission_resetToDefault";
        };

    };

};
