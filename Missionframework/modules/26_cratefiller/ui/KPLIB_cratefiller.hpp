/*
    KP Liberation cratefiller dialog

    File: KPLIB_cratefiller.hpp
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-04-05
    Last Update: 2019-04-05
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Just a placeholder file for the example module.
*/


class KPLIB_cratefiller {
    idd = 758026;
    movingEnable = 0;

    class controlsBackground {

        class KPLIB_DialogTitle: KPGUI_PRE_DialogTitleS {
            text = "KPLIB Cratefiller";
        };

        class KPLIB_DialogArea: KPGUI_PRE_DialogBackgroundS {};

        // Crates

        class KPLIB_TransportTitle: KPGUI_PRE_InlineTitle {
            text = "Transport Medium";
            x = KP_GETCX(KP_X_VAL_S,KP_WIDTH_VAL_S,1,2);
            y = KP_GETCY(KP_Y_VAL_S,KP_HEIGHT_VAL_S,0,48);
            w = KP_GETW(KP_WIDTH_VAL_S,2);
            h = KP_GETH(KP_HEIGHT_VAL_S,16);
        };

        // Equipment

        class KP_EquipmentTitle: KPLIB_TransportTitle {
            text = "Equipment";
            x = KP_GETCX(KP_X_VAL_S,KP_WIDTH_VAL_S,0,2);
            y = KP_GETCY(KP_Y_VAL_S,KP_HEIGHT_VAL_S,0,48);
        };

        // Inventory

        class KP_InventoryTitle: KPLIB_TransportTitle {
            text = "Inventory";
            y = KP_GETCY(KP_Y_VAL_S,KP_HEIGHT_VAL_S,5,48);
        };

    };

    class controls {

        // Crates

        class KPLIB_ComboCargo: KPGUI_PRE_Combo {
            idc = 75802;
            x = KP_GETCX(KP_X_VAL_S,KP_WIDTH_VAL_S,1,2);
            y = KP_GETCY(KP_Y_VAL_S,KP_HEIGHT_VAL_S,3,48);
            w = KP_GETW(KP_WIDTH_VAL_S,2);
            h = KP_GETH(KP_HEIGHT_VAL_S,24);
            //tooltip = "$STR_KPCF_TOOLTIPINVENTORY";
            //onLBSelChanged = "[] call KPCF_fnc_setActiveStorage";
        };

        class KPLIB_RefreshCargo: KPGUI_PRE_CloseCross {
            text = "KPGUI\res\icon_refresh.paa";
            x = KP_GETCX(KP_X_VAL_S,KP_WIDTH_VAL_S,23,24);
            y = KP_GETCY(KP_Y_VAL_S,KP_HEIGHT_VAL_S,3,48);
            w = KP_GETW(KP_WIDTH_VAL_S,24);
            h = KP_GETH(KP_HEIGHT_VAL_S,24);
            //tooltip = "$STR_KPCF_TOOLTIPREFRESH";
            //action = "[] call KPCF_fnc_getNearStorages";
        };

        // Equipment

        class KPLIB_ComboEquipment: KPGUI_PRE_Combo {
            idc = 75810;
            x = KP_GETCX(KP_X_VAL_S,KP_WIDTH_VAL_S,0,1);
            y = KP_GETCY(KP_Y_VAL_S,KP_HEIGHT_VAL_S,3,48);
            w = KP_GETW(KP_WIDTH_VAL_S,2);
            h = KP_GETH(KP_HEIGHT_VAL_S,24);
            //tooltip = "$STR_KPCF_TOOLTIPCATEGORY";
            //onLBSelChanged = "[] call KPCF_fnc_createEquipmentList";
        };

        class KPLIB_ComboWeapons: KPLIB_ComboEquipment {
            idc = 75811;
            y = KP_GETCY(KP_Y_VAL_S,KP_HEIGHT_VAL_S,5,48);
            //tooltip = "$STR_KPCF_TOOLTIPWEAPONSELECTION";
            //onLBSelChanged = "[] call KPCF_fnc_createSubList";
        };

        class KPLIB_EquipmentList: KPGUI_PRE_ListBox {
            idc = 75812;
            x = KP_GETCX(KP_X_VAL_S,KP_WIDTH_VAL_S,0,1);
            y = KP_GETCY(KP_Y_VAL_S,KP_HEIGHT_VAL_S,8,48);
            w = KP_GETW(KP_WIDTH_VAL_S,(16/7));
            h = KP_GETH(KP_HEIGHT_VAL_S,(48/38));
        };

        class KPLIB_ButtonAddEquipment: KPGUI_PRE_InlineButton {
            text = "+ 1";
            x = KP_GETCX(KP_X_VAL_S,KP_WIDTH_VAL_S,7,16);
            y = KP_GETCY(KP_Y_VAL_S,KP_HEIGHT_VAL_S,16,96);
            w = KP_GETW(KP_WIDTH_VAL_S,16);
            h = KP_GETH(KP_HEIGHT_VAL_S,(96/19));
            //onButtonClick = "[1] call KPCF_fnc_addEquipment";
        };

        class KPLIB_ButtonAddEquipment5: KPLIB_ButtonAddEquipment {
            text = "+ 5";
            y = KP_GETCY(KP_Y_VAL_S,KP_HEIGHT_VAL_S,35,96);
            //onButtonClick = "[5] call KPCF_fnc_addEquipment";
        };

        class KPLIB_ButtonAddEquipment10: KPLIB_ButtonAddEquipment {
            text = "+ 10";
            y = KP_GETCY(KP_Y_VAL_S,KP_HEIGHT_VAL_S,54,96);
            //onButtonClick = "[10] call KPCF_fnc_addEquipment";
        };

        class KPLIB_ButtonAddEquipment20: KPLIB_ButtonAddEquipment {
            text = "+ 20";
            y = KP_GETCY(KP_Y_VAL_S,KP_HEIGHT_VAL_S,73,96);
            //onButtonClick = "[20] call KPCF_fnc_addEquipment";
        };

        // Inventory

        class KPLIB_ExportName: KPGUI_PRE_EditBox {
            idc = 75820;
            x = KP_GETCX(KP_X_VAL_S,KP_WIDTH_VAL_S,2,4);
            y = KP_GETCY(KP_Y_VAL_S,KP_HEIGHT_VAL_S,8,48);
            w = KP_GETW(KP_WIDTH_VAL_S,4);
            h = KP_GETH(KP_HEIGHT_VAL_S,24);
            //tooltip = "$STR_KPCF_TOOLTIPEXPORT";
        };

        class KPLIB_ImportName: KPGUI_PRE_Combo {
            idc = 75821;
            x = KP_GETCX(KP_X_VAL_S,KP_WIDTH_VAL_S,3,4);
            y = KP_GETCY(KP_Y_VAL_S,KP_HEIGHT_VAL_S,8,48);
            w = KP_GETW(KP_WIDTH_VAL_S,4);
            h = KP_GETH(KP_HEIGHT_VAL_S,24);
            //tooltip = "$STR_KPCF_TOOLTIPIMPORT";
        };

        class KPLIB_ButtonExport: KPGUI_PRE_InlineButton {
            text = "Export";
            x = KP_GETCX(KP_X_VAL_S,KP_WIDTH_VAL_S,2,4);
            y = KP_GETCY(KP_Y_VAL_S,KP_HEIGHT_VAL_S,10,48);
            w = KP_GETW(KP_WIDTH_VAL_S,4);
            h = KP_GETH(KP_HEIGHT_VAL_S,24);
            //onButtonClick = "[] call KPCF_fnc_export";
        };

        class KPLIB_ButtonImport: KPLIB_ButtonExport {
            text = "Import";
            x = KP_GETCX(KP_X_VAL_S,KP_WIDTH_VAL_S,3,4);
            w = KP_GETW(KP_WIDTH_VAL_S,(24/5));
            //onButtonClick = "[] call KPCF_fnc_import";
        };

        class KPLIB_DeletePreset: KPGUI_PRE_CloseCross {
            text = "KPGUI\res\icon_recyclebin.paa";
            x = KP_GETCX(KP_X_VAL_S,KP_WIDTH_VAL_S,23,24);
            y = KP_GETCY(KP_Y_VAL_S,KP_HEIGHT_VAL_S,10,48);
            w = KP_GETW(KP_WIDTH_VAL_S,24);
            h = KP_GETH(KP_HEIGHT_VAL_S,24);
            //tooltip = "$STR_KPCF_TOOLTIPDELETE";
            //action = "[] call KPCF_fnc_deletePreset";
        };

        class KPLIB_InventoryList: KPGUI_PRE_ListBox {
            idc = 75822;
            x = KP_GETCX(KP_X_VAL_S,KP_WIDTH_VAL_S,8,16);
            y = KP_GETCY(KP_Y_VAL_S,KP_HEIGHT_VAL_S,12,48);
            w = KP_GETW(KP_WIDTH_VAL_S,(16/7));
            h = KP_GETH(KP_HEIGHT_VAL_S,(48/34));
        };

        class KPLIB_ButtonRemoveEquipment: KPGUI_PRE_InlineButton {
            text = "- 1";
            x = KP_GETCX(KP_X_VAL_S,KP_WIDTH_VAL_S,15,16);
            y = KP_GETCY(KP_Y_VAL_S,KP_HEIGHT_VAL_S,24,96);
            w = KP_GETW(KP_WIDTH_VAL_S,16);
            h = KP_GETH(KP_HEIGHT_VAL_S,(96/17));
            //onButtonClick = "[1] call KPCF_fnc_removeEquipment";
        };

        class KPLIB_ButtonRemoveEquipment5: KPLIB_ButtonRemoveEquipment {
            text = "- 5";
            y = KP_GETCY(KP_Y_VAL_S,KP_HEIGHT_VAL_S,41,96);
            //onButtonClick = "[5] call KPCF_fnc_removeEquipment";
        };

        class KPLIB_ButtonRemoveEquipment10: KPLIB_ButtonRemoveEquipment {
            text = "- 10";
            y = KP_GETCY(KP_Y_VAL_S,KP_HEIGHT_VAL_S,58,96);
            //onButtonClick = "[10] call KPCF_fnc_removeEquipment";
        };

        class KPLIB_ButtonRemoveEquipmentClear: KPLIB_ButtonRemoveEquipment {
            text = "Clear";
            y = KP_GETCY(KP_Y_VAL_S,KP_HEIGHT_VAL_S,75,96);
            //onButtonClick = "[0] call KPCF_fnc_removeEquipment";
        };

        class KPLIB_ProgressBar : KPGUI_PRE_ProgressBar {
            idc = 75823;
            x = KP_GETCX(KP_X_VAL_S,KP_WIDTH_VAL_S,0,1);
            y = KP_GETCY(KP_Y_VAL_S,KP_HEIGHT_VAL_S,46,48);
            w = KP_GETW(KP_WIDTH_VAL_S,1);
            h = KP_GETH(KP_HEIGHT_VAL_S,24);
            //tooltip = "$STR_KPCF_TOOLTIPFILLLEVEL"
        };

        class KP_DialogCross: KPGUI_PRE_DialogCrossS {};

    };

};
