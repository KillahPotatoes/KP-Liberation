/*
    KP Liberation resupply dialog

    File: KPLIB_resupply.hpp
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-02-21
    Last Update: 2019-05-04

    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        A small resupply dialog where you can resupply vehicles in FOB range.
*/

class KPLIB_resupply {
    idd = KPLIB_IDC_LOGISTIC_RESUPPLY_DIALOG;
    movingEnable = 0;
    onUnload = "KPLIB_logistic_activeCam cameraEffect [""terminate"",""back""]; camDestroy KPLIB_logistic_activeCam;";

    class controlsBackground {

        class KPLIB_DialogTitle: KPGUI_PRE_DialogTitleC {
            text = "$STR_KPLIB_DIALOG_RESUPPLY_TITLE";
        };

        class KPLIB_DialogArea: KPGUI_PRE_DialogBackgroundC {};

    };

    class controls {

        class KPLIB_ComboVehicles: KPGUI_PRE_Combo {
            idc = KPLIB_IDC_LOGISTIC_RESUPPLY_COMBOVEHICLES;
            x = KP_GETCX(KP_X_VAL_C,KP_WIDTH_VAL_C,0,1);
            y = KP_GETCY(KP_Y_VAL_C,KP_HEIGHT_VAL_C,1,48);
            w = KP_GETW(KP_WIDTH_VAL_C,(12/11));
            h = KP_GETH(KP_HEIGHT_VAL_C,24);
            tooltip = "$STR_KPLIB_DIALOG_RESUPPLY_VEHICLE_TT";
            onLBSelChanged = "KPLIB_logistic_activeCam cameraEffect [""terminate"",""back""]; camDestroy KPLIB_logistic_activeCam; [] call KPLIB_fnc_logistic_selectResupplyTarget";
        };

        class KPLIB_RefreshVehicles: KPGUI_PRE_CloseCross {
            text = "KPGUI\res\icon_refresh.paa";
            x = KP_GETCX(KP_X_VAL_C,KP_WIDTH_VAL_C,11,12);
            y = KP_GETCY(KP_Y_VAL_C,KP_HEIGHT_VAL_C,1,48);
            w = KP_GETW(KP_WIDTH_VAL_C,12);
            h = KP_GETH(KP_HEIGHT_VAL_C,24);
            tooltip = "$STR_KPLIB_REFRESH";
            action = "[7580232, 68740] call KPLIB_fnc_logistic_refreshTargets";
        };

        class KPLIB_ComboCargo: KPLIB_ComboVehicles {
            idc = KPLIB_IDC_LOGISTIC_RESUPPLY_COMBOCARGO;
            y = KP_GETCY(KP_Y_VAL_C,KP_HEIGHT_VAL_C,5,48);
            w = KP_GETW(KP_WIDTH_VAL_C,1);
            tooltip = "$STR_KPLIB_DIALOG_RESUPPLY_CARGO_TT";
            onLBSelChanged = "[] call KPLIB_fnc_logistic_selectResupplyTarget";
        };

        class KPLIB_TextCargoState: KPGUI_PRE_Text {
            text = "$STR_KPLIB_DIALOG_RESUPPLY_CARGOSTATE";
            style = 0;
            x = KP_GETCX(KP_X_VAL_C,KP_WIDTH_VAL_C,0,1);
            y = KP_GETCY(KP_Y_VAL_C,KP_HEIGHT_VAL_C,9,48);
            w = KP_GETW(KP_WIDTH_VAL_C,1);
            h = KP_GETH(KP_HEIGHT_VAL_C,24);
        };

        class KPLIB_TextCargoStateValue: KPGUI_PRE_Text {
            idc = KPLIB_IDC_LOGISTIC_RESUPPLY_CARGOSTATEVALUE;
            text = "---";
            style = 1;
            x = KP_GETCX(KP_X_VAL_C,KP_WIDTH_VAL_C,0,1);
            y = KP_GETCY(KP_Y_VAL_C,KP_HEIGHT_VAL_C,9,48);
            w = KP_GETW(KP_WIDTH_VAL_C,1);
            h = KP_GETH(KP_HEIGHT_VAL_C,24);
        };

        class KPLIB_TextCargoCosts: KPLIB_TextCargoState {
            text = "$STR_KPLIB_DIALOG_RESUPPLY_COSTS";
            y = KP_GETCY(KP_Y_VAL_C,KP_HEIGHT_VAL_C,13,48);
        };

        class KPLIB_TextCargoCostsValue: KPLIB_TextCargoStateValue {
            idc = KPLIB_IDC_LOGISTIC_RESUPPLY_CARGOCOSTSVALUE;
            y = KP_GETCY(KP_Y_VAL_C,KP_HEIGHT_VAL_C,13,48);
        };

        class KPLIB_SliderResupplyCount: KPGUI_PRE_Slider {
            idc = KPLIB_IDC_LOGISTIC_RESUPPLY_RESUPPLYCOUNT;
            x = KP_GETCX(KP_X_VAL_C,KP_WIDTH_VAL_C,0,1);
            y = KP_GETCY(KP_Y_VAL_C,KP_HEIGHT_VAL_C,17,48);
            w = KP_GETW(KP_WIDTH_VAL_C,1);
            h = KP_GETH(KP_HEIGHT_VAL_C,24);
            onSliderPosChanged = "[] call KPLIB_fnc_logistic_calcCosts";
        };

        class KPLIB_TextSlider: KPLIB_TextCargoState {
            text = "$STR_KPLIB_DIALOG_RESUPPLY_SLIDERVALUE";
            y = KP_GETCY(KP_Y_VAL_C,KP_HEIGHT_VAL_C,21,48);
        };

        class KPLIB_TextSliderValue: KPLIB_TextCargoStateValue {
            idc = KPLIB_IDC_LOGISTIC_RESUPPLY_SLIDERVALUE;
            y = KP_GETCY(KP_Y_VAL_C,KP_HEIGHT_VAL_C,21,48);
        };

        class KPLIB_TextTotalCosts: KPLIB_TextCargoState {
            text = "$STR_KPLIB_DIALOG_RESUPPLY_TOTALCOSTS";
            y = KP_GETCY(KP_Y_VAL_C,KP_HEIGHT_VAL_C,25,48);
        };

        class KPLIB_TextTotalCostsValue: KPLIB_TextCargoStateValue {
            idc = KPLIB_IDC_LOGISTIC_RESUPPLY_TOTALCOSTSVALUE;
            y = KP_GETCY(KP_Y_VAL_C,KP_HEIGHT_VAL_C,25,48);
        };

        class KPLIB_ResupplyCam: KPGUI_PRE_Picture {
            text = "#(argb,512,512,1)r2t(rtt,1.333)";
            x = KP_GETCX(KP_X_VAL_C,KP_WIDTH_VAL_C,0,1);
            y = KP_GETCY(KP_Y_VAL_C,KP_HEIGHT_VAL_C,31,48);
            w = KP_GETW(KP_WIDTH_VAL_C,1);
            h = KP_GETH(KP_HEIGHT_VAL_C,3);
        };

        class KPLIB_ButtonResupply: KPGUI_PRE_DialogButtonC {
            idc = KPLIB_IDC_LOGISTIC_RESUPPLY_BUTTONRESUPPLY;
            text = "$STR_KPLIB_DIALOG_BUTTON_RESUPPLY";
            action = "[] call KPLIB_fnc_logistic_resupplyTarget";
        };

        class KPLIB_DialogCross: KPGUI_PRE_DialogCrossC {
        };

    };
};
