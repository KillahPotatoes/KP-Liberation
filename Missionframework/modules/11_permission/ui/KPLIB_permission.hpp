/*
    KP Liberation permission dialog

    File: KPLIB_permission.hpp
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-12-07
    Last Update: 2019-05-19
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        A lightweight permission dialog for the commander and admin.
*/

class KPLIB_permission {
    idd = KPLIB_IDC_PERMISSION_DIALOG;
    movingEnable = 0;

    class controlsBackground {

        class KPLIB_DialogTitle: KPGUI_PRE_DialogTitleC {
            text = "$STR_KPLIB_DIALOG_PERMISSION_TITLE";
        };

        class KPLIB_DialogArea: KPGUI_PRE_DialogBackgroundC {};

    };

    class controls {

        class KPLIB_PlayerList: KPGUI_PRE_ListBox {
            idc = KPLIB_IDC_PERMISSION_PLAYERLIST;
            x = KP_GETCX(KP_X_VAL_C,KP_WIDTH_VAL_C,0,1);
            y = KP_GETCY(KP_Y_VAL_C,KP_HEIGHT_VAL_C,0,48);
            w = KP_GETW(KP_WIDTH_VAL_C,2);
            h = KP_GETH(KP_HEIGHT_VAL_C,(24/22));
            onLBSelChanged = "[] call KPLIB_fnc_permission_setupPermissionControls";
        };

        class KPLIB_Permissions: KPGUI_PRE_ControlsGroup {
            idc = KPLIB_IDC_PERMISSION_PERMISSIONS;
            x = KP_GETCX(KP_X_VAL_C,KP_WIDTH_VAL_C,1,2);
            y = KP_GETCY(KP_Y_VAL_C,KP_HEIGHT_VAL_C,0,1);
            w = KP_GETW(KP_WIDTH_VAL_C,2);
            h = KP_GETH(KP_HEIGHT_VAL_C,1);
        };

        class KPLIB_ButtonExport: KPGUI_PRE_InlineButton {
            text = "$STR_KPLIB_DIALOG_PERMISSION_EXPORT";
            x = KP_GETCX(KP_X_VAL_C,KP_WIDTH_VAL_C,0,1);
            y = KP_GETCY(KP_Y_VAL_C,KP_HEIGHT_VAL_C,22,24);
            w = KP_GETW(KP_WIDTH_VAL_C,2);
            h = KP_GETH(KP_HEIGHT_VAL_C,24);
            tooltip = "$STR_KPLIB_DIALOG_PERMISSION_EXPORT_TT";
            onButtonClick = "[] call KPLIB_fnc_permission_export";
        };

        class KPLIB_ButtonImport: KPLIB_ButtonExport {
            text = "$STR_KPLIB_DIALOG_PERMISSION_IMPORT";
            y = KP_GETCY(KP_Y_VAL_C,KP_HEIGHT_VAL_C,23,24);
            tooltip = "$STR_KPLIB_DIALOG_PERMISSION_IMPORT_TT";
            onButtonClick = "[] call KPLIB_fnc_permission_import";
        };

        class KPLIB_DialogCross: KPGUI_PRE_DialogCrossC {};

        class KPLIB_ResetButton: KPGUI_PRE_DialogButtonC {
            text = "$STR_KPLIB_DIALOG_BUTTON_RESET";
            onButtonClick = "[] call KPLIB_fnc_permission_resetToDefault";
        };

    };

};
