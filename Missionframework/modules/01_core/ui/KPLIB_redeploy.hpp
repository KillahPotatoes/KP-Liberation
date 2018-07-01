/*
    KP Liberation redeploy dialog defines

    File: KPLIB_defines.hpp
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2017-10-28
    Last Update: 2018-01-05
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Redeploy dialog after respawn or select redeploy from a FOB or mobile spawn.
*/

class KPLIB_redeploy {
    idd = 75801;
    movingEnable = 0;

    class controlsBackground {

        class KPLIB_DialogTitle: KPLIB_Title {
            text = $STR_DEPLOY_TITLE;
            x = KPLIB_GUI_POS_X_CORNER;
            y = KPLIB_GUI_POS_Y_CORNER;
            w = KPLIB_GUI_WIDTH_CORNER;
        };

        class KPLIB_DialogArea: KPLIB_AreaBackground {
            x = KPLIB_GUI_POS_X_AREA_CORNER;
            y = KPLIB_GUI_POS_Y_AREA_CORNER;
            w = KPLIB_GUI_WIDTH_AREA_CORNER;
            h = KPLIB_GUI_HEIGHT_AREA_CORNER;
        };

        class LabelLoadout: KPLIB_Text {
            text = $STR_DEPLOY_LOADOUTLIST;
            x = KPLIB_GUI_POS_X_CONTENT_CORNER;
            y = KPLIB_GUI_POS_Y_CONTENT_CORNER;
            w = KPLIB_GUI_WIDTH_CONTENT_CORNER;
            h = safezoneH * 0.04;
        };

        class LabelDeploy: KPLIB_Text {
            text = $STR_DEPLOY_SPAWNLIST;
            x = KPLIB_GUI_POS_X_CONTENT_CORNER;
            y = safeZoneY + safeZoneH * (0.13 + KPLIB_GUI_HEIGTH_TITLE + KPLIB_GUI_GAP + KPLIB_GUI_AREA_PADDING)
            w = KPLIB_GUI_WIDTH_CONTENT_CORNER;
            h = safezoneH * 0.04;
        };
    };

    class controls {

        class KPLIB_LoadoutsDropdown: KPLIB_Combo {
            idc = 758011;
            x = KPLIB_GUI_POS_X_CONTENT_CORNER;
            y = safeZoneY + safeZoneH * (0.09 + KPLIB_GUI_HEIGTH_TITLE + KPLIB_GUI_GAP + KPLIB_GUI_AREA_PADDING)
            w = KPLIB_GUI_WIDTH_CONTENT_CORNER;
            h = 0.04;
        };

        class KPLIB_DeployList: KPLIB_ListBox {
            idc = 758012;
            x = KPLIB_GUI_POS_X_CONTENT_CORNER;
            y = safeZoneY + safeZoneH * (0.17 + KPLIB_GUI_HEIGTH_TITLE + KPLIB_GUI_GAP + KPLIB_GUI_AREA_PADDING)
            w = KPLIB_GUI_WIDTH_CONTENT_CORNER;
            h = safezoneH * 0.25;
        };

        class KPLIB_DeployMap: KPLIB_MapControl {
            idc = 758013;
            x = KPLIB_GUI_POS_X_CONTENT_CORNER;
            y = safeZoneY + safeZoneH * (0.42 + KPLIB_GUI_HEIGTH_TITLE + 2 * KPLIB_GUI_GAP + KPLIB_GUI_AREA_PADDING)
            w = KPLIB_GUI_WIDTH_CONTENT_CORNER;
            h = safezoneH * 0.3275;
        };

        class DeployButton: KPLIB_Button {
            text = $STR_DEPLOY_BUTTON;
            x = KPLIB_GUI_POS_X_CORNER;
            y = safeZoneY + safeZoneH * (0.8 + KPLIB_GUI_GAP);
            w = KPLIB_GUI_WIDTH_CORNER;
            h = safeZoneH * KPLIB_GUI_HEIGTH_TITLE;
            sizeEx = GUI_TEXT_SIZE_LARGE;
            action = "KPLIB_dialog_deploy = 1";
        };
    };
};
