/*
    KP Liberation Garrison Dialog

    File: KPLIB_garrison.hpp
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-03-19
    Last Update: 2019-04-30
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Dialog for the commander to manage blufor sector garrisons.
*/

class KPLIB_garrison {
    idd = KPLIB_IDC_GARRISON_DIALOG;
    movingEnable = 0;
    onLoad = "KPLIB_garrison_dialogGroups = []; KPLIB_garrison_dialogSelGroup = grpNull; KPLIB_garrison_dialogSelUnit = objNull;";
    onUnload = "KPLIB_garrison_dialogGroups = nil; KPLIB_garrison_dialogSelGroup = nil; KPLIB_garrison_dialogSelUnit = nil; deleteMarkerLocal 'grpMarker'";

    class controlsBackground {

        class KPLIB_DialogArea: KPGUI_PRE_DialogBackground {};

        class KPLIB_GarrisonListTitle: KPGUI_PRE_InlineTitle {
            text = "$STR_KPLIB_DIALOG_GARRISON_LISTHEADER";
            x = KP_GETCX(KP_X_VAL,KP_WIDTH_VAL,0,1);
            y = KP_GETCY(KP_Y_VAL,KP_HEIGHT_VAL,0,16);
            w = KP_GETW(KP_WIDTH_VAL,4);
            h = KP_GETH(KP_HEIGHT_VAL,16);
        };
    };

    class controls {

        class KPLIB_DialogTitle: KPGUI_PRE_DialogTitle {
            text = "$STR_KPLIB_DIALOG_GARRISON_TITLE";
        };

        class KPLIB_GarrisonList: KPGUI_PRE_Listbox {
            idc = KPLIB_IDC_GARRISON_GARRISONLIST;
            onLBSelChanged = "[_this select 1] call KPLIB_fnc_garrison_dialogSelectSector";
            x = KP_GETCX(KP_X_VAL,KP_WIDTH_VAL,0,1);
            y = KP_GETCY(KP_Y_VAL,KP_HEIGHT_VAL,1,16);
            w = KP_GETW(KP_WIDTH_VAL,4);
            h = KP_GETH(KP_HEIGHT_VAL,(16/15));
        };

        class KPLIB_GarrisonSectorName: KPGUI_PRE_InlineTitle {
            idc = KPLIB_IDC_GARRISON_SECTORNAME;
            text = "$STR_KPLIB_DIALOG_GARRISON_NOSECTOR";
            x = KP_GETCX(KP_X_VAL,KP_WIDTH_VAL,1,4);
            y = KP_GETCY(KP_Y_VAL,KP_HEIGHT_VAL,0,16);
            w = KP_GETW(KP_WIDTH_VAL,2);
            h = KP_GETH(KP_HEIGHT_VAL,16);
        };

        class KPLIB_GarrisonAlertNote: KPLIB_GarrisonSectorName {
            idc = KPLIB_IDC_GARRISON_ALERTNOTE;
            text = "$STR_KPLIB_DIALOG_GARRISON_ALERTNOTE";
            colorBackground[] = {0.8, 0, 0, 0.4};
            y = KP_GETCY(KP_Y_VAL,KP_HEIGHT_VAL,1,16);
            show = 0;
        };

        class KPLIB_GarrisonInfantryLabel: KPGUI_PRE_Text {
            idc = KPLIB_IDC_GARRISON_INFANTRYLABEL;
            text = "$STR_KPLIB_DIALOG_GARRISON_INFLABEL";
            x = KP_GETCX(KP_X_VAL,KP_WIDTH_VAL,1,4);
            y = KP_GETCY(KP_Y_VAL,KP_HEIGHT_VAL,2,16);
            w = KP_GETW(KP_WIDTH_VAL,(16/3));
            h = KP_GETH(KP_HEIGHT_VAL,16);
            show = 0;
        };

        class KPLIB_GarrisonInfantryAmount: KPLIB_GarrisonInfantryLabel {
            idc = KPLIB_IDC_GARRISON_INFANTRYAMOUNT;
            text = "";
            style = 1;
            x = KP_GETCX(KP_X_VAL,KP_WIDTH_VAL,7,16);
            w = KP_GETW(KP_WIDTH_VAL,16);
            show = 0;
        };

        class KPLIB_GarrisonInfantryBox: KPGUI_PRE_EditBox {
            idc = KPLIB_IDC_GARRISON_INFANTRYBOX;
            text = "0";
            style = 1;
            x = KP_GETCX(KP_X_VAL,KP_WIDTH_VAL,1,2);
            y = KP_GETCY(KP_Y_VAL,KP_HEIGHT_VAL,2,16);
            w = KP_GETW(KP_WIDTH_VAL,(16/3));
            h = KP_GETH(KP_HEIGHT_VAL,16);
            show = 0;
        };

        class KPLIB_GarrisonInfantryButton: KPGUI_PRE_InlineButton {
            idc = KPLIB_IDC_GARRISON_INFANTRYBUTTON;
            text = ">>";
            tooltip = "$STR_KPLIB_DIALOG_GARRISON_REMOVE_TT";
            onButtonClick = "_this call KPLIB_fnc_garrison_dialogRemove";
            x = KP_GETCX(KP_X_VAL,KP_WIDTH_VAL,11,16);
            y = KP_GETCY(KP_Y_VAL,KP_HEIGHT_VAL,2,16);
            w = KP_GETW(KP_WIDTH_VAL,16);
            h = KP_GETH(KP_HEIGHT_VAL,16);
            show = 0;
        };

        class KPLIB_GarrisonLightLabel: KPLIB_GarrisonInfantryLabel {
            idc = KPLIB_IDC_GARRISON_LIGHTLABEL;
            text = "$STR_KPLIB_DIALOG_GARRISON_LIGHTLABEL";
            y = KP_GETCY(KP_Y_VAL,KP_HEIGHT_VAL,3,16);
        };

        class KPLIB_GarrisonLightAmount: KPLIB_GarrisonInfantryAmount {
            idc = KPLIB_IDC_GARRISON_LIGHTAMOUNT;
            text = "";
            y = KP_GETCY(KP_Y_VAL,KP_HEIGHT_VAL,3,16);
        };

        class KPLIB_GarrisonLightList: KPGUI_PRE_Combo {
            idc = KPLIB_IDC_GARRISON_LIGHTLIST;
            x = KP_GETCX(KP_X_VAL,KP_WIDTH_VAL,1,2);
            y = KP_GETCY(KP_Y_VAL,KP_HEIGHT_VAL,3,16);
            w = KP_GETW(KP_WIDTH_VAL,(16/3));
            h = KP_GETH(KP_HEIGHT_VAL,16);
        };

        class KPLIB_GarrisonLightButton: KPLIB_GarrisonInfantryButton {
            idc = KPLIB_IDC_GARRISON_LIGHTBUTTON;
            y = KP_GETCY(KP_Y_VAL,KP_HEIGHT_VAL,3,16);
        };

        class KPLIB_GarrisonHeavyLabel: KPLIB_GarrisonInfantryLabel {
            idc = KPLIB_IDC_GARRISON_HEAVYLABEL;
            text = "$STR_KPLIB_DIALOG_GARRISON_HEAVYLABEL";
            y = KP_GETCY(KP_Y_VAL,KP_HEIGHT_VAL,4,16);
        };

        class KPLIB_GarrisonHeavyAmount: KPLIB_GarrisonInfantryAmount {
            idc = KPLIB_IDC_GARRISON_HEAVYAMOUNT;
            text = "";
            y = KP_GETCY(KP_Y_VAL,KP_HEIGHT_VAL,4,16);
        };

        class KPLIB_GarrisonHeavyList: KPLIB_GarrisonLightList {
            idc = KPLIB_IDC_GARRISON_HEAVYLIST;
            y = KP_GETCY(KP_Y_VAL,KP_HEIGHT_VAL,4,16);
        };

        class KPLIB_GarrisonHeavyButton: KPLIB_GarrisonInfantryButton {
            idc = KPLIB_IDC_GARRISON_HEAVYBUTTON;
            y = KP_GETCY(KP_Y_VAL,KP_HEIGHT_VAL,4,16);
        };

        class KPLIB_GarrisonMap: KPGUI_PRE_MapControl {
            idc = KPLIB_IDC_GARRISON_MAP;
            x = KP_GETCX(KP_X_VAL,KP_WIDTH_VAL,1,4);
            y = KP_GETCY(KP_Y_VAL,KP_HEIGHT_VAL,5,16);
            w = KP_GETW(KP_WIDTH_VAL,2);
            h = KP_GETH(KP_HEIGHT_VAL,(16/11));
            show = 0;
        };

        class KPLIB_GarrisonReinforceTitle: KPGUI_PRE_InlineTitle {
            idc = KPLIB_IDC_GARRISON_REINFORCETITLE;
            text = "$STR_KPLIB_DIALOG_GARRISON_REINFORCEHEADER";
            x = KP_GETCX(KP_X_VAL,KP_WIDTH_VAL,3,4);
            y = KP_GETCY(KP_Y_VAL,KP_HEIGHT_VAL,0,16);
            w = KP_GETW(KP_WIDTH_VAL,4);
            h = KP_GETH(KP_HEIGHT_VAL,16);
            show = 0;
        };

        class KPLIB_GarrisonGroupsLabel: KPGUI_PRE_Text {
            idc = KPLIB_IDC_GARRISON_GROUPSLABEL;
            text = "$STR_KPLIB_DIALOG_GARRISON_GROUPSLABEL";
            x = KP_GETCX(KP_X_VAL,KP_WIDTH_VAL,3,4);
            y = KP_GETCY(KP_Y_VAL,KP_HEIGHT_VAL,1,16);
            w = KP_GETW(KP_WIDTH_VAL,4);
            h = KP_GETH(KP_HEIGHT_VAL,16);
            show = 0;
        };

        class KPLIB_GarrisonGroupList: KPGUI_PRE_Listbox {
            idc = KPLIB_IDC_GARRISON_GROUPLIST;
            onLBSelChanged = "[_this select 1] call KPLIB_fnc_garrison_dialogSelectGroup";
            x = KP_GETCX(KP_X_VAL,KP_WIDTH_VAL,3,4);
            y = KP_GETCY(KP_Y_VAL,KP_HEIGHT_VAL,2,16);
            w = KP_GETW(KP_WIDTH_VAL,4);
            h = KP_GETH(KP_HEIGHT_VAL,(16/5));
            show = 0;
        };

        class KPLIB_GarrisonGroupButton: KPGUI_PRE_InlineButton {
            idc = KPLIB_IDC_GARRISON_GROUPBUTTON;
            text = "$STR_KPLIB_DIALOG_GARRISON_GROUPBUTTON";
            tooltip = "$STR_KPLIB_DIALOG_GARRISON_GROUPBUTTON_TT";
            onButtonClick = "_this call KPLIB_fnc_garrison_dialogAdd";
            x = KP_GETCX(KP_X_VAL,KP_WIDTH_VAL,3,4);
            y = KP_GETCY(KP_Y_VAL,KP_HEIGHT_VAL,7,16);
            w = KP_GETW(KP_WIDTH_VAL,4);
            h = KP_GETH(KP_HEIGHT_VAL,16);
            show = 0;
        };

        class KPLIB_GarrisonUnitsLabel: KPGUI_PRE_Text {
            idc = KPLIB_IDC_GARRISON_UNITSLABEL;
            text = "$STR_KPLIB_DIALOG_GARRISON_UNITSLABEL";
            x = KP_GETCX(KP_X_VAL,KP_WIDTH_VAL,3,4);
            y = KP_GETCY(KP_Y_VAL,KP_HEIGHT_VAL,1,2);
            w = KP_GETW(KP_WIDTH_VAL,4);
            h = KP_GETH(KP_HEIGHT_VAL,16);
            show = 0;
        };

        class KPLIB_GarrisonUnitList: KPGUI_PRE_Listbox {
            idc = KPLIB_IDC_GARRISON_UNITLIST;
            onLBSelChanged = "[_this select 1] call KPLIB_fnc_garrison_dialogSelectUnit";
            x = KP_GETCX(KP_X_VAL,KP_WIDTH_VAL,3,4);
            y = KP_GETCY(KP_Y_VAL,KP_HEIGHT_VAL,9,16);
            w = KP_GETW(KP_WIDTH_VAL,4);
            h = KP_GETH(KP_HEIGHT_VAL,(16/6));
            show = 0;
        };

        class KPLIB_GarrisonUnitButton: KPLIB_GarrisonGroupButton {
            idc = KPLIB_IDC_GARRISON_UNITBUTTON;
            text = "$STR_KPLIB_DIALOG_GARRISON_UNITBUTTON";
            tooltip = "$STR_KPLIB_DIALOG_GARRISON_UNITBUTTON_TT";
            y = KP_GETCY(KP_Y_VAL,KP_HEIGHT_VAL,15,16);
        };

        class KPLIB_DialogCross: KPGUI_PRE_DialogCross {};
    };
};
