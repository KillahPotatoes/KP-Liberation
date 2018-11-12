/*
    KP Liberation admin dialog

    File: KPLIB_admin.hpp
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-07-27
    Last Update: 2018-11-11
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        A small admin dialog for the server admin to access some maintenance features.
        Can be easily expanded, as it's basically just a button list.
*/


class KPLIB_admin {
    idd = 75802;
    movingEnable = 0;

    class controlsBackground {

        class KPLIB_DialogTitle: KPGUI_PRE_DialogTitleC {
            text = "$STR_KPLIB_DIALOG_ADMIN_TITLE";
        };
    };

    class controls {

        class KPLIB_DialogCross: KPGUI_PRE_DialogCrossC {};

        class KPLIB_ExportButton: KPGUI_PRE_DialogButtonC {
            text = "$STR_KPLIB_DIALOG_ADMIN_EXP";
            y = safeZoneY + safeZoneH * (KP_Y_VAL_C + KP_HEIGTH_TITLE + KP_SPACING_Y);
            tooltip = "$STR_KPLIB_DIALOG_ADMIN_EXP_TT";
            onButtonClick = "[] call KPLIB_fnc_adm_exportSave";
        };

        class KPLIB_ImportButton: KPGUI_PRE_DialogButtonC {
            idc = 758021;
            text = "$STR_KPLIB_DIALOG_ADMIN_IMP";
            y = safeZoneY + safeZoneH * (KP_Y_VAL_C + KP_HEIGTH_TITLE + KP_HEIGTH_BUTTON + 2 * KP_SPACING_Y);
            tooltip = "$STR_KPLIB_DIALOG_ADMIN_IMP_TT";
            onButtonClick = "[] call KPLIB_fnc_adm_importSave";
        };

        class KPLIB_DeleteButton: KPGUI_PRE_DialogButtonC {
            idc = 758022;
            text = "$STR_KPLIB_DIALOG_ADMIN_DEL";
            y = safeZoneY + safeZoneH * (KP_Y_VAL_C + KP_HEIGTH_TITLE + 2 * KP_HEIGTH_BUTTON + 3 * KP_SPACING_Y);
            tooltip = "$STR_KPLIB_DIALOG_ADMIN_DEL_TT";
            onButtonClick = "[] call KPLIB_fnc_adm_deleteExport";
        };

        class KPLIB_WipeButton: KPGUI_PRE_DialogButtonC {
            text = "$STR_KPLIB_DIALOG_ADMIN_WIPE";
            y = safeZoneY + safeZoneH * (KP_Y_VAL_C + KP_HEIGTH_TITLE + 3 * KP_HEIGTH_BUTTON + 4 * KP_SPACING_Y);
            tooltip = "$STR_KPLIB_DIALOG_ADMIN_WIPE_TT";
            onButtonClick = "[] call KPLIB_fnc_adm_wipe";
        };
    };
};
