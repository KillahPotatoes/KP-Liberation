/*
    KP Liberation cratefiller dialog

    File: KPLIB_cratefiller.hpp
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-04-05
    Last Update: 2019-06-19
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Opens the cratefiller dialog where you can load/unload several inventories with weapons and items.
*/


class KPLIB_cratefiller {
    idd = KPLIB_IDC_CRATEFILLER_DIALOG;
    movingEnable = 0;

    class controlsBackground {

        class KPLIB_DialogTitle: KPGUI_PRE_DialogTitleS {
            text = "$STR_KPLIB_DIALOG_CRATEFILLER_TITLE";
        };

        class KPLIB_DialogArea: KPGUI_PRE_DialogBackgroundS {};

        // Tools controlsGroup

        class KPLIB_GroupTools: KPGUI_PRE_ControlsGroupNoScrollbars {
            idc = KPLIB_IDC_CRATEFILLER_GROUPOVERVIEW;
            x = safezoneX;
            y = safezoneY;
            w = safezoneW;
            h = safezoneH;

            class controls {

                class KPLIB_DialogTitleTools: KPGUI_PRE_DialogTitleSR {
                    text = "$STR_KPLIB_DIALOG_CRATEFILLER_TITLEOVERVIEW";
                    x = KP_GETX(KP_X_VAL_SR,KP_WIDTH_VAL_SR,0,1) - safezoneX;
                    y = safeZoneY + safeZoneH * KP_Y_VAL_SR - safezoneY;
                };

                class KPLIB_DialogAreaTools: KPGUI_PRE_DialogBackgroundSR {
                    x = KP_GETX(KP_X_VAL_SR,KP_WIDTH_VAL_SR,0,1) - safezoneX;
                    y = KP_GETY_AREA(KP_Y_VAL_SR) - safezoneY;
                };

                class KPLIB_ComboGroups: KPGUI_PRE_Combo {
                    idc = KPLIB_IDC_CRATEFILLER_COMBOGROUPS;
                    x = KP_GETCX(KP_X_VAL_SR,KP_WIDTH_VAL_SR,0,1) - safezoneX;
                    y = KP_GETCY(KP_Y_VAL_SR,KP_HEIGHT_VAL_SR,0,48) - safezoneY;
                    w = KP_GETW(KP_WIDTH_VAL_SR,1);
                    h = KP_GETH(KP_HEIGHT_VAL_SR,24);
                    tooltip = "$STR_KPLIB_DIALOG_CRATEFILLER_GROUPS_TT";
                    onLBSelChanged = "[] call KPLIB_fnc_cratefiller_getPlayers";
                };

                class KPLIB_ComboPlayers: KPLIB_ComboGroups {
                    idc = KPLIB_IDC_CRATEFILLER_COMBOPLAYERS;
                    y = KP_GETCY(KP_Y_VAL_SR,KP_HEIGHT_VAL_SR,2,48) - safezoneY;
                    tooltip = "$STR_KPLIB_DIALOG_CRATEFILLER_PLAYERS_TT";
                    onLBSelChanged = "[] call KPLIB_fnc_cratefiller_getPlayerInventory";
                };

                class KPLIB_MainWeapon: KPGUI_PRE_PictureRatio {
                    idc = KPLIB_IDC_CRATEFILLER_MAINWEAPON;
                    text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\PrimaryWeapon_ca.paa";
                    x = KP_GETCX(KP_X_VAL_SR,KP_WIDTH_VAL_SR,0,1) - safezoneX;
                    y = KP_GETCY(KP_Y_VAL_SR,KP_HEIGHT_VAL_SR,6,48) - safezoneY;
                    w = KP_GETW(KP_WIDTH_VAL_SR,1);
                    h = KP_GETH(KP_HEIGHT_VAL_SR,4);
                };

                class KPLIB_Handgun: KPLIB_MainWeapon {
                    idc = KPLIB_IDC_CRATEFILLER_HANDGUN;
                    text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Handgun_ca.paa";
                    y = KP_GETCY(KP_Y_VAL_SR,KP_HEIGHT_VAL_SR,21,48) - safezoneY;
                };

                class KPLIB_SecondaryWeapon: KPLIB_MainWeapon {
                    idc = KPLIB_IDC_CRATEFILLER_SECONDARYWEAPONS;
                    text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\SecondaryWeapon_ca.paa";
                    y = KP_GETCY(KP_Y_VAL_SR,KP_HEIGHT_VAL_SR,36,48) - safezoneY;
                };

            };

        };

        // Tools controlsGroup end

    };

    class controls {

        class KPLIB_ButtonTools: KPGUI_PRE_DialogCrossS {
            idc = KPLIB_IDC_CRATEFILLER_BUTTONOVERVIEW;
            text = "KPGUI\res\icon_tools.paa";
            x = safeZoneX + safeZoneW * (KP_X_VAL_S + KP_WIDTH_VAL_S - 0.04);
            tooltip = "$STR_KPLIB_DIALOG_CRATEFILLER_OVERVIEW_TT";
            action = "[] call KPLIB_fnc_cratefiller_showOverview";
        };

        // Equipment

        class KPLIB_EquipmentTitle: KPGUI_PRE_InlineTitle {
            text = "$STR_KPLIB_DIALOG_CRATEFILLER_TITLEEQUIPMENT";
            x = KP_GETCX(KP_X_VAL_S,KP_WIDTH_VAL_S,0,2);
            y = KP_GETCY(KP_Y_VAL_S,KP_HEIGHT_VAL_S,0,48);
            w = KP_GETW(KP_WIDTH_VAL_S,2);
            h = KP_GETH(KP_HEIGHT_VAL_S,16);
        };

        class KPLIB_ComboEquipment: KPGUI_PRE_Combo {
            idc = KPLIB_IDC_CRATEFILLER_COMBOEQUIPMENT;
            x = KP_GETCX(KP_X_VAL_S,KP_WIDTH_VAL_S,0,1);
            y = KP_GETCY(KP_Y_VAL_S,KP_HEIGHT_VAL_S,3,48);
            w = KP_GETW(KP_WIDTH_VAL_S,2);
            h = KP_GETH(KP_HEIGHT_VAL_S,24);
            tooltip = "$STR_KPLIB_DIALOG_CRATEFILLER_CATEGORY_TT";
            onLBSelChanged = "[] call KPLIB_fnc_cratefiller_createEquipmentList";
        };

        class KPLIB_ComboWeapons: KPLIB_ComboEquipment {
            idc = KPLIB_IDC_CRATEFILLER_COMBOWEAPONS;
            y = KP_GETCY(KP_Y_VAL_S,KP_HEIGHT_VAL_S,5,48);
            w = KP_GETW(KP_WIDTH_VAL_S,3);
            tooltip = "$STR_KPLIB_DIALOG_CRATEFILLER_WEAPONSELECTION_TT";
            onLBSelChanged = "[] call KPLIB_fnc_cratefiller_createSubList";
        };

        class KPLIB_SearchBar: KPGUI_PRE_EditBox {
            idc = KPLIB_IDC_CRATEFILLER_SEARCHBAR;
            x = KP_GETCX(KP_X_VAL_S,KP_WIDTH_VAL_S,1,3);
            y = KP_GETCY(KP_Y_VAL_S,KP_HEIGHT_VAL_S,5,48);
            w = KP_GETW(KP_WIDTH_VAL_S,6);
            h = KP_GETH(KP_HEIGHT_VAL_S,24);
            tooltip = "$STR_KPLIB_DIALOG_CRATEFILLER_SEARCH_TT";
            onKeyUp = "[] call KPLIB_fnc_cratefiller_search";
        };

        class KPLIB_LeftEquipmentListButton: KPGUI_PRE_BUTTON {
            idc = KPLIB_IDC_CRATEFILLER_LEFTEQUIPMENTBUTTON;
            text = "-";
            onButtonClick = "[687413] call KPLIB_fnc_cratefiller_removeEquipment";
        };

        class KPLIB_RightEquipmentListButton: KPGUI_PRE_BUTTON {
            idc = KPLIB_IDC_CRATEFILLER_RIGHTEQUIPMENTBUTTON;
            text = "+";
            onButtonClick = "[687413] call KPLIB_fnc_cratefiller_addEquipment";
        };

        class KPLIB_EquipmentList: KPGUI_PRE_ListNBox {
            idc = KPLIB_IDC_CRATEFILLER_EQUIPMENTLIST;
            x = KP_GETCX(KP_X_VAL_S,KP_WIDTH_VAL_S,0,1);
            y = KP_GETCY(KP_Y_VAL_S,KP_HEIGHT_VAL_S,8,48);
            w = KP_GETW(KP_WIDTH_VAL_S,2);
            h = KP_GETH(KP_HEIGHT_VAL_S,(48/38));

            columns[] = {0.05, 0.2};

            idcLeft = KPLIB_IDC_CRATEFILLER_LEFTEQUIPMENTBUTTON;
            idcRight = KPLIB_IDC_CRATEFILLER_RIGHTEQUIPMENTBUTTON;
        };

        // Crates

        class KPLIB_TransportTitle: KPLIB_EquipmentTitle {
            text = "$STR_KPLIB_DIALOG_CRATEFILLER_TITLETRANSPORT";
            x = KP_GETCX(KP_X_VAL_S,KP_WIDTH_VAL_S,1,2);
            y = KP_GETCY(KP_Y_VAL_S,KP_HEIGHT_VAL_S,0,48);
        };

        class KPLIB_ComboCargo: KPGUI_PRE_Combo {
            idc = KPLIB_IDC_CRATEFILLER_COMBOCARGO;
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

        // Inventory

        class KPLIB_InventoryTitle: KPLIB_TransportTitle {
            text = "$STR_KPLIB_DIALOG_CRATEFILLER_TITLEINVENTORY";
            y = KP_GETCY(KP_Y_VAL_S,KP_HEIGHT_VAL_S,5,48);
        };

        class KPLIB_ExportName: KPLIB_SearchBar {
            idc = KPLIB_IDC_CRATEFILLER_EXPORTNAME;
            x = KP_GETCX(KP_X_VAL_S,KP_WIDTH_VAL_S,2,4);
            y = KP_GETCY(KP_Y_VAL_S,KP_HEIGHT_VAL_S,8,48);
            w = KP_GETW(KP_WIDTH_VAL_S,4);
            tooltip = "$STR_KPLIB_DIALOG_CRATEFILLER_EXPORT_TT";
        };

        class KPLIB_ImportName: KPGUI_PRE_Combo {
            idc = KPLIB_IDC_CRATEFILLER_IMPORTNAME;
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

        class KPLIB_LeftInventoryListButton: KPGUI_PRE_BUTTON {
            idc = KPLIB_IDC_CRATEFILLER_LEFTINVENTORYBUTTON;
            text = "-";
            onButtonClick = "[687418] call KPLIB_fnc_cratefiller_removeEquipment";
        };

        class KPLIB_RightInventoryListButton: KPGUI_PRE_BUTTON {
            idc = KPLIB_IDC_CRATEFILLER_RIGHTINVENTORYBUTTON;
            text = "+";
            onButtonClick = "[687418] call KPLIB_fnc_cratefiller_addEquipment";
        };

        class KPLIB_InventoryList: KPGUI_PRE_ListNBox {
            idc = KPLIB_IDC_CRATEFILLER_INVENTORYLIST;
            x = KP_GETCX(KP_X_VAL_S,KP_WIDTH_VAL_S,1,2);
            y = KP_GETCY(KP_Y_VAL_S,KP_HEIGHT_VAL_S,12,48);
            w = KP_GETW(KP_WIDTH_VAL_S,2);
            h = KP_GETH(KP_HEIGHT_VAL_S,(48/34));

            columns[] = {0.05, 0.2, 0.3};

            idcLeft = KPLIB_IDC_CRATEFILLER_LEFTINVENTORYBUTTON;
            idcRight = KPLIB_IDC_CRATEFILLER_RIGHTINVENTORYBUTTON;
        };

        class KPLIB_ProgressBar : KPGUI_PRE_ProgressBar {
            idc = KPLIB_IDC_CRATEFILLER_PROGRESSBAR;
            x = KP_GETCX(KP_X_VAL_S,KP_WIDTH_VAL_S,0,1);
            y = KP_GETCY(KP_Y_VAL_S,KP_HEIGHT_VAL_S,46,48);
            w = KP_GETW(KP_WIDTH_VAL_S,1);
            h = KP_GETH(KP_HEIGHT_VAL_S,24);
            tooltip = "$STR_KPLIB_DIALOG_CRATEFILLER_FILLLEVEL_TT";
        };

        class KPLIB_DialogCross: KPGUI_PRE_DialogCrossS {};

    };

};
