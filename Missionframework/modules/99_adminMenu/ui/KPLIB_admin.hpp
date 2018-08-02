/*
    KP Liberation admin dialog

    File: KPLIB_admin.hpp
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-07-27
    Last Update: 2018-08-02
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    A small admin dialog for the server admin to access some maintenance features.
    Can be easily expanded, as it's basically just a button list.
*/


class KPLIB_admin {
    idd = 75802;
    movingEnable = 0;

    class controlsBackground {

        class KPLIB_DialogTitle: KP_DialogTitleC {
            text = "$STR_ADMINDIALOG_TITLE";
        };
    };

    class controls {

        class KPLIB_DialogCross: KP_DialogCrossC {};

        class KPLIB_ExportButton: KP_DialogButtonC {
            y = safeZoneY + safeZoneH * (KP_Y_VAL_C + KP_HEIGTH_TITLE + KP_SPACING_Y);
            text = "$STR_ADMINDIALOG_EXP";
            tooltip = "$STR_ADMINDIALOG_EXPDESC";
            onButtonClick = "call KPLIB_fnc_adm_exportSave";
        };

        class KPLIB_ImportButton: KP_DialogButtonC {
            idc = 758021
            y = safeZoneY + safeZoneH * (KP_Y_VAL_C + KP_HEIGTH_TITLE + KP_HEIGTH_BUTTON + 2 * KP_SPACING_Y);
            text = "$STR_ADMINDIALOG_IMP";
            tooltip = "$STR_ADMINDIALOG_IMPDESC";
            onButtonClick = "call KPLIB_fnc_adm_importSave";
        };
    };
};
