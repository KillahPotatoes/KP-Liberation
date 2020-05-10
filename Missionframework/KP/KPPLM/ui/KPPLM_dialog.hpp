/*
    KP player menu dialog

    File: KPPLM_dialog.hpp
    Author: Wyqer - https://github.com/KillahPotatoes
    Date: 2018-08-03
    Last Update: 2018-11-10
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Provides various functionalities for the players like group management, view distances, etc.
*/

class KPPLM_dialog {
    idd = 75803;
    movingEnable = 0;
    // Fetch all player groups when opened and free the variable when closed
    onLoad = "KPPLM_groups = allGroups select {isPlayer (leader _x)}";
    onUnload = "KPPLM_groups = nil";

    class controlsBackground {

        class KP_DialogTitle: KPGUI_PRE_DialogTitleC {
            text = "$STR_KPPLM_TITLE";
        };

        class KP_DialogArea: KPGUI_PRE_DialogBackgroundC {};

        class KP_LabelPlayer: KPGUI_PRE_InlineTitle {
            text = "$STR_KPPLM_LABELPLAYER";
            x = KP_GETCX(KP_X_VAL_C,KP_WIDTH_VAL_C,0,1);
            y = KP_GETCY(KP_Y_VAL_C,KP_HEIGHT_VAL_C,0,16);
            w = KP_GETW(KP_WIDTH_VAL_C,1);
            h = KP_GETH(KP_HEIGHT_VAL_C,16);
        };

        class KP_TextRank: KPGUI_PRE_Text {
            idc = 758031;
            text = "$STR_KPPLM_RANK";
            x = KP_GETCX(KP_X_VAL_C,KP_WIDTH_VAL_C,0,1);
            y = KP_GETCY(KP_Y_VAL_C,KP_HEIGHT_VAL_C,1,16);
            w = KP_GETW(KP_WIDTH_VAL_C,2);
            h = KP_GETH(KP_HEIGHT_VAL_C,24);
        };

        class KP_TextScore: KP_TextRank {
            idc = 758033;
            text = "$STR_KPPLM_SCORE";
            y = KP_GETCY(KP_Y_VAL_C,KP_HEIGHT_VAL_C,5,48);
        };

        class KP_TextPlaytime: KP_TextRank {
            idc = 758035;
            text = "$STR_KPPLM_PLAYTIME";
            y = KP_GETCY(KP_Y_VAL_C,KP_HEIGHT_VAL_C,7,48);
        };

        class KP_NoRanks: KP_LabelPlayer {
            idc = 758037;
            style = 2;
            colorText[] = {0.8, 0, 0, 0.75};
            text = "$STR_KPPLM_NORANKS";
            y = KP_GETCY(KP_Y_VAL_C,KP_HEIGHT_VAL_C,3,32);
            sizeEx = KP_TEXT_L;
        };

        class KP_LabelGroups: KP_LabelPlayer {
            text = "$STR_KPPLM_LABELGROUPS";
            x = KP_GETCX(KP_X_VAL_C,KP_WIDTH_VAL_C,0,1);
            y = KP_GETCY(KP_Y_VAL_C,KP_HEIGHT_VAL_C,3,16);
            w = KP_GETW(KP_WIDTH_VAL_C,1);
            h = KP_GETH(KP_HEIGHT_VAL_C,16);
        };

        class KP_LabelView: KP_LabelPlayer {
            text = "$STR_KPPLM_LABELVIEW";
            y = KP_GETCY(KP_Y_VAL_C,KP_HEIGHT_VAL_C,1,2);
        };

        class KP_TextViewFoot: KPGUI_PRE_Text {
            text = "$STR_KPPLM_VIEWFOOT";
            x = KP_GETCX(KP_X_VAL_C,KP_WIDTH_VAL_C,1,2);
            y = KP_GETCY(KP_Y_VAL_C,KP_HEIGHT_VAL_C,9,16);
            w = KP_GETW(KP_WIDTH_VAL_C,2);
            h = KP_GETH(KP_HEIGHT_VAL_C,24);
        };

        class KP_TextViewVehicle: KP_TextViewFoot {
            text = "$STR_KPPLM_VIEWVEHICLE";
            y = KP_GETCY(KP_Y_VAL_C,KP_HEIGHT_VAL_C,29,48);
        };

        class KP_TextViewAir: KP_TextViewFoot {
            text = "$STR_KPPLM_VIEWAIR";
            y = KP_GETCY(KP_Y_VAL_C,KP_HEIGHT_VAL_C,31,48);
        };

        class KP_LabelMisc: KP_LabelPlayer {
            text = "$STR_KPPLM_LABELMISC";
            y = KP_GETCY(KP_Y_VAL_C,KP_HEIGHT_VAL_C,11,16);
        };

        class KP_TextTerrain: KP_TextRank {
            text = "$STR_KPPLM_TEXTTERRAIN";
            y = KP_GETCY(KP_Y_VAL_C,KP_HEIGHT_VAL_C,12,16);
        };

        class KP_TextTPV: KP_TextRank {
            text = "$STR_KPPLM_TEXTTPV";
            y = KP_GETCY(KP_Y_VAL_C,KP_HEIGHT_VAL_C,19,24);
        };

        class KP_TextRadio: KP_TextRank {
            text = "$STR_KPPLM_TEXTRADIO";
            y = KP_GETCY(KP_Y_VAL_C,KP_HEIGHT_VAL_C,10,12);
        };

        class KP_TextSound: KP_TextRank {
            text = "$STR_KPPLM_TEXTSOUND";
            y = KP_GETCY(KP_Y_VAL_C,KP_HEIGHT_VAL_C,22,24);
        };
    };

    class controls {

        class KPPLM_Version: KPGUI_PRE_DialogVersionIconC {
            tooltip = "$STR_KPPLM_VERSION";
        };

        class KP_PlayerRank: KPGUI_PRE_Text {
            idc = 758032;
            style = 2;
            text = "";
            x = KP_GETCX(KP_X_VAL_C,KP_WIDTH_VAL_C,1,2);
            y = KP_GETCY(KP_Y_VAL_C,KP_HEIGHT_VAL_C,1,16);
            w = KP_GETW(KP_WIDTH_VAL_C,2);
            h = KP_GETH(KP_HEIGHT_VAL_C,24);
        };

        class KP_PlayerScore: KP_PlayerRank {
            idc = 758034;
            text = "";
            y = KP_GETCY(KP_Y_VAL_C,KP_HEIGHT_VAL_C,5,48);
        };

        class KP_PlayerTime: KP_PlayerRank {
            idc = 758036;
            text = "";
            y = KP_GETCY(KP_Y_VAL_C,KP_HEIGHT_VAL_C,7,48);
        };

        class KP_GroupList: KPGUI_PRE_ListBox {
            idc = 758038;
            x = KP_GETCX(KP_X_VAL_C,KP_WIDTH_VAL_C,0,1);
            y = KP_GETCY(KP_Y_VAL_C,KP_HEIGHT_VAL_C,4,16);
            w = KP_GETW(KP_WIDTH_VAL_C,(4/3));
            h = KP_GETH(KP_HEIGHT_VAL_C,(24/5));
            onLBSelChanged = "ctrlSetText [758039, groupId (KPPLM_groups select (lbCurSel 758038))]";
        };

        class KP_ButtonJoin: KPGUI_PRE_InlineButton {
            text = "$STR_KPPLM_JOIN";
            x = KP_GETCX(KP_X_VAL_C,KP_WIDTH_VAL_C,3,4);
            y = KP_GETCY(KP_Y_VAL_C,KP_HEIGHT_VAL_C,4,16);
            w = KP_GETW(KP_WIDTH_VAL_C,4);
            h = KP_GETH(KP_HEIGHT_VAL_C,(48/5));
            onButtonClick = "[] call KPPLM_fnc_join";
        };

        class KP_ButtonCreate: KP_ButtonJoin {
            text = "$STR_KPPLM_CREATE";
            y = KP_GETCY(KP_Y_VAL_C,KP_HEIGHT_VAL_C,17,48);
            onButtonClick = "[] call KPPLM_fnc_create";
        };

        class KP_RenameEdit: KPGUI_PRE_EditBox {
            idc = 758039;
            x = KP_GETCX(KP_X_VAL_C,KP_WIDTH_VAL_C,0,1);
            y = KP_GETCY(KP_Y_VAL_C,KP_HEIGHT_VAL_C,11,24);
            w = KP_GETW(KP_WIDTH_VAL_C,(4/3));
            h = KP_GETH(KP_HEIGHT_VAL_C,24);
        };

        class KP_ButtonRename: KP_ButtonJoin {
            text = "$STR_KPPLM_RENAME";
            y = KP_GETCY(KP_Y_VAL_C,KP_HEIGHT_VAL_C,11,24);
            h = KP_GETH(KP_HEIGHT_VAL_C,24);
            onButtonClick = "[] call KPPLM_fnc_rename";
        };

        class KP_BoxViewFoot: KPGUI_PRE_EditBox {
            idc = 7580310;
            style = 65;
            x = KP_GETCX(KP_X_VAL_C,KP_WIDTH_VAL_C,1,4);
            y = KP_GETCY(KP_Y_VAL_C,KP_HEIGHT_VAL_C,9,16);
            w = KP_GETW(KP_WIDTH_VAL_C,4);
            h = KP_GETH(KP_HEIGHT_VAL_C,24);
        };

        class KP_BoxViewVehicle: KP_BoxViewFoot {
            idc = 7580311;
            y = KP_GETCY(KP_Y_VAL_C,KP_HEIGHT_VAL_C,29,48);
        };

        class KP_BoxViewAir: KP_BoxViewFoot {
            idc = 7580312;
            y = KP_GETCY(KP_Y_VAL_C,KP_HEIGHT_VAL_C,31,48);
        };

        class KP_ComboTerrain: KPGUI_PRE_Combo {
            idc = 7580313;
            x = KP_GETCX(KP_X_VAL_C,KP_WIDTH_VAL_C,1,2);
            y = KP_GETCY(KP_Y_VAL_C,KP_HEIGHT_VAL_C,12,16);
            w = KP_GETW(KP_WIDTH_VAL_C,2);
            h = KP_GETH(KP_HEIGHT_VAL_C,24);
        };

        class KP_ComboTPV: KP_ComboTerrain {
            idc = 7580314;
            y = KP_GETCY(KP_Y_VAL_C,KP_HEIGHT_VAL_C,19,24);
        };

        class KP_ComboRadio: KP_ComboTerrain {
            idc = 7580315;
            y = KP_GETCY(KP_Y_VAL_C,KP_HEIGHT_VAL_C,10,12);
        };

        class KP_TextSoundValue: KP_PlayerRank {
            idc = 7580316;
            y = KP_GETCY(KP_Y_VAL_C,KP_HEIGHT_VAL_C,22,24);
        };

        class KP_SliderSound: KPGUI_PRE_Slider {
            idc = 7580317;
            x = KP_GETCX(KP_X_VAL_C,KP_WIDTH_VAL_C,0,1);
            y = KP_GETCY(KP_Y_VAL_C,KP_HEIGHT_VAL_C,23,24);
            w = KP_GETW(KP_WIDTH_VAL_C,1);
            h = KP_GETH(KP_HEIGHT_VAL_C,24);
            tooltip = "$STR_KPPLM_TTSOUND";
            onSliderPosChanged = "ctrlSetText [7580316, format ['%1%2', round (_this select 1), '%']]";
        };

        class KP_ApplyButton: KPGUI_PRE_DialogButtonC {
            text = "$STR_KPPLM_APPLY";
            onButtonClick = "[] call KPPLM_fnc_save";
        };

        class KP_DialogCross: KPGUI_PRE_DialogCrossC {};
    };
};
