/*
    KP Liberation Garrison Dialog

    File: KPLIB_garrison.hpp
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-03-19
    Last Update: 2019-03-31
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

        class KPLIB_GarrisonListTitle: KPGUI_PRE_InlineTitle {
            text = "$STR_KPLIB_DIALOG_GARRISON_LISTHEADER";
            x = KP_GETCX(KP_X_VAL,KP_WIDTH_VAL,0,1);
            y = KP_GETCY(KP_Y_VAL,KP_HEIGHT_VAL,0,16);
            w = KP_GETW(KP_WIDTH_VAL,4);
            h = KP_GETH(KP_HEIGHT_VAL,16);
        };

        class KPLIB_GarrisonControlsTitle: KPGUI_PRE_InlineTitle {
            text = "$STR_KPLIB_DIALOG_GARRISON_REINFORCEHEADER";
            x = KP_GETCX(KP_X_VAL,KP_WIDTH_VAL,3,4);
            y = KP_GETCY(KP_Y_VAL,KP_HEIGHT_VAL,0,16);
            w = KP_GETW(KP_WIDTH_VAL,4);
            h = KP_GETH(KP_HEIGHT_VAL,16);
        };
    };

    class controls {
        class KPLIB_GarrisonList: KPGUI_PRE_Listbox {
            idc = 758041;
            onLBSelChanged = "_this call KPLIB_fnc_garrison_dialogSelectSector";
            x = KP_GETCX(KP_X_VAL,KP_WIDTH_VAL,0,1);
            y = KP_GETCY(KP_Y_VAL,KP_HEIGHT_VAL,1,16);
            w = KP_GETW(KP_WIDTH_VAL,4);
            h = KP_GETH(KP_HEIGHT_VAL,(16/15));
        };

        class KPLIB_GarrisonSectorName: KPGUI_PRE_InlineTitle {
            idc = 758042;
            text = "";
            x = KP_GETCX(KP_X_VAL,KP_WIDTH_VAL,1,4);
            y = KP_GETCY(KP_Y_VAL,KP_HEIGHT_VAL,0,16);
            w = KP_GETW(KP_WIDTH_VAL,2);
            h = KP_GETH(KP_HEIGHT_VAL,16);
        };

        class KPLIB_GarrisonAlertNote: KPLIB_GarrisonSectorName {
            idc = 758043;
            text = "$STR_KPLIB_DIALOG_GARRISON_ALERTNOTE";
            colorBackground[] = {0.8, 0, 0, 0.4};
            y = KP_GETCY(KP_Y_VAL,KP_HEIGHT_VAL,1,16);
        };

        class KPLIB_GarrisonInfantryLabel: KPGUI_PRE_Text {
            idc = 758044;
            text = "$STR_KPLIB_DIALOG_GARRISON_INFLABEL";
            x = KP_GETCX(KP_X_VAL,KP_WIDTH_VAL,1,4);
            y = KP_GETCY(KP_Y_VAL,KP_HEIGHT_VAL,2,16);
            w = KP_GETW(KP_WIDTH_VAL,(16/3));
            h = KP_GETH(KP_HEIGHT_VAL,16);
        };

        class KPLIB_GarrisonInfantryAmount: KPLIB_GarrisonInfantryLabel {
            idc = 758045;
            text = "";
            style = 1;
            x = KP_GETCX(KP_X_VAL,KP_WIDTH_VAL,7,16);
            w = KP_GETW(KP_WIDTH_VAL,16);
        };

        class KPLIB_GarrisonLightLabel: KPLIB_GarrisonInfantryLabel {
            idc = 758046;
            text = "$STR_KPLIB_DIALOG_GARRISON_LIGHTLABEL";
            y = KP_GETCY(KP_Y_VAL,KP_HEIGHT_VAL,3,16);
        };

        class KPLIB_GarrisonLightAmount: KPLIB_GarrisonInfantryAmount {
            idc = 758047;
            text = "";
            y = KP_GETCY(KP_Y_VAL,KP_HEIGHT_VAL,3,16);
        };

        class KPLIB_GarrisonHeavyLabel: KPLIB_GarrisonInfantryLabel {
            idc = 758048;
            text = "$STR_KPLIB_DIALOG_GARRISON_HEAVYLABEL";
            y = KP_GETCY(KP_Y_VAL,KP_HEIGHT_VAL,4,16);
        };

        class KPLIB_GarrisonHeavyAmount: KPLIB_GarrisonInfantryAmount {
            idc = 758049;
            text = "";
            y = KP_GETCY(KP_Y_VAL,KP_HEIGHT_VAL,4,16);
        };

        class KPLIB_GarrisonMap: KPGUI_PRE_MapControl {
            idc = 7580410;
            x = KP_GETCX(KP_X_VAL,KP_WIDTH_VAL,1,4);
            y = KP_GETCY(KP_Y_VAL,KP_HEIGHT_VAL,1,2);
            w = KP_GETW(KP_WIDTH_VAL,2);
            h = KP_GETH(KP_HEIGHT_VAL,2);
        };

        class KPLIB_DialogCross: KPGUI_PRE_DialogCross {};
    };
};
