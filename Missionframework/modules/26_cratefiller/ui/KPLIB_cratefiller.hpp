/*
    KP Liberation cratefiller dialog

    File: KPLIB_cratefiller.hpp
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-04-05
    Last Update: 2019-04-30
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Opens the cratefiller dialog where you can load/unload several inventories with weapons and items.
*/


class KPLIB_cratefiller {
    idd = 758026;
    movingEnable = 0;

    class controlsBackground {

        class KPLIB_DialogTitle: KPGUI_PRE_DialogTitleS {
            text = "$STR_KPLIB_DIALOG_CRATEFILLER_TITLE";
        };

        class KPLIB_DialogArea: KPGUI_PRE_DialogBackgroundS {};

        // Crates

        class KPLIB_TransportTitle: KPGUI_PRE_InlineTitle {
            text = "$STR_KPLIB_DIALOG_CRATEFILLER_TITLETRANSPORT";
            x = KP_GETCX(KP_X_VAL_S,KP_WIDTH_VAL_S,1,2);
            y = KP_GETCY(KP_Y_VAL_S,KP_HEIGHT_VAL_S,0,48);
            w = KP_GETW(KP_WIDTH_VAL_S,2);
            h = KP_GETH(KP_HEIGHT_VAL_S,16);
        };

        // Equipment

        class KPLIB_EquipmentTitle: KPLIB_TransportTitle {
            text = "$STR_KPLIB_DIALOG_CRATEFILLER_TITLEEQUIPMENT";
            x = KP_GETCX(KP_X_VAL_S,KP_WIDTH_VAL_S,0,2);
            y = KP_GETCY(KP_Y_VAL_S,KP_HEIGHT_VAL_S,0,48);
        };

        // Inventory

        class KPLIB_InventoryTitle: KPLIB_TransportTitle {
            text = "$STR_KPLIB_DIALOG_CRATEFILLER_TITLEINVENTORY";
            y = KP_GETCY(KP_Y_VAL_S,KP_HEIGHT_VAL_S,5,48);
        };

        // Tools controlsGroup

        class KPLIB_GroupTools: KPGUI_PRE_ControlsGroupNoScrollbars {
            idc = 687410;
            x = safezoneX;
            y = safezoneY;
            w = safezoneW;
            h = safezoneH;

            class controls {

                class KPLIB_DialogTitleTools: KPGUI_PRE_DialogTitleSR {
                    text = "$STR_KPLIB_DIALOG_CRATEFILLER_TITLETOOLS";
                    x = KP_GETX(KP_X_VAL_SR,KP_WIDTH_VAL_SR,0,1) - safezoneX;
                    y = safeZoneY + safeZoneH * KP_Y_VAL_SR - safezoneY;
                };

                class KPLIB_DialogAreaTools: KPGUI_PRE_DialogBackgroundSR {
                    x = KP_GETX(KP_X_VAL_SR,KP_WIDTH_VAL_SR,0,1) - safezoneX;
                    y = KP_GETY_AREA(KP_Y_VAL_SR) - safezoneY;
                };

                class KPLIB_ComboGroups: KPGUI_PRE_Combo {
                    idc = 687411;
                    x = KP_GETCX(KP_X_VAL_SR,KP_WIDTH_VAL_SR,0,1) - safezoneX;
                    y = KP_GETCY(KP_Y_VAL_SR,KP_HEIGHT_VAL_SR,0,48) - safezoneY;
                    w = KP_GETW(KP_WIDTH_VAL_SR,1);
                    h = KP_GETH(KP_HEIGHT_VAL_SR,24);
                    tooltip = "$STR_KPLIB_DIALOG_CRATEFILLER_GROUPS_TT";
                    onLBSelChanged = "[] call KPLIB_fnc_cratefiller_getPlayers";
                };

                class KPLIB_ComboPlayers: KPLIB_ComboGroups {
                    idc = 687412;
                    y = KP_GETCY(KP_Y_VAL_SR,KP_HEIGHT_VAL_SR,2,48) - safezoneY;
                    tooltip = "$STR_KPLIB_DIALOG_CRATEFILLER_PLAYERS_TT";
                    onLBSelChanged = "[] call KPLIB_fnc_cratefiller_getPlayerInventory";
                };

                class KPLIB_MainWeapon: KPGUI_PRE_PictureRatio {
                    idc = 687413;
                    text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\PrimaryWeapon_ca.paa";
                    x = KP_GETCX(KP_X_VAL_SR,KP_WIDTH_VAL_SR,0,1) - safezoneX;
                    y = KP_GETCY(KP_Y_VAL_SR,KP_HEIGHT_VAL_SR,6,48) - safezoneY;
                    w = KP_GETW(KP_WIDTH_VAL_SR,1);
                    h = KP_GETH(KP_HEIGHT_VAL_SR,4);
                };

                class KPLIB_HandWeapon: KPLIB_MainWeapon {
                    idc = 687414;
                    text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Handgun_ca.paa";
                    y = KP_GETCY(KP_Y_VAL_SR,KP_HEIGHT_VAL_SR,21,48) - safezoneY;
                };

                class KPLIB_SecondaryWeapon: KPLIB_MainWeapon {
                    idc = 687415;
                    text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\SecondaryWeapon_ca.paa";
                    y = KP_GETCY(KP_Y_VAL_SR,KP_HEIGHT_VAL_SR,36,48) - safezoneY;
                };

            };

        };

        // Tools controlsGroup end

    };

    class controls {



        class KPLIB_ToolsButton: KPGUI_PRE_DialogCrossS {
            idc = 687416;
            text = "KPGUI\res\icon_tools.paa";
            x = safeZoneX + safeZoneW * (KP_X_VAL_S + KP_WIDTH_VAL_S - 0.04);
            tooltip = "$STR_KPLIB_DIALOG_CRATEFILLER_TOOLS_TT";
            action = "[] call KPLIB_fnc_cratefiller_openTools";
        };

        // Crates

        class KPLIB_ComboCargo: KPGUI_PRE_Combo {
            idc = 68740;
            x = KP_GETCX(KP_X_VAL_S,KP_WIDTH_VAL_S,1,2);
            y = KP_GETCY(KP_Y_VAL_S,KP_HEIGHT_VAL_S,3,48);
            w = KP_GETW(KP_WIDTH_VAL_S,(24/11));
            h = KP_GETH(KP_HEIGHT_VAL_S,24);
            tooltip = "$STR_KPLIB_DIALOG_CRATEFILLER_INVENTORY_TT";
            onLBSelChanged = "[] call KPLIB_fnc_cratefiller_showInventory";
        };

        class KPLIB_RefreshCargo: KPGUI_PRE_CloseCross {
            text = "KPGUI\res\icon_refresh.paa";
            x = KP_GETCX(KP_X_VAL_S,KP_WIDTH_VAL_S,23,24);
            y = KP_GETCY(KP_Y_VAL_S,KP_HEIGHT_VAL_S,3,48);
            w = KP_GETW(KP_WIDTH_VAL_S,24);
            h = KP_GETH(KP_HEIGHT_VAL_S,24);
            tooltip = "$STR_KPLIB_DIALOG_CRATEFILLER_REFRESH_TT";
            action = "[] call KPLIB_fnc_cratefiller_getNearStorages";
        };

        // Equipment

        class KPLIB_ComboEquipment: KPGUI_PRE_Combo {
            idc = 68741;
            x = KP_GETCX(KP_X_VAL_S,KP_WIDTH_VAL_S,0,1);
            y = KP_GETCY(KP_Y_VAL_S,KP_HEIGHT_VAL_S,3,48);
            w = KP_GETW(KP_WIDTH_VAL_S,2);
            h = KP_GETH(KP_HEIGHT_VAL_S,24);
            tooltip = "$STR_KPLIB_DIALOG_CRATEFILLER_CATEGORY_TT";
            onLBSelChanged = "[] call KPLIB_fnc_cratefiller_createEquipmentList";
        };

        class KPLIB_ComboWeapons: KPLIB_ComboEquipment {
            idc = 68742;
            y = KP_GETCY(KP_Y_VAL_S,KP_HEIGHT_VAL_S,5,48);
            w = KP_GETW(KP_WIDTH_VAL_S,3);
            tooltip = "$STR_KPLIB_DIALOG_CRATEFILLER_WEAPONSELECTION_TT";
            onLBSelChanged = "[] call KPLIB_fnc_cratefiller_createSubList";
        };

        class KPLIB_SearchBar: KPGUI_PRE_EditBox {
            idc = 68743;
            x = KP_GETCX(KP_X_VAL_S,KP_WIDTH_VAL_S,1,3);
            y = KP_GETCY(KP_Y_VAL_S,KP_HEIGHT_VAL_S,5,48);
            w = KP_GETW(KP_WIDTH_VAL_S,6);
            h = KP_GETH(KP_HEIGHT_VAL_S,24);
            tooltip = "$STR_KPLIB_DIALOG_CRATEFILLER_SEARCH_TT";
            onKeyUp = "[] call KPLIB_fnc_cratefiller_search";
        };

        class KPLIB_EquipmentList: KPGUI_PRE_ListBox {
            idc = 68745;
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
            onButtonClick = "[1] call KPLIB_fnc_cratefiller_addEquipment";
        };

        class KPLIB_ButtonAddEquipment5: KPLIB_ButtonAddEquipment {
            text = "+ 5";
            y = KP_GETCY(KP_Y_VAL_S,KP_HEIGHT_VAL_S,35,96);
            onButtonClick = "[5] call KPLIB_fnc_cratefiller_addEquipment";
        };

        class KPLIB_ButtonAddEquipment10: KPLIB_ButtonAddEquipment {
            text = "+ 10";
            y = KP_GETCY(KP_Y_VAL_S,KP_HEIGHT_VAL_S,54,96);
            onButtonClick = "[10] call KPLIB_fnc_cratefiller_addEquipment";
        };

        class KPLIB_ButtonAddEquipment20: KPLIB_ButtonAddEquipment {
            text = "+ 20";
            y = KP_GETCY(KP_Y_VAL_S,KP_HEIGHT_VAL_S,73,96);
            onButtonClick = "[20] call KPLIB_fnc_cratefiller_addEquipment";
        };

        // Inventory

        class KPLIB_ExportName: KPLIB_SearchBar {
            idc = 68746;
            x = KP_GETCX(KP_X_VAL_S,KP_WIDTH_VAL_S,2,4);
            y = KP_GETCY(KP_Y_VAL_S,KP_HEIGHT_VAL_S,8,48);
            w = KP_GETW(KP_WIDTH_VAL_S,4);
            tooltip = "$STR_KPLIB_DIALOG_CRATEFILLER_EXPORT_TT";
        };

        class KPLIB_ImportName: KPGUI_PRE_Combo {
            idc = 68747;
            x = KP_GETCX(KP_X_VAL_S,KP_WIDTH_VAL_S,3,4);
            y = KP_GETCY(KP_Y_VAL_S,KP_HEIGHT_VAL_S,8,48);
            w = KP_GETW(KP_WIDTH_VAL_S,4);
            h = KP_GETH(KP_HEIGHT_VAL_S,24);
            tooltip = "$STR_KPLIB_DIALOG_CRATEFILLER_IMPORT_TT";
        };

        class KPLIB_ButtonExport: KPGUI_PRE_InlineButton {
            text = "Export";
            x = KP_GETCX(KP_X_VAL_S,KP_WIDTH_VAL_S,2,4);
            y = KP_GETCY(KP_Y_VAL_S,KP_HEIGHT_VAL_S,10,48);
            w = KP_GETW(KP_WIDTH_VAL_S,4);
            h = KP_GETH(KP_HEIGHT_VAL_S,24);
            onButtonClick = "[] call KPLIB_fnc_cratefiller_export";
        };

        class KPLIB_ButtonImport: KPLIB_ButtonExport {
            text = "Import";
            x = KP_GETCX(KP_X_VAL_S,KP_WIDTH_VAL_S,3,4);
            w = KP_GETW(KP_WIDTH_VAL_S,(24/5));
            onButtonClick = "[] call KPLIB_fnc_cratefiller_import";
        };

        class KPLIB_DeletePreset: KPGUI_PRE_CloseCross {
            text = "KPGUI\res\icon_recyclebin.paa";
            x = KP_GETCX(KP_X_VAL_S,KP_WIDTH_VAL_S,23,24);
            y = KP_GETCY(KP_Y_VAL_S,KP_HEIGHT_VAL_S,10,48);
            w = KP_GETW(KP_WIDTH_VAL_S,24);
            h = KP_GETH(KP_HEIGHT_VAL_S,24);
            tooltip = "$STR_KPLIB_DIALOG_CRATEFILLER_DELETE_TT";
            action = "[] call KPLIB_fnc_cratefiller_deletePreset";
        };

        class KPLIB_InventoryList: KPGUI_PRE_ListBox {
            idc = 68748;
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
            onButtonClick = "[1] call KPLIB_fnc_cratefiller_removeEquipment";
        };

        class KPLIB_ButtonRemoveEquipment5: KPLIB_ButtonRemoveEquipment {
            text = "- 5";
            y = KP_GETCY(KP_Y_VAL_S,KP_HEIGHT_VAL_S,41,96);
            onButtonClick = "[5] call KPLIB_fnc_cratefiller_removeEquipment";
        };

        class KPLIB_ButtonRemoveEquipment10: KPLIB_ButtonRemoveEquipment {
            text = "- 10";
            y = KP_GETCY(KP_Y_VAL_S,KP_HEIGHT_VAL_S,58,96);
            onButtonClick = "[10] call KPLIB_fnc_cratefiller_removeEquipment";
        };

        class KPLIB_ButtonRemoveEquipmentClear: KPLIB_ButtonRemoveEquipment {
            text = "Clear";
            y = KP_GETCY(KP_Y_VAL_S,KP_HEIGHT_VAL_S,75,96);
            onButtonClick = "[0] call KPLIB_fnc_cratefiller_removeEquipment";
        };

        class KPLIB_ProgressBar : KPGUI_PRE_ProgressBar {
            idc = 68749;
            x = KP_GETCX(KP_X_VAL_S,KP_WIDTH_VAL_S,0,1);
            y = KP_GETCY(KP_Y_VAL_S,KP_HEIGHT_VAL_S,46,48);
            w = KP_GETW(KP_WIDTH_VAL_S,1);
            h = KP_GETH(KP_HEIGHT_VAL_S,24);
            tooltip = "$STR_KPLIB_DIALOG_CRATEFILLER_FILLLEVEL_TT"
        };

        class KPLIB_DialogCross: KPGUI_PRE_DialogCrossS {};

    };

};
